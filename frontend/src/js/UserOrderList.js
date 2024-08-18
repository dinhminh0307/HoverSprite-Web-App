let orders = [];

const itemsPerPage = 30;
let currentPage = 1;
let isGridView = true;

const navBarURL = 'http://localhost:8080/userName';


function loadNavBar()
{
  document.addEventListener("DOMContentLoaded", function() {
    // Fetch the Navbar component
    var content = document.getElementById("navbar-container");
    sendRequestWithToken(navBarURL).then(data => content.innerHTML = returnNavBar(data.email))
    .catch(error => console.error(error));
    // content.innerHTML = returnNavBar(userData.email);
    // content.innerHTML = returnNavBarStyle();
    activeClick();
  });
  
}



function loadFooter()
{
  console.log('Hello  footer');
  document.addEventListener("DOMContentLoaded", function() {
    // Fetch the Navbar component
    var content = document.getElementById("footer-container");
    content.innerHTML = returnFooter();
  });
}


// Fetch Order From Testing Data
fetch('../js/fakeOrder.json')
    .then(response => response.json())
    .then(data => {
        orders = data.orders;
        renderOrders();
    })
    .catch(error => console.error('Error:', error));

function createOrderCard(order) {
    if (isGridView) {
        return `
            <div class="col-12 col-md-6 col-lg-4 mb-4">
                <div class="card h-100">
                    <div class="card-body">
                        <h5 class="card-title">Order #${order.id}</h5>
                        <p class="card-text">
                            <span class="badge bg-${getStatusColor(order.status)}">${order.status}</span><br>
                            <strong>Date:</strong> ${order.date}<br>
                            <strong>Crop Type:</strong> ${order.cropType}<br>
                            <strong>Area:</strong> ${order.area} decares<br>
                            <strong>Cost:</strong> ${order.cost.toLocaleString()} VND
                        </p>
                    </div>
                    <div class="card-footer bg-transparent border-0">
                        <a href="#" class="btn btn-success btn-sm w-100">View Details</a>
                    </div>
                </div>
            </div>
        `;
    } else {
        return `
            <div class="col-12 mb-4">
                <div class="card">
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-md-3 col-lg-2 mb-2 mb-md-0">
                                <h5 class="card-title mb-0">Order #${order.id}</h5>
                                <span class="badge bg-${getStatusColor(order.status)}">${order.status}</span>
                            </div>
                            <div class="col-md-3 col-lg-2 mb-2 mb-md-0">
                                <strong>Date:</strong> ${order.date}
                            </div>
                            <div class="col-md-2 mb-2 mb-md-0">
                                <strong>Crop:</strong> ${order.cropType}
                            </div>
                            <div class="col-md-2 mb-2 mb-md-0">
                                <strong>Area:</strong> ${order.area} decares
                            </div>
                            <div class="col-md-2 mb-2 mb-md-0">
                                <strong>Cost:</strong> ${order.cost.toLocaleString()} VND
                            </div>
                            <div class="col-md-3 col-lg-2">
                                <a href="#" class="btn btn-success btn-sm w-100">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        `;
    }
}

const toggleViewBtn = document.getElementById('toggleViewBtn');
toggleViewBtn.addEventListener('click', () => {
    isGridView = !isGridView;
    toggleViewBtn.innerHTML = isGridView ? '<i class="bi bi-list"></i> List View' : '<i class="bi bi-grid"></i> Grid View';
    renderOrders();
});


function getStatusColor(status) {
    switch (status) {
        case 'completed': return 'success';
        case 'in_progress': return 'primary';
        case 'confirmed': return 'info';
        case 'assigned': return 'warning';
        case 'cancelled': return 'danger';
        default: return 'secondary';
    }
}

function renderOrders() {
    console.log('Rendering orders...');
    const orderList = document.getElementById('orderList');
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const pageOrders = orders.slice(startIndex, endIndex);
    orderList.innerHTML = pageOrders.map(createOrderCard).join('');
    renderPagination();
}

function renderPagination() {
    const totalPages = Math.ceil(orders.length / itemsPerPage);
    const pagination = document.getElementById('pagination');
    let paginationHTML = '';

    for (let i = 1; i <= totalPages; i++) {
        paginationHTML += `
            <li class="page-item ${i === currentPage ? 'active' : ''}">
                <a class="page-link" href="#" data-page="${i}">${i}</a>
            </li>
        `;
    }

    pagination.innerHTML = paginationHTML;

    pagination.addEventListener('click', (e) => {
        e.preventDefault();
        if (e.target.tagName === 'A') {
            currentPage = parseInt(e.target.dataset.page);
            renderOrders();
        }
    });
}

// Initial render
renderOrders();

// Add event listeners for search and filters
document.getElementById('searchInput').addEventListener('input', filterOrders);
document.getElementById('statusFilter').addEventListener('change', filterOrders);
document.getElementById('dateFilter').addEventListener('change', filterOrders);

function filterOrders() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const statusFilter = document.getElementById('statusFilter').value;
    const dateFilter = document.getElementById('dateFilter').value;

    const filteredOrders = orders.filter(order => {
        const matchesSearch = order.id.toString().includes(searchTerm) ||
            order.cropType.toLowerCase().includes(searchTerm);
        const matchesStatus = statusFilter === '' || order.status === statusFilter;
        const matchesDate = dateFilter === '' || matchesDateFilter(order.date, dateFilter);

        return matchesSearch && matchesStatus && matchesDate;
    });

    currentPage = 1;
    orders.splice(0, orders.length, ...filteredOrders);
    renderOrders();
}

function matchesDateFilter(orderDate, filter) {
    const date = new Date(orderDate);
    const now = new Date();
    switch (filter) {
        case 'today':
            return date.toDateString() === now.toDateString();
        case 'this_week':
            const weekStart = new Date(now.setDate(now.getDate() - now.getDay()));
            return date >= weekStart;
        case 'this_month':
            return date.getMonth() === now.getMonth() && date.getFullYear() === now.getFullYear();
        case 'last_month':
            const lastMonth = new Date(now.getFullYear(), now.getMonth() - 1, 1);
            const lastMonthEnd = new Date(now.getFullYear(), now.getMonth(), 0);
            return date >= lastMonth && date <= lastMonthEnd;
        default:
            return true;
    }
}

// Dark mode toggle
const toggleModeBtn = document.getElementById('toggleModeBtn');
toggleModeBtn.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
    const isDarkMode = document.body.classList.contains('dark-mode');
    toggleModeBtn.innerHTML = isDarkMode ? '<i class="bi bi-sun"></i> Light Mode' : '<i class="bi bi-moon"></i> Dark Mode';
});

// Back to Top button
const backToTopBtn = document.getElementById('backToTop');
window.onscroll = function () {
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        backToTopBtn.style.display = "block";
    } else {
        backToTopBtn.style.display = "none";
    }
};

backToTopBtn.addEventListener('click', () => {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
});

console.log('Orders:', orders);
console.log('Current Page:', currentPage);


loadNavBar();
loadFooter();