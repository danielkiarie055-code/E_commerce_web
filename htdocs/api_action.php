<?php
header('Content-Type: application/json');
include 'db.php';

if (isset($_POST['action']) && $_POST['action'] === 'add') {
    $name = $conn->real_escape_string($_POST['name']);
    $department = $conn->real_escape_string($_POST['department']);
    $category = $conn->real_escape_string($_POST['category']);
    $price = (int)$_POST['price'];
    $stock = (int)$_POST['stock'];
    $rating = (float)$_POST['rating']; // BRAND NEW: Capturing the rating
    
    $target_dir = "uploads/";
    $file_name = basename($_FILES["image"]["name"]);
    $safe_file_name = time() . "_" . preg_replace("/[^a-zA-Z0-9.]/", "", $file_name);
    $target_file = $target_dir . $safe_file_name;
    
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        $image_path = $conn->real_escape_string($target_file);
        
        // Added 'rating' to the INSERT query
        $sql = "INSERT INTO products (name, department, category, price, rating, stock, image) 
                VALUES ('$name', '$department', '$category', $price, $rating, $stock, '$image_path')";
                
        echo json_encode(["success" => $conn->query($sql)]);
    } else {
        echo json_encode(["success" => false, "error" => "Image upload failed."]);
    }
} 
else {
    $data = json_decode(file_get_contents("php://input"));
    if (isset($data->action) && $data->action === 'delete') {
        $id = (int)$data->id;
        
        $result = $conn->query("SELECT image FROM products WHERE id=$id");
        if ($row = $result->fetch_assoc()) {
            if (file_exists($row['image'])) {
                unlink($row['image']); 
            }
        }
        echo json_encode(["success" => $conn->query("DELETE FROM products WHERE id=$id")]);
    }
}
$conn->close();
?>