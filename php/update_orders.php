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
$orderId = $_POST['orderId'];
$status = $_POST['status'];

// Provjera je li status validan
$validStatuses = ['waiting', 'preparing', 'delivery', 'completed', 'canceled'];
if (!in_array($status, $validStatuses)) {
    echo json_encode(["error" => "Invalid status"]);
    exit();
}

// Ažuriranje statusa narudžbe
$sql = "UPDATE narudzbe SET status_narudzbe = ? WHERE narudzba_id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("si", $status, $orderId);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["error" => "Failed to update status"]);
}

mysqli_close($conn);
?>
