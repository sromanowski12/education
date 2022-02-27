<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <?php
            echo("<h3>PHP Input using POST</h3>");

            echo("<form action='06_1_process_post.php' method='post'>" );
                echo("<label> User Name: </label>");
                echo("<br />");
                echo("<input type='submit' name='submit' value='Submit' />");
            echo("</form>");
        ?>
    </body>
</html>