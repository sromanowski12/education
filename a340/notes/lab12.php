<!DOCTYPE html>
<!--
Name:			Seth Romanowski
Course:			Web Programming
Assignment:		Lab #12
Semester:		Summer, 2019
-->
<html>

<head>
</head>

<body>
    <?php
    $myStudents = array();
    $myStudents[0] = array("Name" => "Tom", "Grade" => 79);
    $myStudents[1] = array("Name" => "Sue", "Grade" => 82);
    $myStudents[2] = array("Name" => "Jack", "Grade" => 69);
    $myStudents[3] = array("Name" => "Niki", "Grade" => 92);

    echo ("<h3>Display Array using for loop</h3>");
    for ($i = 0; $i < sizeof($myStudents); $i++) {
        echo ("myStudents[$i][Name] = " . $myStudents[$i]["Name"] . "<br />");
        echo ("myStudents[$i][Grade] = " . $myStudents[$i]["Grade"] . "<br />");
    }

    echo ("<h3>Display Array using print_r()</h3>");
    echo ("<pre>");
    print_r($myStudents); // Print readable
    echo ("</pre>");
    echo ("<hr>");

    echo ("<h3>Display Array content using var_dump()</h3>");
    var_dump($myStudents);

    echo ("<h3>Storing the array content into a sequential file: (lab12.txt) </h3>");

    $filename = "lab12.txt";
    $fp = fopen($filename, "w");    // "w" = write to the file

    for ($i = 0; $i < sizeof($myStudents); $i++) {
        fwrite($fp, $myStudents[$i]["Name"] . "\n");
        fwrite($fp, $myStudents[$i]["Grade"] . "\n");
    }

    fclose($fp);

    echo ("<h3>Storing the array content into a Semi-XML sequential file: (lab12_xml.txt) </h3>");

    $filename = "lab12_xml.txt";
    $fp = fopen($filename, "w");

    for ($i = 0; $i < sizeof($myStudents); $i++) {
        fwrite($fp, "<name>" . "\n");
        fwrite($fp, $myStudents[$i]["Name"] . "\n");
        fwrite($fp, "</name>" . "\n");

        fwrite($fp, "<grade>" . "\n");
        fwrite($fp, $myStudents[$i]["Grade"] . "\n");
        fwrite($fp, "</grade>" . "\n");
    }

    fclose($fp);

    echo ("<h3>Reading and displaying the file content: (lab12.txt) </h3>");

    $filename = "lab12.txt";
    $fp = fopen($filename, "r");

    if ($fp == false) {
        echo ("Error opening: " . $filename);
        exit();
    }
    while (!feof($fp)) {
        echo trim(fgets($fp));
        echo ("<br />");
    }

    fclose($fp);

    echo ("<h3>Reading and displaying the file content: (lab12_xml.txt) </h3>");

    $filename = "lab12_xml.txt";
    $fp = fopen($filename, "r");

    if ($fp == false) {
        echo ("Error opening: " . $filename);
        exit();
    }
    while (!feof($fp)) {
        $line = trim(fgets($fp));
        switch ($line) {
            case "<name>":
                $name = trim(fgets($fp));
                echo ("Name: " . $name . "<br />");
                $discard = fgets($fp);
                break;
            case "<grade>":
                $grade = (int)trim(fgets($fp));
                echo ("Grade: " . $grade . "<br />");
                $discard = fgets($fp);
                break;
            default:
                echo ("Blank line or Unrecognized token in file: " . $filename);
                break;
        }
    }

    fclose($fp);

    ?>
</body>

</html>