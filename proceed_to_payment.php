<?php
include 'dbconnect.php';
include 'header.php';
require 'vendor/autoload.php';
use Dotenv\Dotenv;
use GuzzleHttp\Client;

$dotenv = Dotenv::createImmutable(__DIR__);
$dotenv->load();

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo "<script>alert('Please log in to proceed with payment.'); window.location.href = 'login.php';</script>";
    exit;
}

$user_id = $_SESSION['user_id'];

// Check if order_id is provided
if (!isset($_GET['order_id'])) {
    echo "<script>alert('No order found.'); window.location.href = 'manage_orders.php';</script>";
    exit;
}

$order_id = $_GET['order_id'];

// Fetch the order details
$stmt_order = $pdo->prepare("SELECT * FROM orders WHERE order_id = :order_id AND user_id = :user_id");
$stmt_order->execute(['order_id' => $order_id, 'user_id' => $user_id]);
$order = $stmt_order->fetch(PDO::FETCH_ASSOC);

if (!$order || $order['status'] !== 'unpaid') {
    echo "<script>alert('This order is not available for payment.'); window.location.href = 'manage_orders.php';</script>";
    exit;
}

// Fetch user details
$stmt_user = $pdo->prepare("SELECT * FROM users WHERE user_id = :user_id");
$stmt_user->execute(['user_id' => $user_id]);
$user = $stmt_user->fetch(PDO::FETCH_ASSOC);

// Handle payment method logic
if ($order['payment_method'] === 'online_payment') {
    $client = new Client();
    $secret_key = getenv('PAYMONGO_SECRET_KEY');  // PayMongo Secret Key

    try {
        // Create a payment intent
        $response = $client->post('https://api.paymongo.com/v1/payment_intents', [
            'json' => [
                'data' => [
                    'attributes' => [
                        'amount' => number_format($order['total'], 2, '.', '') * 100, // Convert to cents
                        'currency' => 'PHP',
                        'payment_method_types' => ['gcash', 'paymaya', 'credit_card'],
                    ],
                ],
            ],
            'headers' => [
                'Authorization' => 'Basic ' . base64_encode($secret_key . ':'),  // Basic auth with secret key
                'Content-Type' => 'application/json',
            ]
        ]);

        $paymentIntent = json_decode($response->getBody(), true);

        // Redirect the user to the payment page
        header('Location: ' . $paymentIntent['data']['attributes']['redirect']['url']);
        exit;

    } catch (Exception $e) {
        echo "<script>alert('Payment creation failed: " . $e->getMessage() . "'); window.location.href = 'manage_orders.php';</script>";
        exit;
    }

} elseif ($order['payment_method'] === 'cod') {
    // Handle Cash on Delivery (COD)
    echo "<script>alert('Your order is marked as Cash on Delivery. You will be contacted for delivery.'); window.location.href = 'manage_orders.php';</script>";
    exit;
}

?>

<section class="checkout-area ptb-90">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="checkout-section">
                    <h4>Processing your order payment...</h4>
                </div>
            </div>
        </div>
    </div>
</section>

<?php include 'footer.php'; ?>