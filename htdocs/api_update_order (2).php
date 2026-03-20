<?php
header('Content-Type: application/json');
include 'db.php';

// Get the data sent by JavaScript
$data = json_decode(file_get_contents("php://input"));

if (isset($data->id) && isset($data->status)) {
    $id = (int)$data->id;
    $status = $conn->real_escape_string($data->status);
    
    // Update the order status in the database
    $sql = "UPDATE orders SET status='$status' WHERE id=$id";
            
    if ($conn->query($sql) === TRUE) {
        echo json_encode(["success" => true, "message" => "Order updated!"]);
    } else {
        echo json_encode(["success" => false, "error" => $conn->error]);
    }
} else {
    echo json_encode(["success" => false, "error" => "Invalid data."]);
}

$conn->close();
?>