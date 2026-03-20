# Luxe Fashion - Full-Stack E-Commerce Platform 

A fully responsive, full-stack e-commerce web application built with a custom JavaScript frontend, a secure PHP/MySQL backend, and live Safaricom M-Pesa STK Push integration. 

This project was developed as a comprehensive demonstration of full-stack web architecture, responsive UI/UX design, and secure third-party API payment integration.

##  Key Features

### User Experience (Storefront)
* **Responsive Design:** Mobile-first architecture utilizing CSS Grid , ensuring perfect rendering across desktops, tablets, and mobile devices.
* **Smart Shopping Cart:** Asynchronous, dynamically updating cart with a scroll-aware sidebar that prevents UI overlap on mobile devices.
* **Dynamic Filtering & Search:** Real-time product sorting by category (Shoes, Bags, Clothing) and a live search bar.
* **No-Reload Architecture:** Powered by  JS and the Fetch API to provide a seamless, app-like experience without page refreshes.

### Payment Integration
* **Safaricom Daraja API:** Live M-Pesa Express (STK Push) checkout. 
* Automatically formats Kenyan phone numbers to the required `254` format.
* Secures order data in the MySQL database as "Pending" before safely triggering the PIN prompt on the customer's phone.

### Management Backend (Admin Dashboard)
* **Hidden Secure Portal:** Admin gateway protected by session storage authentication.
* **Inventory Management:** Add, delete, and seamlessly update product names, prices, and stock quantities in real-time.
* **Order Tracking:** View customer delivery details and mark pending M-Pesa orders as "Completed".

##  Tech Stack

* **Frontend:** HTML5, CSS3,  JavaScript 
* **Backend:** PHP 8+
* **Database:** MySQL (Relational Database)
* **Payment Gateway:** Safaricom Daraja API (M-Pesa Express)

## 🚀 How to Run Locally

If you want to run this project on your local machine (using XAMPP, WAMP, or similar)
