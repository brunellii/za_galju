// menuScript.js
let cart = JSON.parse(localStorage.getItem('cart')) || [];

function addToCart(name, price, quantity) {
    const itemIndex = cart.findIndex(item => item.name === name);

    if (itemIndex > -1) {
        cart[itemIndex].quantity += quantity;
    } else {
        cart.push({ name, price, quantity });
    }

    localStorage.setItem('cart', JSON.stringify(cart));
    alert(name + ' added to cart!');
}
