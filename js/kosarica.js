document.addEventListener('DOMContentLoaded', () => {
    loadCart();
});

function loadCart() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const tbody = document.querySelector('table tbody');
    tbody.innerHTML = '';  // Clear existing rows

    cart.forEach((item, index) => {
        const row = tbody.insertRow();
        row.insertCell(0).textContent = item.name;
        row.insertCell(1).textContent = `${item.price} $`;

        // Količina i dugmadi za promenu količine
        const quantityCell = row.insertCell(2);
        quantityCell.textContent = item.quantity;

        const increaseButton = document.createElement('button');
        increaseButton.textContent = '+';
        increaseButton.addEventListener('click', () => updateQuantity(index, item.quantity + 1));

        const decreaseButton = document.createElement('button');
        decreaseButton.textContent = '-';
        decreaseButton.addEventListener('click', () => {
            if (item.quantity > 1) {
                updateQuantity(index, item.quantity - 1);
            } else {
                // Ako je količina 1 i korisnik klikne na "-", ukloni stavku
                updateQuantity(index, 0);
            }
        });

        const buttonsCell = row.insertCell(3);
        buttonsCell.appendChild(increaseButton);
        buttonsCell.appendChild(decreaseButton);

        // Prikaz ukupnog iznosa za stavku
        row.insertCell(4).textContent = `${item.quantity * item.price} $`;

        // Dugme za uklanjanje stavke iz košarice
        const removeCell = row.insertCell(5);
        const removeButton = document.createElement('button');
        removeButton.textContent = 'Remove';
        removeButton.addEventListener('click', () => removeFromCart(index));
        removeCell.appendChild(removeButton);
    });

    updateTotalPrice();
}

function updateQuantity(index, newQuantity) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const item = cart[index];

    if (item) {
        // Ako je nova količina 0 ili manja, uklonite stavku
        if (newQuantity <= 0) {
            removeFromCart(index);
        } else {
            item.quantity = newQuantity;
            localStorage.setItem('cart', JSON.stringify(cart));
            loadCart();  // Učitaj ponovo košaricu sa ažuriranim podacima
        }
    }
}

function removeFromCart(index) {
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    cart.splice(index, 1);
    localStorage.setItem('cart', JSON.stringify(cart));
    loadCart();  // Učitaj ponovo košaricu
}

function updateTotalPrice() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const total = cart.reduce((acc, item) => acc + item.price * item.quantity, 0);
    document.getElementById('totalPrice').textContent = `${total} $`;
}

function clearCart() {
    localStorage.removeItem('cart');
    loadCart();  // Učitaj ponovo košaricu
}

function checkout() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    if (cart.length === 0) {
        alert("Your cart is empty! Add products before you continue to order.");
        return;
    }

    let pizzaTypes = cart.map(item => `${item.name} x${item.quantity}`).join(', ');
    let totalPrice = cart.reduce((acc, item) => acc + item.price * item.quantity, 0);

    // Otvorite checkout.html stranicu
    const checkoutWindow = window.open('checkout.html', 'Checkout', 'height=800,width=500');
    checkoutWindow.onload = function() {
        const pizzaTypeElement = checkoutWindow.document.getElementById('pizzaType');
        const priceElement = checkoutWindow.document.getElementById('price');
        
        if (pizzaTypeElement && priceElement) {
            pizzaTypeElement.value = pizzaTypes;
            priceElement.value = `${totalPrice} $`;
        }
    };
}
