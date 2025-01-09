<!DOCTYPE html>
<html>
<head>
    <title>Enter Authorization Code</title>
</head>
<body>
    <form method="POST" action="validate_code.php">
        <label for="auth_code">Enter the code you received:</label>
        <input type="text" id="auth_code" name="auth_code" required>
        <button type="submit">Submit</button>
    </form>
</body>
</html>
