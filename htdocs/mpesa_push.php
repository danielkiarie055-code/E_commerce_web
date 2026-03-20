<?php
// 1. Catch the JSON data sent from app.js
$data = json_decode(file_get_contents('php://input'), true);

$phone = $data['phone'] ?? '';
$amount = $data['total_amount'] ?? 1; // Default to 1 if empty

if (empty($phone)) {
    echo json_encode(['error' => 'No phone number provided']);
    exit;
}

// 2. Your Daraja Sandbox Credentials
$consumerKey = 'GGFft00O8WOeIj5B1zAIOi4UNunWh71Wku2AWJfK33wttXbJ';       
$consumerSecret = 'WPJD5SDWemMBvcBgSFhiJwxBOEgoAp5qzbGjLMEglxABBKUzlyHE4O2XD4i5lGZx'; 
$BusinessShortCode = '174379'; 
$Passkey = 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919';

// 3. Prepare Transaction Details
$PartyA = $phone; 
$PartyB = '174379'; 
$AccountReference = 'LuxeFashion';
$TransactionDesc = 'Store Checkout';
$Amount = (int)$amount; // Safaricom strictly requires whole numbers
$Timestamp = date('YmdHis');
$Password = base64_encode($BusinessShortCode . $Passkey . $Timestamp);

// Replace with your actual InfinityFree domain name!
$CallBackURL = 'https://luxefashion.great-site.net/api_callback.php'; 

// 4. Get the Access Token from Safaricom
$access_token_url = 'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials';
$headers = ['Content-Type:application/json; charset=utf8'];
$curl = curl_init($access_token_url);
curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, TRUE);
curl_setopt($curl, CURLOPT_HEADER, FALSE);
curl_setopt($curl, CURLOPT_USERPWD, $consumerKey . ':' . $consumerSecret);
$result = curl_exec($curl);
$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);
$result = json_decode($result);

if (!isset($result->access_token)) {
    echo json_encode(['error' => 'Failed to generate access token. Check your Key and Secret.']);
    exit;
}
$access_token = $result->access_token;
curl_close($curl);

// 5. Send the STK Push Request to the Phone
$stk_url = 'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest';
$stkheader = ['Content-Type:application/json', 'Authorization:Bearer ' . $access_token];

$curl_post_data = array(
    'BusinessShortCode' => $BusinessShortCode,
    'Password' => $Password,
    'Timestamp' => $Timestamp,
    'TransactionType' => 'CustomerPayBillOnline', // Must be this for Sandbox shortcode 174379
    'Amount' => $Amount,
    'PartyA' => $PartyA,
    'PartyB' => $PartyB,
    'PhoneNumber' => $PartyA,
    'CallBackURL' => $CallBackURL,
    'AccountReference' => $AccountReference,
    'TransactionDesc' => $TransactionDesc
);

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $stk_url);
curl_setopt($curl, CURLOPT_HTTPHEADER, $stkheader);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($curl_post_data));
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($curl);
curl_close($curl);

// 6. Return Safaricom's response back to app.js
echo $response;
?>