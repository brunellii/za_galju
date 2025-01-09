document.getElementById('loginForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();

    // Slanje podataka na server putem POST zahtjeva
    fetch('login.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `username=${username}&password=${password}`
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log("Preusmjeravam na admin.html...");
            window.location.href = 'admin.html';  // Preusmjeravanje na admin stranicu
        } else {
            console.log("Pogrešni podaci. Ostajete na login stranici.");
            alert('Invalid username or password. Please try again.');
        }
    })
    .catch(error => console.error('Error:', error));
});
