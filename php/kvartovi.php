<?php
$serverName = "localhost";
$username = "bruno";
$password = "bruno";
$dbName = "pizzeria";

// Create a connection
$conn = mysqli_connect($serverName, $username, $password, $dbName);

// Check the connection
if ($conn === false) {
    die("Connection failed: " . mysqli_connect_error());
}

// Query to get all places
$sql = "SELECT mjesto_id, naziv, post_broj FROM mjesta ORDER BY naziv";
$result = mysqli_query($conn, $sql);

$places = array();
while ($row = mysqli_fetch_assoc($result)) {
    $places[] = $row;
}

mysqli_close($conn);

// Return data as JSON
header('Content-Type: application/json');
echo json_encode($places);
?>
