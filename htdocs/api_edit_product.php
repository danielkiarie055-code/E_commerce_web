<?php
require 'db.php'; 

$data = json_decode(file_get_contents('php://input'), true);

if(isset($data['id']) && isset($data['price']) && isset($data['name']) && isset($data['stock'])) {
    $id = $data['id'];
    $name = $data['name'];
    $price = $data['price'];
    $stock = $data['stock'];

    // Update the database with the new name, price, AND stock
    $stmt = $conn->prepare("UPDATE products SET name = ?, price = ?, stock = ? WHERE id = ?");
    $stmt->bind_param("sdii", $name, $price, $stock, $id);
    
    if($stmt->execute()) {
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'error' => $stmt->error]);
    }
    
    $stmt->close();
} else {
    echo json_encode(['success' => false, 'error' => 'Missing edit details']);
}
?>