<?php
session_start();

// Provjera je li korisnik prijavljen kao administrator
if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
    echo json_encode(["error" => "Not authorized"]);
    exit();
}

// Povezivanje s bazom
$serverName = "localhost";
$username = "bruno";
$password = "bruno";
$dbName = "pizzeria";
$conn = mysqli_connect($serverName, $username, $password, $dbName);

if (!$conn) {
    echo json_encode(["error" => "Connection failed: " . mysqli_connect_error()]);
    exit();
}

// Dohvat podataka iz POST zahtjeva
$orderId = $_POST['order_id'];

// Provjera statusa narudžbe
$sqlCheckStatus = "SELECT status_narudzbe FROM narudzbe WHERE narudzba_id = ?";
$stmtCheckStatus = $conn->prepare($sqlCheckStatus);
$stmtCheckStatus->bind_param("i", $orderId);
$stmtCheckStatus->execute();
$result = $stmtCheckStatus->get_result();
$order = $result->fetch_assoc();

// Provjeravamo status narudžbe
if ($order && in_array($order['status_narudzbe'], ['completed', 'canceled'])) {

    // Premještanje podataka u backup tablicu
    $sqlBackup = "INSERT INTO bkp_narudzbe (narudzba_id, cijena_narudzbe, datum_narudzbe, datum_dostave, korisnik_id, nacin_placanja_id, status_narudzbe) 
                  SELECT narudzba_id, cijena_narudzbe, datum_narudzbe, datum_dostave, korisnik_id, nacin_placanja_id, status_narudzbe 
                  FROM narudzbe WHERE narudzba_id = ?";
    $stmtBackup = $conn->prepare($sqlBackup);
    $stmtBackup->bind_param("i", $orderId);

    if ($stmtBackup->execute()) {
        // Ako je premještanje uspješno, brišemo narudžbu iz glavne tablice
        $sqlDelete = "DELETE FROM narudzbe WHERE narudzba_id = ?";
        $stmtDelete = $conn->prepare($sqlDelete);
        $stmtDelete->bind_param("i", $orderId);

        if ($stmtDelete->execute()) {
            echo json_encode(["success" => true]);
        } else {
            echo json_encode(["error" => "Failed to delete order: " . $stmtDelete->error]);  // Prikazivanje točne pogreške
        }
    } else {
        echo json_encode(["error" => "Failed to backup order: " . $stmtBackup->error]);  // Prikazivanje točne pogreške
    }
} else {
    echo json_encode(["error" => "Order cannot be deleted because its status is not 'completed' or 'canceled'"]);
}

mysqli_close($conn);
?>
