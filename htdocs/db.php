<?php
// INFINITYFREE LIVE DATABASE CONNECTION ---
$host = "sql104.infinityfree.com"; 
$user = "if0_41239207";           
$pass = "BcMsnRtQG5oX";   
$db   = "if0_41239207_luxe";      

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    // Pro-tip: On live sites, keep error messages simple for security
    die("Database connection failed. Please try again later.");
}
?>