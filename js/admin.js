// Početno sortiranje po narudzba_id, asc
let currentSortOrder = 'asc';
let currentSortColumn = 'narudzba_id';
let selectedDate = null;  // Držimo varijablu za odabrani datum

// Funkcija za dohvat podataka
function fetchOrders(date = null) {
    // Ako je datum odabran, koristit ćemo ga kao filter, inače ostavljamo null
    let url = `get_orders.php?sortBy=${currentSortColumn}&sortOrder=${currentSortOrder}`;
    if (date) {
        url += `&date=${date}`;  // Dodajemo odabrani datum u URL
    }

    fetch(url)
        .then(response => response.json())
        .then(data => {
            const ordersTableBody = document.querySelector("#ordersTable tbody");
            ordersTableBody.innerHTML = ''; // Očisti prethodne redove

            if (!data || data.error) {
                console.error('Error fetching orders:', data.error);
                return;
            }

            // Dinamičko popunjavanje tablice redovima
            data.forEach(order => {
                const row = document.createElement("tr");

                row.innerHTML = `
                    <td>${order.narudzba_id}</td>
                    <td>${order.cijena_narudzbe}</td>
                    <td>${order.datum_narudzbe}</td>
                    <td>${order.datum_dostave}</td>
                    <td>${order.korisnik_id}</td>
                    <td>${order.nacin_placanja_id}</td>
                    <td>
                        <select onchange="updateStatus(${order.narudzba_id}, this.value)">
                            <option value="waiting" ${order.status_narudzbe === 'waiting' ? 'selected' : ''}>Waiting</option>
                            <option value="preparing" ${order.status_narudzbe === 'preparing' ? 'selected' : ''}>Preparing</option>
                            <option value="delivery" ${order.status_narudzbe === 'delivery' ? 'selected' : ''}>Delivery</option>
                            <option value="completed" ${order.status_narudzbe === 'completed' ? 'selected' : ''}>Completed</option>
                            <option value="canceled" ${order.status_narudzbe === 'canceled' ? 'selected' : ''}>Canceled</option>
                        </select>
                    </td>
                `;

                ordersTableBody.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

// Funkcija za filtriranje narudžbi prema odabranom datumu
function filterOrdersByDate() {
    selectedDate = document.querySelector("#calendar").value;  // Spremaj datum koji je odabran
    fetchOrders(selectedDate); // Ponovno dohvatimo podatke sa odabranim datumom
}

// Funkcija za sortiranje tablice
function sortTable(column) {
    // Promjena smjera sortiranja svaki put kad se klikne na isti stupac
    if (currentSortColumn === column) {
        currentSortOrder = currentSortOrder === 'asc' ? 'desc' : 'asc';
    } else {
        currentSortColumn = column;
        currentSortOrder = 'asc'; // Početno sortiranje je uzlazno
    }

    // Ponovno dohvatite podatke i sortirajte ih
    fetchOrders(selectedDate);  // Ako je datum odabran, proslijedite ga u fetch
}

// Funkcija za ažuriranje statusa narudžbe
function updateStatus(orderId, status) {
    fetch('update_orders.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `orderId=${orderId}&status=${status}`
    })
    .then(response => response.text())  // Promijeniti response.json() u response.text()
    .then(data => {
        console.log('Server Response:', data);  // Dodajte ovo za debugging, provjerite što dolazi sa servera
        try {
            const jsonResponse = JSON.parse(data);  // Pokušajte parsirati JSON samo ako je odgovor u ispravnom formatu
            if (jsonResponse.success) {
                alert('Status updated successfully');
                fetchOrders(selectedDate);  // Ponovno dohvatite narudžbe nakon uspješnog ažuriranja
            } else {
                alert('Failed to update order status');
            }
        } catch (error) {
            console.error('Error parsing JSON:', error);
            alert('Error occurred while updating status');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert('Error while updating order status');
    });
}

// Poziv za dohvat podataka prilikom učitavanja stranice
document.addEventListener('DOMContentLoaded', function() {
    fetchOrders(); // Dohvati podatke odmah kad se stranica učita
});
