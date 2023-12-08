<?php
require __DIR__.'/vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\Auth;

$factory = (new Factory)->withServiceAccount(__DIR__.'/fir-flutter-96a5a-firebase-adminsdk-surdo-01817ba8df.json');
//$factory = $factory->withDatabaseUri('https://fir-flutter-96a5a-default-rtdb.firebaseio.com/');
$auth = $factory->createAuth();
//$database = $factory->createDatabase();
//$auth = $factory->createAuth();

// Get all users
$users = $auth->listUsers();
if (isset($_POST['delete_user'])) {
    $uid = $_POST['delete_user'];

    try {
        $auth->deleteUser($uid);
        echo "User with UID: $uid has been deleted successfully.";
    } catch (Exception $e) {
        echo 'Error deleting user: ' . $e->getMessage();
    }
}

?>

<!DOCTYPE html>
<html>
<head>
    <title>User Control</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
         h1 {
            margin-top: 30px;
            margin-bottom: 20px;
            text-align: center;
        }
        </style>
</head>
<body>
    <div class="container">
        <h1>User Management</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>UID</th>
                    <th>Email</th>
                    
                  
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($users as $user) { ?>
                <tr>
                    <td><?php echo $user->uid; ?></td>
                    <td><?php echo $user->email; ?></td>
                    <td>
                        <form method="post" onsubmit="return confirm('Are you sure you want to delete this user?')">
                            <input type="hidden" name="delete_user" value="<?php echo $user->uid; ?>">
                            <button class="btn btn-danger" type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>