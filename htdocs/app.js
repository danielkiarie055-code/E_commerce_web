let allProducts = [], allOrders = [], cart = [];

// --- DATABASE FETCHING ---
async function fetchDatabase() {
    try {
        const response = await fetch('api_get.php');
        allProducts = await response.json();
        if (document.getElementById('product-container')) filterUI('all'); 
        if (document.getElementById('admin-table')) renderAdmin(); 
    } catch (error) { console.error("Fetch error:", error); }
}

async function fetchOrders() {
    try {
        const response = await fetch('api_get_orders.php');
        allOrders = await response.json();
        if (document.getElementById('orders-table')) renderOrders();
    } catch (error) { console.error("Fetch orders error:", error); }
}

// --- STOREFRONT LOGIC ---
window.filterUI = function(category) {
    const container = document.getElementById('product-container');
    const title = document.getElementById('category-title');
    if (!container) return; 
    
    document.getElementById('search-bar').value = '';
    container.innerHTML = ''; 
    title.innerText = category === 'all' ? 'All Products' : category.replace(/_/g, ' ') + " Collection";
    
    let filtered;
    if (category === 'all') {
        filtered = allProducts;
    } else {
        filtered = allProducts.filter(p => p.category.toLowerCase() === category.toLowerCase());
        if (filtered.length === 0) {
            let cat = category.toLowerCase();
            if (cat === 'casual_shoes' || cat === 'formal_shoes' || cat === 'boots' || cat.includes('shoe')) {
                filtered = allProducts.filter(p => p.category.toLowerCase().includes('shoe') || p.category.toLowerCase().includes('boot'));
            } else if (cat === 'everyday_bags' || cat === 'travel_bags' || cat.includes('bag')) {
                filtered = allProducts.filter(p => p.category.toLowerCase().includes('bag'));
            }
        }
    }
    renderProductCards(filtered, container);
}

window.searchProducts = function() {
    const query = document.getElementById('search-bar').value.toLowerCase();
    const container = document.getElementById('product-container');
    const title = document.getElementById('category-title');
    if (!container) return;
    
    container.innerHTML = '';
    title.innerText = query ? `Search Results for "${query}"` : 'All Products';
    const filtered = allProducts.filter(p => p.name.toLowerCase().includes(query) || p.category.toLowerCase().includes(query));
    renderProductCards(filtered, container);
}

function renderProductCards(arr, container) {
    if (arr.length === 0) { container.innerHTML = '<p style="grid-column: 1/-1; text-align:center; padding: 50px;">No items found.</p>'; return; }
    arr.forEach(p => {
        let currentRating = p.rating ? Math.round(p.rating) : 0;
        let ratingCount = p.rating_count ? p.rating_count : 0;
        let stars = '★'.repeat(currentRating) + '☆'.repeat(5 - currentRating);
        let outOfStock = parseInt(p.stock) <= 0;
        let imagePath = p.image.includes('/') ? p.image : `uploads/${p.image}`;
        
        container.innerHTML += `
            <div class="product-card">
                <img src="${imagePath}">
                <h3>${p.name}</h3>
                <div style="color:#f39c12; margin-bottom:5px;">${stars} <span style="color:#888; font-size:14px;">(${ratingCount})</span></div>
                <p style="color:#d3a052; font-weight:bold; font-size:20px; margin-bottom:15px;">Ksh ${parseInt(p.price).toLocaleString()}</p>
                
                <div class="rate-product" style="margin-bottom: 15px;">
                    <span style="font-size: 12px; color: #666; display: block;">Rate this item:</span>
                    <span style="cursor: pointer; color: #ccc; font-size: 20px;" onclick="rateProduct(${p.id}, 1)">★</span>
                    <span style="cursor: pointer; color: #ccc; font-size: 20px;" onclick="rateProduct(${p.id}, 2)">★</span>
                    <span style="cursor: pointer; color: #ccc; font-size: 20px;" onclick="rateProduct(${p.id}, 3)">★</span>
                    <span style="cursor: pointer; color: #ccc; font-size: 20px;" onclick="rateProduct(${p.id}, 4)">★</span>
                    <span style="cursor: pointer; color: #ccc; font-size: 20px;" onclick="rateProduct(${p.id}, 5)">★</span>
                </div>
                ${outOfStock ? '<p style="color:red; font-weight:bold;">Out of Stock</p>' : `<button style="padding:12px; background:#111; color:white; border:none; border-radius:4px; font-weight:bold; cursor:pointer; width:100%;" onclick="addToCart(${p.id}, '${p.name.replace(/'/g, "\\'")}', ${p.price}, '${imagePath}')">Add to Bag</button>`}
            </div>`;
    });
}

// --- CART LOGIC ---
window.addToCart = (id, name, price, image) => {
    let p = allProducts.find(x => x.id == id), inCart = cart.find(x => x.id == id);
    if (inCart && inCart.qty >= p.stock) return alert("Stock limit reached!");
    if (inCart) inCart.qty++; else cart.push({id, name, price, image, qty: 1});
    updateCartUI(); document.getElementById('cart-sidebar').classList.add('open');
};

function updateCartUI() {
    let h = '', t = 0, c = 0;
    cart.forEach(x => { 
        t += x.price * x.qty; c += x.qty; 
        h += `<div style="display:flex; gap:10px; padding:10px 0; border-bottom:1px solid #eee;">
                <img src="${x.image}" width="60" height="60" style="object-fit:cover; border-radius:4px;">
                <div style="flex-grow:1;">
                    <h4 style="font-size:14px; margin-bottom:4px;">${x.name}</h4>
                    <p style="font-size:13px; color:#555;">Ksh ${parseInt(x.price).toLocaleString()} x ${x.qty}</p>
                    <button onclick="removeFromCart(${x.id})" style="color:red; background:none; border:none; cursor:pointer; font-size:12px; padding:0; margin-top:5px;">Remove</button>
                </div>
              </div>`; 
    });
    document.getElementById('cart-items').innerHTML = h;
    document.getElementById('cart-total').innerText = t.toLocaleString();
    document.getElementById('cart-count').innerText = c;
}

window.removeFromCart = (id) => { cart = cart.filter(x => x.id != id); updateCartUI(); };

function adjustCartHeight() {
    const footer = document.querySelector('footer');
    const cartSidebar = document.getElementById('cart-sidebar');
    if (!footer || !cartSidebar) return;
    const footerTop = footer.getBoundingClientRect().top;
    const windowHeight = window.innerHeight;
    if (footerTop < windowHeight) {
        cartSidebar.style.height = footerTop + 'px';
    } else {
        cartSidebar.style.height = '100vh'; 
    }
}
window.addEventListener('scroll', adjustCartHeight);
window.addEventListener('resize', adjustCartHeight);

window.toggleCart = () => { 
    adjustCartHeight(); 
    document.getElementById('cart-sidebar').classList.toggle('open'); 
};

// --- NEW CENTERED MODAL LOGIC ---
window.showCheckoutForm = () => { 
    if(!cart.length) return alert("Bag is empty!"); 
    
    // Close the cart sidebar
    document.getElementById('cart-sidebar').classList.remove('open'); 
    
    // Copy the total price to the modal button
    document.getElementById('modal-total').innerText = document.getElementById('cart-total').innerText;
    
    // Open the centered modal
    document.getElementById('checkout-modal').style.display = 'flex'; 
};

window.closeCheckoutModal = () => {
    document.getElementById('checkout-modal').style.display = 'none';
};

// --- M-PESA CHECKOUT ---
window.submitOrder = async () => {
    let customerName = document.getElementById('c-name').value;
    let rawPhone = document.getElementById('c-phone').value;
    let address = document.getElementById('c-address').value;
    let totalAmount = document.getElementById('cart-total').innerText.replace(/,/g,'');
    
    if(!customerName || !rawPhone || !address) return alert("Please fill all details!");

    let formattedPhone = rawPhone.trim();
    if (formattedPhone.startsWith('0')) formattedPhone = '254' + formattedPhone.substring(1);
    else if (formattedPhone.startsWith('+254')) formattedPhone = formattedPhone.substring(1);

    if (formattedPhone.length !== 12) return alert("Invalid phone. Use 07XXXXXXXX format.");

    const orderData = { customer_name: customerName, phone: formattedPhone, address: address, total_amount: totalAmount, cart: cart };
    
    // Change button text
    const btn = document.getElementById('final-pay-btn');
    const originalContent = btn.innerHTML;
    btn.innerHTML = "Processing...";

    try {
        const res = await fetch('api_checkout.php', { method: 'POST', body: JSON.stringify(orderData) });
        const orderResponse = await res.json();
        
        if(orderResponse.success) {
            alert("Initiating M-Pesa STK Push to " + formattedPhone + ". Please check your phone.");
            fetch('mpesa_push.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ phone: formattedPhone, total_amount: totalAmount })
            }).then(response => response.text()).then(data => console.log("Safaricom:", data));

            cart = []; 
            updateCartUI(); 
            closeCheckoutModal(); // Close modal on success
            fetchDatabase(); 
            fetchOrders(); 
        } else { 
            alert("Database Error: " + orderResponse.error); 
            btn.innerHTML = originalContent;
        }
    } catch (e) { 
        alert("Network error."); 
        console.error(e); 
        btn.innerHTML = originalContent;
    }
};

// --- ADMIN LOGIC ---
window.rateProduct = async (id, r) => { 
    alert(`Thank you for rating this product ${r} stars!`);
    await fetch('api_rate.php', { method: 'POST', body: JSON.stringify({id, rating: r}) }); 
    fetchDatabase(); 
};

window.renderAdmin = () => {
    let h = '';
    allProducts.forEach(p => { 
        let imagePath = p.image.includes('/') ? p.image : `uploads/${p.image}`;
        h += `<tr>
                <td><img src="${imagePath}" width="40" height="40" style="object-fit:cover; border-radius:4px;"></td>
                <td>${p.name}</td>
                <td>Ksh ${p.price}</td>
                <td>${p.stock}</td>
                <td>
                    <button class="action-btn btn-edit" onclick="openEdit(${p.id})">Edit</button>
                    <button class="action-btn btn-delete" onclick="deleteProd(${p.id})">Del</button>
                </td>
              </tr>`; 
    });
    document.getElementById('admin-table').innerHTML = h;
};

window.renderOrders = () => {
    let h = '';
    allOrders.forEach(o => { h += `<tr><td>#${o.id}</td><td>${o.customer_name}</td><td>Ksh ${o.total_amount}</td><td>${o.status}</td><td><button class="action-btn btn-complete" onclick="updateOrder(${o.id},'Completed')">Complete</button></td></tr>`; });
    document.getElementById('orders-table').innerHTML = h;
};

window.deleteProd = async (id) => { if(confirm("Delete product?")) { await fetch('api_action.php', {method:'POST', body:JSON.stringify({action:'delete', id})}); fetchDatabase(); } };
window.updateOrder = async (id, s) => { await fetch('api_update_order.php', {method:'POST', body:JSON.stringify({id, status:s})}); fetchOrders(); };

window.addProduct = async (event) => {
    event.preventDefault(); 
    const formData = new FormData();
    formData.append('name', document.getElementById('p-name').value);
    formData.append('category', document.getElementById('p-category').value);
    formData.append('price', document.getElementById('p-price').value);
    formData.append('stock', document.getElementById('p-stock').value);
    const fileInput = document.getElementById('p-image');
    if (fileInput.files.length > 0) formData.append('image', fileInput.files[0]);
    else return alert("Select an image first.");

    try {
        const res = await fetch('api_add_product.php', { method: 'POST', body: formData });
        const data = await res.json();
        if(data.success) { alert("Product uploaded!"); document.getElementById('add-product-form').reset(); fetchDatabase(); } 
        else alert("Error: " + data.error);
    } catch (e) { alert("Server error."); }
};

window.openEdit = (id) => {
    let p = allProducts.find(x => x.id == id);
    if(p) {
        document.getElementById('edit-id').value = p.id;
        document.getElementById('edit-name').value = p.name;
        document.getElementById('edit-price').value = p.price;
        document.getElementById('edit-stock').value = p.stock; 
        document.getElementById('edit-modal').style.display = 'flex';
    }
};

window.saveEdit = async (event) => {
    event.preventDefault();
    const updatedData = {
        id: document.getElementById('edit-id').value,
        name: document.getElementById('edit-name').value,
        price: document.getElementById('edit-price').value,
        stock: document.getElementById('edit-stock').value 
    };

    try {
        const res = await fetch('api_edit_product.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(updatedData)
        });
        const data = await res.json();
        if(data.success) {
            alert("Product details updated successfully!");
            document.getElementById('edit-modal').style.display = 'none';
            fetchDatabase(); 
        } else {
            alert("Error saving update: " + data.error);
        }
    } catch (error) {
        console.error("Error:", error);
        alert("Failed to connect to the database.");
    }
};

document.addEventListener('DOMContentLoaded', () => { fetchDatabase(); fetchOrders(); });