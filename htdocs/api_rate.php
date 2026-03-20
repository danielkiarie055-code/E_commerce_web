<?php
header('Content-Type: application/json');
include 'db.php';
$data = json_decode(file_get_contents("php://input"));
if (isset($data->id)) {
    $id = (int)$data->id; $u_rate = (float)$data->rating;
    $row = $conn->query("SELECT rating, rating_count FROM products WHERE id=$id")->fetch_assoc();
    $new_count = (int)$row['rating_count'] + 1;
    $new_avg = (($row['rating'] * $row['rating_count']) + $u_rate) / $new_count;
    $conn->query("UPDATE products SET rating=$new_avg, rating_count=$new_count WHERE id=$id");
    echo json_encode(["success" => true]);
}
$conn->close();
?>