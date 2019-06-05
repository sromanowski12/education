
## **PHP**
```php
<?php
    echo "This is my first php script!";
?>
```

**Variables**
Start w/ a "$" and are dynamically typed
- Type is determined after assigned a value

Un-initialized variable will be undefined and printing them will produce a syntax error


**Constants**
- No $ for constants
- Use the *define* function to create constants

```php
define('Pi',3.141592);
echo(Pi);
```

**Data Types**
- String
- Integer
- Float
- Boolean
- Array
- Object

**Strings**

- **Functions**
  - gettype()
  - strlen()
  - strtoupper(), strtolower()
  - ucfirst(), ucwords()
  - strstr(), trim(), strrev()
  - stripslashes(), addslashes()
  - crypt(), md5()

**Boolean**

- **Functions**
  - isset()
  - unset()
  - is_numeric()
  - is_integer()
  - is_float()
  - is_array()

**Arrays**

- **Attributes/Operations**
  - count()
  - sizeof()
  - min()
  - max()
  - sort()
  - rsort()
  - implode()
  - explode()
- **Associative Array**
```php
$myArray = array("Name" => "Tom", "Grade" => 79);
```

**Output**
```php
echo("hello");

print("hello");

print_r(object or array);

var_dump(var or array or object)
```

- var_dump()
  - Not exactly an output statement but it displays structured information about one or more expressions that includes its type and value.
  - Array and objects are exlored recursively with values to show structure.

**Input**
*There is no specific input statement in PHP*

Input is typically sent to a web application in the following ways:
1. POST (ex. HTML form & GUI control)
- This data is put into the super-global associative array
- You can get the data back w/ `$_POST['objectname']`
2. GET (ex. the URL http://.../?id=47&name=cyrus)
- This data is put into the super-global associative array
- You can get the data back w/ `$_GET['id']` & `$_GET['name']`
3. Cookies
4. SESSION variables
5. Files
6. Databases

**Stateless vs. Stateful Sessions**
- By default, interactions with the web client and a web server is stateless. Which means that when the user first arrives at a page, it has no memory of what has happened before. In other words, it does not remember the state it was in, before it got here
- Similarly, when the user moves from the current page to a different page, it does not preserve its state information, before leaving the page

**Input from Form (Using POST)**
```php
<?php
echo("<h3>PHP Input using POST</h3>");

echo("<form action='06_1_process_post.php' method='post'>" );
    echo("<label> User Name: </label>");
    echo("<br />");
    echo("<input type='submit' name='submit' value='Submit' />");
echo("</form>");
?>
```

**Input Using Form (Using GET)**
```php
echo("<h3>PHP Input using GET</h3>");

echo("<form action='06_2_process_get.php' method='get'>" );
    echo("<label> User Name: </label>");
    echo("<br />");
    echo("<input type='submit' name='submit' value='Submit' />");
echo("</form>");
```

**Input (Using Cookies)**
- Creating a Cookie on the client's browser
```php
<?php
    // Cookies must be the first thing in the header that is sent to the server 
    // (before any HTML)

    $cookieName = "IU-RETAIN";
    $cookieValue = "Spring 2013";
    $expire = time() + 20;              // expire in 20 seconds
    $expire = time() + (60*60*24*7);    // expire in one week

    setcookie($cookieName, $cookieValue, $expire);
?>
```

- **Getting the value of the Cookie from the client browser**
```php
if(isset($_COOKIE['IU-RETAIN']))
{
    echo($_COOKIE['IU-RETAIN']);
    echo("welcome back!");
}
else {
        echo("Cookie does not exist");
}
```

**Loops**
- **While**
```php

```
- **Do-While**
```php

```
- **For**
```php

```
- **Foreach**
```php
$myArray = array(1,3,5,7);
foreach($myArray as $value)
    echo($value . "<br />");
```
- **Foreach Loop & Associative Array**
```php
$myArray = array( "key1" => "hello",
                  "key2" => "greeting",
                  "key3" => 5);

foreach($myArray as $key => $value)
{
    echo($key . ":" . $value . "<br />");
}
```

**Conditional**
*Same as C & C++*

- **If Statement**
```php
if(expression)
    statement1;
else if(expression2)
    statement2;
else
    statement3;
```
- **Switch Statement**
```php
swtich(expression) {
    case label1:
            statement1;
            break;
    case label2:
            statement2;
            break;
    default: statement3;
}
```

**User-Defined Functions**
```php
function getArea($w, $h)
{
    $area = $w * $h;
    return $area;
}

echo("The area of a 3x5 rectangle is: " . getArea(3, 5));
```

**Recusrive Functions**
```php
function factorial($number)
{
if($number <= 1)        // base case
        return 1;
    else
        return($number * factorial($number - 1));
}

echo(factorial(5)); // call the function
```

**Function to Create a Form**
```php
function displayForm()
{
    echo("<form action='processForm.php' method='POST'>");
        echo("<div id='TheForm'>");
        echo("<h1 align='center'>Become a Club Member</h1>");
        echo("<table border='1'>");
        echo("<tr>");
        echo("<td><label>Name</label></td>");
        echo("<td><input type='text' name='name' size='20'></td>");
        echo("</tr>");
        echo("<tr>");
        echo("<td><label>Phone</label></td>");
        echo("<td><input type='text' name='name' size='20'></td>");
        echo("</tr>");
        echo("</table>");
        echo("<input type='submit'>");
        echo("</div>");
    echo("</form>");
}

displayForm();
```

**Including Other PHP Files**
Similar to other languages, it is usually a good idea to place the PHP functions in a seperate file and simply include them in out application when necessary

- 3 methods for including a PHP file into another file:
1. include(...)
- will try to load the file, but if it can't load, it will provide a warning

```php
include("13_php_function.php");
```
2. require(...)
- identical to INCLUDE except upon failure, it will cause an error and halt the script

```php
require("13_php_function.php");
```
3. require_once(...)
- similar to REQUIRE but it will maintain the set of files that are required and it will not load them more than once
```php
require_once("13_php_function.php");
```

