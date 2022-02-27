<!DOCTYPE html>
<!--
Name:			Seth Romanowski
Course:			Web Programming
Assignment:		Assignment #4
Semester:		Summer, 2019
-->
<html>

<head>
    <title>Informatics Student Club</title>
    <script type="text/javascript">
        function displayAbout() {
            var body = document.getElementById("bodycontent");
            body.innerHTML = "<h2>About the Informatics Club</h2>";
            body.innerHTML = body.innerHTML + "<div id='aboutcontent'><p>" +
                "<img src='https://ready.iusb.edu/Resources/iusb2.jpg' height='150px' width='200px' align='right'>" +
                "This informatics club <br />" +
                "Purpose of the club: <br>" +
                "Paragraph: <br>" +
                "<h3>Our activities and events include:</h3>" +
                "<ol><li>Social Gathering/Pizza Party</li>" +
                "<li>Casino Night</li>" +
                "<li>Game Night</li>" +
                "<li>Programming Competition</li>" +
                "<li>Etc..</li></ol>" +
                "<h3>Club Members: </h3>" +
                "<ul><li>Seth Romanowski, Club President, sromanow@iu.edu</li>" +
                "<li>Inyerman Fonseca, Vice President</li></ul></p></div>";
            //      "<img src='https://ready.iusb.edu/Resources/iusb2.jpg' height='150px' width='200px' align='right'></p></div>";
            body.innerHTML = body.innerHTML + "<div id='aboutquestions'><p>" +
                "<center><h2>Questions and Comments</h2></center>" +
                "Questions and comments in regards to the Informatics Student Club must be directed to: <br><br />" +
                "Seth Romanowski, sromanow@iu.edu<br><br />" +
                "Thank you for visiting the Informatics Student Club Homepage!</p></div>";
        }

        function displayRegister() {
            var body = document.getElementById("bodycontent");
            body.innerHTML = "<center><h2>Become a Club Member</h2></center>";
            body.innerHTML = body.innerHTML + "<form action='assignment4_process_post.php' method='post'>" +
                "<table><tr><td>First Name: </td>" +
                "<td><input type='text' name='fname'></td></tr>" +
                "<tr><td>Last Name: </td><td><input type='text' name='lname'></td></tr>" +
                "<tr><td>Your Email: </td><td><input type='text' name='email'></td></tr>" +
                "<tr><td>Gender: </td><td><input type='radio' name='gender' value='Male'>Male<br>" +
                "<input type='radio' name='gender' value='Female'>Female<br></td></tr>" +
                "<tr><td>Interested in: </td><td><br /><input type='checkbox' name='interest1' value=TRUE>Pizza Party<br>" +
                "<input type='checkbox' name='interest2' value=TRUE>Joining Study Groups<br>" +
                "<input type='checkbox' name='interest3' value=TRUE>Visitor Employer Sites<br>" +
                "<input type='checkbox' name='interest4' value=TRUE>Participating in Programming Competitions<br>" +
                "<input type='checkbox' name='interest5' value=TRUE>Building Games<br>" +
                "<input type='checkbox' name='interest6' value=TRUE>Becoming an Officer of the Club</td></tr>" +
                "<tr><td><button>Sign Up</button></td><td></td></tr></table>" +
                "</form>";
        }

       function displayMembers() {
           var body = document.getElementById("bodycontent");
           body.innerHTML = "<center><h2>Become a Club Member</h2></center>";
           
        }
    </script>
    <style>
        #bar {
            background-color: black;
            width: 900px;
            height: 10px;
        }

        #header {
            font-family: Arial, Helvetica, sans-serif;
            background-color: lightcoral;
            width: 900px;
            height: 180px;
            text-align: center;
            color: white;
            font-weight: bold;
        }

        #leftnav {
            font-family: Arial, Helvetica, sans-serif;
            background-color: lightgray;
            width: 150px;
            height: 500px;
            color: black;
            float: left;
        }

        #bodycontent {
            font-family: Arial, Helvetica, sans-serif;
            background-color: white;
            width: 750px;
            height: 500px;
            float: left;
            overflow: scroll;
        }

        #aboutcontent {
            font-family: Arial, Helvetica, sans-serif;
            color: black;
            background-color: white;
            margin: 1cm 2cm 1cm 2cm;
            padding: 10px 10px 10px 10px;
            border: 3px ridge gray;
            border-radius: 15px;
        }

        #aboutquestions {
            font-family: Arial, Helvetica, sans-serif;
            color: white;
            background-color: black;
            margin: 1cm 1cm 1cm 1cm;
            padding: 10px 5px 10px 5px;
            border: 3px ridge gray;
            border-radius: 15px;
        }

        #aboutquestions:hover {
            background-color: gray;
        }

        .link:hover {
            color: blue;
        }

        img {
            opacity: 0.2;
            filter: alpha(opacity=20);
            /* For IE8 and earlier */
        }

        img:hover {
            opacity: 1;
            filter: alpha(opacity=100);
            /* For IE8 and earlier */
        }

        #footer {
            font-family: Arial, Helvetica, sans-serif;
            background-color: black;
            height: 75px;
            width: 900px;
            color: white;
            text-align: center;
            font-weight: bold;
            float: left;
        }
    </style>
</head>

<body>
    <?php
    function displayMain(){
        echo ("<div id='container' style='width:900px;'>");
        echo ("<div id='bar'></div>");
        echo ("<div id='header'>");
        echo ("<br /><br />");
        echo ("<h1>Informatics Student Club</h1>");
        echo ("</div>");
        echo ("<div id='bar'></div>");
        echo ("<div id='leftnav'><p class='link' onclick='displayAbout();'><u>About Us</u></p>");
        echo ("<p class='link' onclick='displayRegister();'><u>Register</u></p>");

        


 //       echo ("<p class='link' onclick='displayMembers();'><u>Members</u></p>");
        echo ("<hr><p><a href='http://localhost:82/assignment4.php'>Home</a></p></div>");
        echo ("<div id='bodycontent'></div>");
        echo ("<div id='footer'><h2>&copy Copyright 2019</h2></div>");
        echo ("</div>");
    }

    function readMembers(){
        $filename = "assign4_membership.txt";
        $fp = fopen($filename, "r");
    
        $member = array();
        $index = 0;

        if ($fp == false) {
            echo ("Error opening: " . $filename);
            exit();
        }
        while (!feof($fp)) {
            $line = trim(fgets($fp));
            switch ($line) {
                case "<fname>":
                    $member[$index]["FirstName"] = trim(fgets($fp));
            //        echo ("First Name: " . $member[$index]["FirstName"] . "<br />");
                    $discard = fgets($fp);
                    break;
                case "<lname>":
                    $member[$index]["LastName"] = trim(fgets($fp));
            //        echo ("Last Name: " . $member[$index]["LastName"] . "<br />");
                    $discard = fgets($fp);
                    break;
                case "<email>":
                    $member[$index]["Email"] = trim(fgets($fp));
            //        echo ("Email: " . $member[$index]["Email"] . "<br />");
                    $discard = fgets($fp);
                    break;
                case "<gender>":
                    $member[$index]["Gender"] = trim(fgets($fp));
            //        echo ("Gender: " . $member[$index]["Gender"] . "<br />");
                    $discard = fgets($fp);
                    break;

                default:
                    $discard = fgets($fp);
   //                 echo ("Blank line or Unrecognized token in file: " . $filename);
                    break;
            }
            $index++;
        }

        fclose($fp);
        return $member;
    }

    displayMain();
    ?>

</body>

</html>