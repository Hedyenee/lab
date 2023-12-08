<?php 
include ("header.php");?>


    <div class="row justify-content-center">
        <div class="col-md-6 mt-4">
            <h1>Add user</h3>
            <hr>
            <form  action="add.php" method="POST">
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="nom">
            </div>

            <div class="form-group">
                <input type="text" name="lastname" class="form-control" placeholder="prenom">
            </div>

            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="password">
            </div>

            <div class="form-group">
                <input type="password" name="confirm_password" class="form-control" placeholder="confirmpassword">
            </div>

            <div class="form-group">
                <input type="email" name="email" class="form-control" placeholder="email">
            </div>

            <div class="form-group">
                <input type="text" name="title" class="form-control" placeholder="nom">
            </div>
  
            <div class="form-group">
                <button type="submit" name="send" class="btn btn-primary btn-block">Save</button>
            </div>
            </form>
        </div>
    </div>

















<?include ("footer.php");
?>