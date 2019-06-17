<!DOCTYPE html>
<!--
Name:			Seth Romanowski
Course:			Web Programming
Assignment:		Lab #13
Semester:		Summer, 2019
-->
<html>
    <head>
        <script type="text/javascript">
        function checkPassword()
        {
            var myPassword = document.getElementById('username');
            if(myPassword == '')
            {
                console.alert("Don't forget your username and password");
            }
        }
        </script>

    </head>
    <body>
        <?php
            echo("<form action='lab13_process_post_V1.php' method='post'>");
                echo("<label>User Name: </label>");
                echo("<input type='text' name='username' value='' />");
                echo("<br />");

                echo("<label>Password: </label>");
                echo("<input type='password' name='password' value='' />");
                echo("<br />");

                echo("<input type='submit' name='submit' value='Submit Form' />");
            echo("</form>");
        ?>
    </body>
</html>