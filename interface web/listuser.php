
<?php
require __DIR__.'/vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\Auth;

$factory = (new Factory)->withServiceAccount(__DIR__.'/fir-flutter-96a5a-firebase-adminsdk-surdo-01817ba8df.json');
$factory = $factory->withDatabaseUri('https://fir-flutter-96a5a-default-rtdb.firebaseio.com/');
$auth = $factory->createAuth();
$database = $factory->createDatabase();
$i=0;

try {
    $users = $database->getReference('users')->getValue();
} catch (\Exception $e) {
    // Handle the exception
    echo 'Error retrieving user data: ' . $e->getMessage();
}


?>

<!DOCTYPE html>
<html>
<head>
    <title>Users List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!DOCTYPE html>
    <style>
        body {
            background-color: #f8f8f8;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        h1 {
            margin-top: 30px;
            margin-bottom: 20px;
            text-align: center;
        }
        </style>
</head>
<?php
if (isset($_POST['delete']))
{

    $token=$_POST['token_delete'];

$ref="users/".$token;
$userRef = $database->getReference($ref)->remove();
}
?>
<body>
    <h1>Users List</h1>
    
    <table class="table rable-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Email</th>
                <th>Name</th>
                <th>Prenom</th>
                <th>Titre</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <?php if ($users !== null && is_array($users)) {
            foreach ($users as $uid => $userData){
                $i++;
             ?>
            <tr>
                <td><?php echo $i;?></td>
                <td><?php echo $userData['email']; ?></td>
                <td><?php echo $userData['nom']; ?></td>
                <td><?php echo $userData['prenom']; ?></td>
                <td><?php echo $userData['titre']; ?></td>
                <td><a href="edit.php?token=<?php echo $uid?>" class="btn btn-primary">Edit </a></td>
                <td><form action="listuser.php" method="POST">
                    <input type="hidden" name="token_delete" value="<?php echo $uid?>">
                    <button type="submit" name="delete" class="btn btn-danger">delete</button>

                    </form>
                    </td>
                    </tr>
            <?php }}else {
                echo 'No user data found.';
            } ?>
        </tbody>
    </table>
    <a href="form.php" class="btn btn-primary float left">Add</a> 
</body>
</html>