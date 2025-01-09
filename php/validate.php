<?php
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $enteredCode = $_POST['auth_code'];

    if ($enteredCode == $_SESSION['auth_code']) {
        echo "Code verified successfully! Order confirmed.";
        // Ovdje možete dodati logiku za potvrdu narudžbe
    } else {
        echo "Invalid code. Please try again.";
        // Opcionalno: ponovno prikazati formu za unos koda
    }
}
?>
