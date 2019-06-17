<?php
        // Name: Seth Romanowski
        // Course: Web Programming
        // Assignment: Lab #17
        //vSemester: Summer, 2019

        echo("Step 1: Make a connection to MySQL Server and database <br />");

        $con = mysqli_connect("localhost","LabUser","Pass123Word","MyDB");
        echo("<hr>");

        // ---------------------------------------------
        echo("Step 2: Check for Connection Errors <br />");
        if(mysqli_connect_errno($con))
        {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }
        else
        {
            echo "Successful Connection to MySQL";
        }

        echo("<hr>");
         // ---------------------------------------------
         echo("Step 3: SELECT record in my_friends table <br />");
         $sql = "SELECT * FROM my_friends";
         echo($sql . "<br />");
         $result = mysqli_query($con, $sql);
         while($row = mysqli_fetch_array($result))
         {
             echo $row['fname'] . " " . $row['lname'] . " " .
                    $row['email'] . " " . $row['phone'] . " " .
                    $row['city'];
            echo "<br />";
         }

         echo("<hr>");
         // ---------------------------------------------
         echo("Step 4: INSERT a record in my_friends table <br />");
         $sql = "INSERT INTO my_friends
                        (fname, lname, email, phone, city)
                    VALUES
                        ('Ali','Fisheye','afisheye@iusb.edu','574-555-6543','Chicago')";
        echo($sql . "<br />");
        mysqli_query($con, $sql);

        echo("<hr>");
        // ---------------------------------------------
        echo("Step 4.1: SELECT records in my_friends table <br />");
        $sql = "SELECT * FROM my_friends";
        echo($sql . "<br />");
        $result = mysqli_query($con, $sql);
        while($row = mysqli_fetch_array($result))
        {
            echo $row['fname'] . " " . $row['lname'] . " " .
                   $row['email'] . " " . $row['phone'] . " " .
                   $row['city'];
           echo "<br />";
        }

        echo("<hr>");
        // ---------------------------------------------
        echo("Step 5: Update a record in my_friends table <br />");
        $sql = "UPDATE my_friends
                    SET city = 'Detroit'
                    WHERE city = 'South Bend'";
        echo($sql . "<br />");
        mysqli_query($con, $sql);

        echo("<hr>");
        // ---------------------------------------------
        echo("Step 5.1: SELECT records in my_friends table <br />");
        $sql = "SELECT * FROM my_friends";
        echo($sql . "<br />");
        $result = mysqli_query($con, $sql);
        while($row = mysqli_fetch_array($result))
        {
            echo $row['fname'] . " " . $row['lname'] . " " .
                   $row['email'] . " " . $row['phone'] . " " .
                   $row['city'];
           echo "<br />";
        }

        echo("<hr>");
         // ---------------------------------------------

        echo("Step 6: Delete a record in my_friends table <br />");
        $sql = "DELETE FROM my_friends
                    WHERE city = 'Chicago'";
        echo($sql . "<br />");
        mysqli_query($con, $sql);

        echo("<hr>");
        // ---------------------------------------------
        echo("Step 6.1: SELECT records in my_friends table <br />");
        $sql = "SELECT * FROM my_friends";
        echo($sql . "<br />");
        $result = mysqli_query($con, $sql);
        while($row = mysqli_fetch_array($result))
        {
            echo $row['fname'] . " " . $row['lname'] . " " .
                   $row['email'] . " " . $row['phone'] . " " .
                   $row['city'];
           echo "<br />";
        }

        echo("<hr>");
        // ---------------------------------------------
        echo("<b>Step 6.2: </b>Delete ALL records from my_friends table <br />");
        $sql = "DELETE FROM my_friends";
        echo($sql . "<br />");
        mysqli_query($con, $sql);

        echo("<hr>");
        // ---------------------------------------------
        echo("<b>Step 6.3: </b>Re-INSERT the original record back into my_friends table <br />");
        $sql = "INSERT INTO my_friends(fname, lname, email, phone, city) VALUES
                        ('Sue', 'Jackson','sjackson@iusb.edu','574-555-1234','South Bend'),
                        ('Tom', 'Thompson','tthompson@yahoo.com','574-555-8765','Mishawaka'),
                        ('May', 'Flowers', 'mflowers@gmail.com', '574-777-0123', 'South Bend')";
        
        
        echo($sql . "<br />");
        mysqli_query($con, $sql);

        echo("<hr>");
        // ---------------------------------------------
        echo("<b>Step 6.4: </b>SELECT records in my_friends table (after re-INSERTing the records)<br />");
        $sql = "SELECT * FROM my_friends";
        echo($sql . "<br />");
        $result = mysqli_query($con, $sql);
        while($row = mysqli_fetch_array($result))
        {
            echo $row['fname'] . " " . $row['lname'] . " " .
                    $row['email'] . " " . $row['phone'] . " " .
                    $row['city'];
            echo "<br />";
        }

        echo("<hr>");
        // ---------------------------------------------
        echo("Step 7: Close the connection to the MySQL server/database <br />");
        mysqli_close($con);
        echo("<hr>");



?>