<?php
header('Content-Type: application/json');
include 'db.php';

// Fetch all orders, newest first
$sql = "SELECT * FROM orders ORDER BY order_date DESC";
$result = $conn->query($sql);
$orders = array();

if ($result && $result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $orders[] = $row;
    }
}

echo json_encode($orders);
$conn->close();
?>