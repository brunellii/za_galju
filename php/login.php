<?php
session_start();

if ($_POST['username'] === 'admin' && $_POST['password'] === 'admin') {
    $_SESSION['username'] = 'admin';
    echo json_encode(['success' => true]);
} else {
    // Ovdje možete dodati grešku za debugging
    echo json_encode(['success' => false, 'message' => 'Invalid credentials']);
}
?>
