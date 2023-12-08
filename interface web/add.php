<?php
require __DIR__.'/vendor/autoload.php'; // Include the Composer autoloader

use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;

// Replace with the path to your Firebase service account JSON file
$serviceAccountPath = __DIR__.'/fir-flutter-96a5a-firebase-adminsdk-surdo-01817ba8df.json';

$serviceAccount = ServiceAccount::fromValue(json_decode(file_get_contents($serviceAccountPath), true));

$factory = (new Factory)
    ->withServiceAccount($serviceAccount)
    ->withDatabaseUri('https://fir-flutter-96a5a-default-rtdb.firebaseio.com//');


$auth = $factory->createAuth();
$database = $factory->createDatabase();



$confirmPassword = isset($_POST['confirm_password']) ? $_POST['confirm_password'] : null;
$password = isset($_POST['password']) ? $_POST['password'] : null;
$email = isset($_POST['email']) ? $_POST['email'] : null;
$firstname = isset($_POST['name']) ? $_POST['name'] : null;
$lastname = isset($_POST['lastname'])? $_POST['lastname'] : null;
$title = isset($_POST['title'])? $_POST['title'] : null;

print($email);
// Check if email, passwords, and additional fields are provided
if (!$email  || !$password  || !$firstname || !$lastname || !$title || !$confirmPassword) {
    echo 'Please provide email, password, confirm password, room number, nom, phone number, and cin number.';
    exit;
}

// Check if passwords match
if ($password !== $confirmPassword) {
    echo 'Password and confirm password do not match.';
    exit;
}

// Create the user in Firebase Authentication
try {
    $userProperties = [
        'email' => $email,
        'password' => $password,
    ];

    $createdUser = $auth->createUser($userProperties);

    // User signed up successfully
    echo "User signed up successfully";

    // Store additional user data in Firebase Realtime Database
    $userData = [
        'nom' => $firstname,
        'prenom' => $lastname,
        'email' =>$email,
        'titre' => $title,
    ];

    $database->getReference('users/' . $createdUser->uid)->set($userData);

    // Redirect or show success message
} catch (\Kreait\Firebase\Auth\CreateUserFailed $e) {
    // Handle sign up errors
    echo 'Sign up error: '.$e->getMessage();
}
?>