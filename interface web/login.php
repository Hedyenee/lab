<?php
require __DIR__.'/vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\Auth;

$factory = (new Factory)->withServiceAccount(__DIR__.'/connect-fe748-firebase-adminsdk-5zjp6-717930c3af.json');
$factory = $factory->withDatabaseUri('https://fir-flutter-96a5a-default-rtdb.firebaseio.com/');
$auth = $factory->createAuth();

if (isset($_POST['login'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    try {
        $user = $auth->signInWithEmailAndPassword($email, $password);

        // User successfully logged in
        // Store the user ID in the session
        $_SESSION['user_id'] = $user->uid;

        // Redirect to the dashboard page
        header("Location: sidebar3.html");
        exit();
        
    } catch (Exception $e) {
        // Failed to login
        echo "Login failed: " . $e->getMessage();
    }
}

?>