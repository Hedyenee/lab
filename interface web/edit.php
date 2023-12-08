<?php 
include ("header.php");
?>


<?php
require __DIR__.'/vendor/autoload.php';

use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;

// Replace with the path to your Firebase service account JSON file
//$serviceAccountPath = __DIR__.'/fir-flutter-96a5a-firebase-adminsdk-surdo-01817ba8df.json';

$serviceAccount = ServiceAccount::fromValue( __DIR__ . '/fir-flutter-96a5a-firebase-adminsdk-surdo-01817ba8df.json');//json_decode(file_get_contents($serviceAccountPath), true));

$factory = (new Factory)
    ->withServiceAccount($serviceAccount)
    ->withDatabaseUri('https://fir-flutter-96a5a-default-rtdb.firebaseio.com/');
$database = $factory->createDatabase();
// $da = $database->getDatabase();

//$auth = $factory->createAuth();
//
//$db = $factory->getDatabase();

if (isset($_GET['token'])) {
    //$userKey = $_GET['token'];
    // Update the fields in Firebase
    $token = $_GET['token']; // Retrieve the user key from the query parameter
    
    // Find the user node in Firebase based on the retrieved user key
    //$userRef = $database->getReference('users/' . $userKey);
    
    // Update the fields in Firebase
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $nom = $_POST['nom'];
        $prenom = $_POST['prenom'];
        $email = $_POST['email'];
        $title = $_POST['titre'];

        // Update the fields in Firebase
        $database->getReference('users/' . $token)->update([
            'nom' => $nom,
            'prenom' => $prenom,
            'email' => $email,
            'titre' => $title
        ]);
    }
    
    // Rest of the HTML code
    ?>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-7 mt-5">
                <h1>Edit user</h1>
                <hr>
                <form action="edit.php?token=<?php echo $token; ?>" method="POST">
                    <input type="hidden" name="token" value="<?php echo $token; ?>">
                    <div class="form-group">
                        <input type="text" name="nom" class="form-control" placeholder="nom">
                    </div>
                    <div class="form-group">
                        <input type="text" name="prenom" class="form-control" placeholder="prenom">
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" class="form-control" placeholder="email">
                    </div>
                    <div class="form-group">
                        <input type="text" name="titre" class="form-control" placeholder="titre">
                    </div>
                    <div class="form-group">
                        <button type="submit" name="update" class="btn btn-primary btn-block">Update</button>
                        <hr>
                        <a href="listuser.php" class="btn btn-danger btn-block">Back</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php
}

include("footer.php");
?>