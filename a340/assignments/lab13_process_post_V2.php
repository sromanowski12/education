<!DOCTYPE html>
<html>
    <head>
        <title>Lab 13 PHP FORM Processing using the POST method</title>
    </head>
    <body>
        <?php
            echo("<h3>PHP Process Form (Using the POST super global array)</h3>");
            if(!isset($_POST['username']) ||
                !isset($_POST['password']) ||
                ($_POST['username']) == '' ||
                ($_POST['password']) == '')
            {
                echo("Incorrect userid or password");
            }
            else
            {
                echo($_POST['username']);
                echo("<br />");
                echo($_POST['password']);
                echo("<br />");
                if(authenticate($_POST['username'], $_POST['password']))
                    echo("Success...");
                else
                    echo("Failed to login");
            }

            function authenticate($userid, $password)
            {
                if(($userid == "hhakimza") && ($password == "password"))
                    return (true);
                else 
                    return (false);
            }

        ?>
    </body>
</html>