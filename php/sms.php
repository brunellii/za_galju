<?php

function SendSMS($number, $poruka) {
    // Umjesto slanja stvarne SMS poruke, samo ispisujemo log
    echo "<p><strong>Simulacija slanja SMS-a:</strong></p>";
    echo "<p><strong>Broj:</strong> $number</p>";
    echo "<p><strong>Poruka:</strong> $poruka</p>";
    echo "<hr>"; // Dodajte razdjelnik za bolju preglednost logova


    $url = 'https://d91p1l.api.infobip.com/sms/2/text/advanced';

    // Set the headers
    $headers = array(
        'Authorization: App acf87e9cf26743a46c2449193e167d05-5e4537a1-a17f-4bb3-9a5c-1d7df474f7e0',
        'Content-Type: application/json',
        'Accept: application/json',
    );

    // Set the body
    $body = json_encode(array(
        'messages' => array(
            array(
                'destinations' => array(
                    array('to' => $number)
                ),
                'from' => 'ServiceSMS',
                'text' => $poruka
            )
        )
    ));

    // Initialize cURL
    $ch = curl_init();

    // Configure cURL options
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $body);

    // Send the request
    $response = curl_exec($ch);
    echo $response;

    // Check for errors
    if (curl_errno($ch)) {
        echo 'Error: ' . curl_error($ch);
    } else {
        // Get the HTTP status code
        $httpStatusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

        if ($httpStatusCode == 200) {
            echo $response;
        } else {
            echo 'Unexpected HTTP status: ' . $httpStatusCode;
        }
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['phone'])) {
        $phone = $_POST['phone'];
        $authCode = rand(1000, 9999); // Generira 4-znamenkasti slučajni broj
        $_SESSION['auth_code'] = $authCode; // Pohranjuje kod u sesiju
    
        $message = "Your code is: $authCode";
        SendSMS($phone, $message);
    
        // Preusmjerava korisnika na enter_code.php
        header("Location: enter_code.php");
        exit();
    }

    // Close the cURL session
    curl_close($ch);
}