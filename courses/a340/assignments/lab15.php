<?php
// Name: Seth Romanowski
// Course: Web Programming
// Assignment: Lab #15
// Semester: Summer, 2019

class HH_Directory
{
    private $dir;
    private $recursive_flag;
    private $pattern;
    private $fileList;

    function __construct(
        $thedir = ".",
        $therecursive_flag = false,
        $thepattern = "\.*"
    ) {
        echo ("Constructor.. <br />");

        $this->dir = $thedir;
        $this->recursive_flag = $therecursive_flag;
        $this->pattern = $thepattern;
        $this->fileList = array();
    }

    function __destruct()
    {
        echo ("Destructor.. <br />");
    }

    function changeDir($thedirectory = ".")
    {
        $this->dir = $thedirectory;
    }

    function recursive($theflag = true)
    {
        $this->recursive_flag = $theflag;
    }

    function changePattern($thepattern = "\.*")
    {
        $this->pattern = $thepattern;
    }

    function help()
    {
        echo ("<hr>");
        echo ("<pre>USAGE:<br />");
        echo ("myDir = new_Directory('.', false, '\.*');<br />");
        echo ("myDir->showDirectory();<br />");
        echo ("NOTE: <br />");
        echo ("Ensure there are no spaces or extra charcters in the text pattern sent for pattern matching. <br />");
        echo ("Example: '\.gif|\.jpg|\.png|\.txt' <br />");
        echo ("Send '\.*' or no parameter if you want the entire directory <br /></pre>");
        echo ("<hr>");
    }

    function showDir($thedir = NULL)
    {
        if ($thedir == NULL)
            $thedir = $this->dir;

        if (!is_dir($thedir))
            echo ("<b>Invalid Directory:</b> ($thedir) <br />");
        else {
            echo ("<b>Directory Listing for: </b> ($thedir) <br />");
            if ($handle = opendir($thedir)) {
                echo ("<b>Directory handle: </b> $handle <br />");
                echo ("<b>Entries: </b> <br />");
                echo ("<ul>");

                while (false !== ($entry = readdir($handle))) {
                    if ($entry == "." || $entry == "..") {
                        continue;
                    }
                    if ($thedir == '.')
                        $entry;
                    else
                        $entry = $thedir . '/' . $entry;

                    if (is_dir($entry)) {
                        echo ("<b>DIR NAME: </b> $entry <br />");
                        if ($this->recursive_flag == true) {
                            echo ("<ul>");
                            $this->showDir($entry);
                            echo ("</ul>");
                        }
                    } elseif (is_file($entry)) {
                        $lowerEntry = strtolower($entry);
                        if (preg_match("/($this->pattern)$/", $lowerEntry)) {
                            echo ("$entry <br />");
                        }
                    } elseif (is_link($entry))
                        echo ("<b>LINK NAME: </b>: $entry <br/>");
                    else
                        echo ("Unrecognized directory entry: $entry <br />");
                }
                echo ("</ul>");
                closedir($handle);
            }
        }
    }

    function getDir($thedir = NULL)
    {
        if ($thedir == NULL)
            $thedir = $this->dir;

        if (!is_dir($thedir))
            $this->fileList[] = ("<b>Invalid Directory: </b> ($dir) <br />");
        else {
            if ($handle = opendir($thedir)) {
                while (false !== ($entry = readdir($handle))) {
                    if ($entry == "." || $entry == "..") {
                        continue;
                    }
                    if ($thedir == '.')
                        $entry;
                    else
                        $entry = $thedir . '/' . $entry;

                    if (is_dir($entry)) {
                        if ($this->recursive_flag == true) {
                            $this->getDir($entry);
                        }
                    } elseif (is_file($entry)) {
                        $lowerEntry = strtolower($entry);

                        if (preg_match("/($this->pattern)$/", $lowerEntry)) {
                            $this->fileList[] = $entry;
                        }
                    } elseif (is_link($entry))
                        $this->fileList[] = ("LINK NAME: $entry");
                    else
                        $this->fileList[] = ("Unrecognized directory entry: $entry");
                }
                echo ("</ul>");
                closedir($handle);
            }
        }
        return ($this->fileList);
    }
}
?>

<?php
// Test the HH_Directory class:
$myDir = new HH_Directory("./images", false, NULL);
$myDir->help();
$myDir->showDir();
echo ("<hr>");

$myDir->recursive(true);
$myDir->showDir();
echo ("<hr>");

$myDir->changePattern('\.gif|\.jpg|\.png|\.txt');
$myDir->showDir();
echo ("<hr>");

$myDir->changeDir('./images/JS_slides');
$myDir->showDir();
echo ("<hr>");

$theFiles = $myDir->getDir('.');
if (isset($theFiles) && sizeof($theFiles) > 0) {
    foreach ($theFiles as $file)
        echo $file . "<br />";
}
echo ("<hr>");
?>