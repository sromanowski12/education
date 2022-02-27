<?php
// Lab19_AJAX.php
//-------------------------
// Called by Lab19_Solution.html
// via AJAX call.

if(isset($_GET["partialEmail"])) {
    if ($_GET["partialEmail"] == "h")
    echo("hhakimza@iusb.edu");
    else if ($_GET["partialEmail"] == "hh")
    echo("hhakimza@iusb.edu");
    else if ($_GET["partialEmail"] == "ha")
    echo("hamilton@iusb.edu");
    else if ($_GET["partialEmail"] == "hha")
    echo("hhakimza@iusb.edu");
    else if ($_GET["partialEmail"] == "ham")
    echo("hamilton@iusb.edu");
    else if ($_GET["partialEmail"] == "hhak")
    echo("hhakimza@iusb.edu");
    else if ($_GET["partialEmail"] == "hhan")
    echo("hhanson@iusb.edu");
    }
?>