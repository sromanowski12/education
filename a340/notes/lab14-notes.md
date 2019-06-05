### **Lab 14**
**Lab Goals**
- PHP Files and Directory processing (opendir(), readdir(), closedir())
- Pattern matching preg_match()

Step 1: Start w/ a simple HTML file
Step 2: Start by typing the following function:

Step 3: Save the file and name it "lab14.php"
Step 4: Now test the function by calling it. Place the following lines below the function declaration and run the program:
```php
// Call the function to display the directory
showDirectory(".");
echo("<hr>");

showDirectory("./images");
echo("<hr>");
```
Step 5: 
```php
<?php
    function showDirectory($dir = ".", $recursive_flag = false)
    {
        if(!is_dir($dir))
            echo("<b>Invalid Directory: </b> ($dir) <br />");
        else {
            echo("<b>Directory Listing for: </b> ($dir) <br />");
            if($handle = opendir($dir)) {
                echo("<b>Directory handle: </b> $handle <br />");
                echo("<b>Entries:</b> <br />");
                echo("<ul>");

                while(false !== ($entry = readdir($handle))) {
                    if($entry == "." || $entry == "..") {
                        continue;
                    }
                    if($dir == '.')
                        $entry;
                    else
                        $entry = $dir . '/' . $entry;
                    
                    if(is_dir($entry)) {
                        echo("<b>DIR NAME: </b> $entry <br />");
                        if($recursive_flag == true)
                        {
                            echo("<ul>");
                            showDirectory($entry, $recursive_flag);
                            echo("</ul>");
                        }
                    }
                    elseif(is_file($entry)) {
                        echo("$entry <br />");
                    }
                    elseif(is_link($entry))
                        echo("<b>LINK NAME: </b>: $entry<br />");
                    else
                        echo("Unrecognized directory entry: $entry<br/>");
                }
                echo("</ul>");
                closedir($handle);
            }
        }
    }

    
    showDirectory(".", false);
    echo("<hr>");

    showDirectory("./", true);
    echo("<hr>");

?>
```