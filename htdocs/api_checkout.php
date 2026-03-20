<?php
header('Content-Type: application/json');
include 'db.php';
$data = json_decode(file_get_contents("php://input"));
if (isset($data->customer_name)) {
    $name = $conn->real_escape_string($data->customer_name);
    $phone = $conn->real_escape_string($data->phone);
    $addr = $conn->real_escape_string($data->address);
    $total = (int)$data->total_amount;
    $cart = $conn->real_escape_string(json_encode($data->cart));
    $sql = "INSERT INTO orders (customer_name, phone, address, total_amount, cart_items) VALUES ('$name', '$phone', '$addr', $total, '$cart')";
    if ($conn->query($sql)) {
        foreach ($data->cart as $item) {
            $id = (int)$item->id; $qty = (int)$item->qty;
            $conn->query("UPDATE products SET stock = stock - $qty WHERE id = $id");
        }
        echo json_encode(["success" => true]);
    }
}
$conn->close();
?>