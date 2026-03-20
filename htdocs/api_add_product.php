<?php
require 'db.php'; 

// Check if a file was actually uploaded
if (isset($_POST['name']) && isset($_FILES['image'])) {
    
    $name = $_POST['name'];
    $category = $_POST['category'];
    $price = $_POST['price'];
    $stock = $_POST['stock'];
    
    $imageFile = $_FILES['image'];
    
    // Create a unique file name so old images don't get overwritten
    $imageName = time() . '_' . basename($imageFile['name']);
    
    // The folder where the image will be saved on InfinityFree
    $targetPath = 'uploads/' . $imageName;
    
    // Attempt to move the uploaded file into the uploads folder
    if (move_uploaded_file($imageFile['tmp_name'], $targetPath)) {
        
        // If the upload worked, save it to the database
        $stmt = $conn->prepare("INSERT INTO products (name, category, price, stock, image) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("ssdis", $name, $category, $price, $stock, $imageName);
        
        if($stmt->execute()) {
            echo json_encode(['success' => true]);
        } else {
            echo json_encode(['success' => false, 'error' => 'Database error: ' . $stmt->error]);
        }
        $stmt->close();
        
    } else {
        // This usually happens if the "uploads" folder doesn't exist yet
        echo json_encode(['success' => false, 'error' => 'Failed to move image to uploads folder. Please ensure the "uploads" folder exists in your File Manager.']);
    }
    
} else {
    echo json_encode(['success' => false, 'error' => 'Missing product details or image.']);
}
?>