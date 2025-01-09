<?php
session_start();

// Provjera je li korisnik prijavljen kao administrator
if (!isset($_SESSION['username']) || $_SESSION['username'] !== 'admin') {
    header('Location: login.html');  // Ako nije prijavljen, preusmjesti ga na login stranicu
    exit();
}

// Povezivanje s bazom
$serverName = "localhost";
$username = "bruno";
$password = "bruno";
$dbName = "pizzeria";
$conn = mysqli_connect($serverName, $username, $password, $dbName);
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

// Provjera parametara za sortiranje
$sortBy = isset($_GET['sortBy']) ? $_GET['sortBy'] : 'narudzba_id'; // Defaultno sortiranje po narudzba_id
$sortOrder = isset($_GET['sortOrder']) && $_GET['sortOrder'] === 'desc' ? 'desc' : 'asc'; // Defaultno uzlazno
$date = isset($_GET['date']) ? $_GET['date'] : null;  // Ako je datum odabran, dohvatit ćemo ga

// SQL upit za dohvat narudžbi s opcijom sortiranja
$sql = "SELECT narudzba_id, cijena_narudzbe, datum_narudzbe, datum_dostave, korisnik_id, nacin_placanja_id, status_narudzbe FROM narudzbe";

// Ako je datum odabran, filtriramo po datumu
if ($date) {
    // Dodajemo filter za datum
    $sql .= " WHERE DATE(datum_narudzbe) = '$date'";
}

$sql .= " ORDER BY $sortBy $sortOrder"; // Sortiranje prema korisniku, cijeni ili bilo kojem drugom polju
$result = mysqli_query($conn, $sql);

// Provjera i ispisivanje podataka
if ($result) {
    $orders = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $orders[] = $row;
    }

    // Postavljanje zaglavlja i slanje podataka kao JSON
    header("Content-Type: application/json");
    echo json_encode($orders);
} else {
    echo json_encode(["error" => "SQL Error: " . mysqli_error($conn)]);
}

mysqli_close($conn);
?>
