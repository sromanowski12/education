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
        function checkTheTextBox()
        {
            var userid = document.getElementById("username");
            var passwd = document.getElementById("password");

            if((userid.value == "") || (myPassword == ""))
            {
                console.alert("Don't forget your username and password");
                if(userid.value == "") userid.style.background="yellow";
                if(passwd.value == "") passwd.style.background="yellow";
            }
            else {
                var theButton = document.getElementById("button");
                theButton.type = 'submit';
                theButton.name = 'submit';
            }
        }
        </script>

    </head>
    <body>
        <?php
            echo("<form action='lab13_process_post_V2.php' method='post'>");
                echo("<label>User Name: </label>");
                echo("<input id='username' 
                            type='text'
                            name='username' 
                            value='' 
                            required />");
                echo("<br />");

                echo("<label>Password: </label>");
                echo("<input id='password' 
                            type='password' 
                            name='password' 
                            value='' 
                            required />");
                echo("<br />");

                echo("<input id='button'
                            type='submit' 
                            onclick='checkTheTextBox();' 
                            >Submit Form</button>");
            echo("</form>");
        ?>
    </body>
</html>