<!DOCTYPE html>
<!--
Name:			Seth Romanowski
Course:			Web Programming
Assignment:		Lab #14
Semester:		Summer, 2019
-->
<html>

<head>
</head>

<body>
    <?php
    function showDirectory($dir = ".", $recursive_flag = false, $pattern = "\.*")
    {
        if (!is_dir($dir))
            echo ("<b>Invalid Directory: </b> ($dir) <br />");
        else {
            echo ("<b>Directory Listing for: </b> ($dir) <br />");
            if ($handle = opendir($dir)) {
                echo ("<b>Directory handle: </b> $handle <br />");
                echo ("<b>Entries:</b> <br />");
                echo ("<ul>");

                while (false !== ($entry = readdir($handle))) {
                    if ($entry == "." || $entry == "..") {
                        continue;
                    }
                    if ($dir == '.')
                        $entry;
                    else
                        $entry = $dir . '/' . $entry;

                    if (is_dir($entry)) {
                        echo ("<b>DIR NAME: </b> $entry <br />");
                        if ($recursive_flag == true) {
                            echo ("<ul>");
                            showDirectory($entry, $recursive_flag);
                            echo ("</ul>");
                        }
                    } elseif (is_file($entry)) {
                        $lowerEntry = strtolower($entry);
                        if (preg_match("/($pattern)$/", $lowerEntry)) {
                            echo ("$entry <br />");
                        }
                    } elseif (is_link($entry))
                        echo ("<b>LINK NAME: </b>: $entry<br />");
                    else
                        echo ("Unrecognized directory entry: $entry<br/>");
                }
                echo ("</ul>");
                closedir($handle);
            }
        }
    }


    showDirectory(".", false, "\.txt");
    echo ("<hr>");

    showDirectory(".", true, '\.gif|\.jpg|\.png|\.txt');
    echo ("<hr>");

    ?>

</body>

</html>