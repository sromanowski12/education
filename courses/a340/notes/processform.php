<!DOCTYPE html>
<html>
    <body>
        <p>Simple Procesing of Form Data</p>
    </body>
</html>

<?php
    echo("Display Information Obtained from ");
    if(isset($_GET['TextBoxName']))
        echo("Built-In Get Array: " . $_GET['TextBoxName']);
    else if(isset($_POST['TextBoxName']))
        echo("Built-In Post Array: " . $_POST['TextBoxName']);
    else
        echo("nothing sent");
?>