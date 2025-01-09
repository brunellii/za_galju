<?php
include 'sms.php';
$serverName = "localhost";
$username = "bruno";
$password = "bruno";
$dbName = "pizzeria";

// kreiranje poveznice
$conn = mysqli_connect($serverName, $username, $password, $dbName);

// provjera poveznice s bazom
if ($conn === false) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check for required fields
    $requiredFields = ['fullName', 'address', 'email', 'phone', 'price', 'quantity', 'pizzaData', 'place'];
    foreach ($requiredFields as $field) {
        if (!isset($_POST[$field])) {
            die("Missing field: $field");
        }
    }

    // Priprema podataka
    $fullName = $_POST['fullName'];
    $address = $_POST['address'];
    $email = $_POST['email'];
    $phone = $_POST['phone'];
    $price = $_POST['price'];
    $quantity = $_POST['quantity'];
    $pizzaDataJson = $_POST['pizzaData'];
    $placeId = $_POST['place'];
    $paymentMethod = isset($_POST['payWithCash']) ? 'cash' : 'card';

    SendSMS($phone, 'Your code is: $authCode');

    // mapiranje payment method to ID
    $paymentMethodId = ($paymentMethod === 'cash') ? 1 : 2;

    // Decode pizzaData JSON
    $pizzaData = json_decode($pizzaDataJson, true);

    // početak transakcije
    mysqli_begin_transaction($conn);
// 
    try {
        // Provjerite postojanje 'placeId' u tablici 'mjesta'
        $placeCheckQuery = "SELECT mjesto_id FROM mjesta WHERE mjesto_id = ?";
        $stmtPlaceCheck = mysqli_prepare($conn, $placeCheckQuery);
        if ($stmtPlaceCheck === false) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        mysqli_stmt_bind_param($stmtPlaceCheck, "i", $placeId);
        mysqli_stmt_execute($stmtPlaceCheck);
        $resultPlaceCheck = mysqli_stmt_get_result($stmtPlaceCheck);

        if (mysqli_num_rows($resultPlaceCheck) === 0) {
            throw new Exception("Invalid place ID." .$placeId);
        }

        // kreiranje novog korisnika bez obzira postoji li već u bazi podataka
        $sqlUser = "INSERT INTO korisnici (ime_prezime, ulica_br, mjesto_id, email, broj_mobitela) VALUES (?, ?, ?, ?, ?)";
        $stmtUser = mysqli_prepare($conn, $sqlUser);
        if ($stmtUser === false) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        mysqli_stmt_bind_param($stmtUser, "sssss", $fullName, $address, $placeId, $email, $phone);
        if (!mysqli_stmt_execute($stmtUser)) {
            throw new Exception("Execute failed: " . mysqli_stmt_error($stmtUser));
        }
        $userId = mysqli_insert_id($conn);

        // Pohranjivanje narudzbe
        $sqlOrder = "INSERT INTO narudzbe (cijena_narudzbe, datum_dostave, datum_narudzbe, korisnik_id, nacin_placanja_id, status_narudzbe) 
VALUES (?, DATE_ADD(SYSDATE(), INTERVAL 1 DAY), SYSDATE(), ?, ?, 'u cekanju')";

        $stmtOrder = mysqli_prepare($conn, $sqlOrder);
        if ($stmtOrder === false) {
            throw new Exception("Prepare failed: " . mysqli_error($conn));
        }
        mysqli_stmt_bind_param($stmtOrder, "dii", $price, $userId, $paymentMethodId);
        if (!mysqli_stmt_execute($stmtOrder)) {
            throw new Exception("Execute failed: " . mysqli_stmt_error($stmtOrder));
        }
        $orderId = mysqli_insert_id($conn);

        // Insert each pizza item into the order items table
        foreach ($pizzaData as $item) {
            $pizzaName = $item['name'];
            $quantity = $item['quantity'];

            // Retrieve the pizza type ID and price
            $sqlFoodType = "SELECT vrsta_hrane_id, vazeca_cijena FROM vrsta_hrane WHERE naziv = ?";
            $stmtFoodType = mysqli_prepare($conn, $sqlFoodType);
            if ($stmtFoodType === false) {
                throw new Exception("Prepare failed: " . mysqli_error($conn));
            }
            mysqli_stmt_bind_param($stmtFoodType, "s", $pizzaName);
            mysqli_stmt_execute($stmtFoodType);
            $result = mysqli_stmt_get_result($stmtFoodType);
            $foodTypeData = mysqli_fetch_assoc($result);

            if (!$foodTypeData) {
                throw new Exception("Invalid pizza type: " . $pizzaName);
            }
            $foodTypeId = $foodTypeData['vrsta_hrane_id'];
            $itemPrice = $foodTypeData['vazeca_cijena'];

            // Insert each pizza type into the order items table
            $sqlOrderItem = "INSERT INTO stavke_narudzbe (narudzba_id, vrsta_hrane_id, kolicina, cijena_stavke) VALUES (?, ?, ?, ?)";
            $stmtOrderItem = mysqli_prepare($conn, $sqlOrderItem);
            if ($stmtOrderItem === false) {
                throw new Exception("Prepare failed: " . mysqli_error($conn));
            }
            mysqli_stmt_bind_param($stmtOrderItem, "iiid", $orderId, $foodTypeId, $quantity, $itemPrice);
            if (!mysqli_stmt_execute($stmtOrderItem)) {
                throw new Exception("Execute failed: " . mysqli_stmt_error($stmtOrderItem));
            }
        }

        // Commit transaction
        mysqli_commit($conn);

        // slanje maila preko server.js
        $ch = curl_init('http://localhost:3000/send-timer');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode(['email' => $email]));
        curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
        $response = curl_exec($ch);
        curl_close($ch);

        echo "<script>
            alert('Thank you for your order!');
            // Clear localStorage to remove cart data
            localStorage.removeItem('cart');
            // Close the current tab
            window.close();
            window.opener.location.href = 'index.html';
        </script>";
    } catch (Exception $e) {
        // Rollback transaction on error
        mysqli_rollback($conn);
        echo "Error: " . $e->getMessage();
    } finally {
        // Close statements and connection
        if (isset($stmtUser) && $stmtUser !== false) mysqli_stmt_close($stmtUser);
        if (isset($stmtOrder) && $stmtOrder !== false) mysqli_stmt_close($stmtOrder);
        if (isset($stmtFoodType) && $stmtFoodType !== false) mysqli_stmt_close($stmtFoodType);
        if (isset($stmtOrderItem) && $stmtOrderItem !== false) mysqli_stmt_close($stmtOrderItem);
        if (isset($stmtPlaceCheck) && $stmtPlaceCheck !== false) mysqli_stmt_close($stmtPlaceCheck);
        mysqli_close($conn);
    }
} else {
    die("Invalid request method.");
}
?>
