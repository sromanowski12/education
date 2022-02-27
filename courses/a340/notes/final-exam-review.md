6/22/2019

## **Final Exam Review**
### **Quiz Review**
---
#### <u>**Quiz 1 Review**</u>
1. Keeping page styling together with the page content and structure enables you to easily change the look and feel of the pages on an entire website, or a portion of a website.
- FALSE
2. An ordered list cannot be nested inside an unordered list.
- FALSE
3. Hyperlinks in an HTML document are denoted by  `<link>` elements.

#### <u>**Quiz 2 Review**</u>
1. HTML tag to put JavaScript in

    `<script>`
2. JavaScript syntax to display "Hello World"

    `document.write("Hello World");`
3. Correct place to insert JavaScript

- Both `<head>` & `<body>`
8. Creating an array
    ```js
    var txt = new Array("tim", "kim", "jim");

    var txt = new Array(1, "tim", 2, "kim", 3, "jim");
    ```
12. Differences between Java & JavaScript

    Java is an OOP language and JavaScript is a scripting language. Unlike Java, JavaScript is Object-based and used built-in objects, extensible objects, but no classes or inheritance. Java as an OOP language incorporates encapsulation, inheritance, and polymorphism.

    Java is compiled and JavaScript is interpreted. Java is compiled as byte-code and produces a stand-alone executable. JavaScript is interpreted line-by-line by the browser.

    JavaScript is a dynamically typed language which allows variables to be called prior to declaring them. Disadvantages of which include run-time errors. Java is a strongly typed language.
1.  Purpose of the map function



#### <u>**Quiz 3 Review**</u>
#### <u>**Quiz 4 Review**</u>
1. PHP server scripts are surrounded by which of the following delimiters?

    `<?php ... ?>`
2. How do you write "Hello World" in PHP?
```php
echo "hello world";
```
3. PHP variables start w/?
- $
4. Get form information w/ GET method
`$_GET[]`


### **Test Review**
---
#### <u>**Test 1 Review**</u>
1. An external JavaScript file must contain the `<script>` tag
- FALSE

### **Web Concepts**
---
**Network**: a group of two or more computer systems linked together
**Internet**: a network of computers
**Hyper Text Transfer Protocol (HTTP)**: one of the transfer (data communication) protocols used in the WWW
**Hyper Text Transfer Protocol Secure (HTTPS)**: implemented as a SSl or TLS on top of existing protocols
**IP Address**: unique address assigned to each user connected
**IP Packet**: packets of data that tell where they came from and where they are going

### **HTML**
---
Hyper Text Markup Language (HTML): used for describing and creating web documents
`<title>`: displays the title of the web page
`<meta>`: provides metadata about the HTML document
`<meta charset="UTF-8">`
`<meta name="keywords" content="Keywords">`
`<meta name="author" content="Seth Romanowski">`
`<base>`: the default address for all links on the page
`<style>`: Internal CSS
`<script>`: Internal client-side script
`<link>`: External CSS

Helps the browser identify & display the web document
```html
<!DOCTYPE>
```

**External Files**

- External CSS
```html
<link rel="stylesheet"
        type="text/css"
        href="style1.css">
```
- External JavaScript
```html
<script type="text/javascript">
</script>
```
- External PHP
```php
require("server-script.php");
include("server-script.js");
include_once("server-script.php");
```


**Form Elements**
```html
<input type="text" name="textBox" size="5" maxlength="10" value"">
```
```html
<textarea name="message" rows="10" cols="30">
The cat was playing in the garden.
</textarea>
<button type="button" onclick="alert('Hello World!')">Click Me!</button>
```
```html
  User name:<br>
  <input type="text" name="username"><br>
  User password:<br>
  <input type="password" name="psw">

  <input type="submit" value="Submit">

  <input type="radio" name="gender" value="male" checked> Male<br>
  <input type="radio" name="gender" value="female"> Female<br>

  <input type="checkbox" name="vehicle1" value="Bike"> I have a bike<br>
  <input type="checkbox" name="vehicle2" value="Car"> I have a car <br>
 
 Birthday:
 <input type="date" name="bday">

```
```html
<select name="cars">
  <option value="volvo">Volvo</option>
  <option value="saab">Saab</option>
  <option value="fiat">Fiat</option>
  <option value="audi">Audi</option>
</select>
```



### **JavaScript**
---

**Strings**
**Arrays**
**Associative Arrays**
```
var testScore = [];
testScore["Bob"] = 74;
testScore["Mary"] = 98;

document.write(testScore["Bob"] + " " + testScore["Mary"]);

```
**Output**
```js
document.write("Hello");
```

**Document Object Model (DOM)**
- Document Object
**Browser Object Model (BOM)**
- Window
  - window.open("");
- History
- Location
- Navigator
- Browser

```js
//Sort Alphabetically and ascending: 
var myArray=["Bob","Bully","Amy"]; myArray.sort(); 
//Array now becomes ["Amy", "Bob", "Bully"]; 
//Sort Alphabetically and descending: 
var myarray=["Bob","Bully","Amy"];
myArray.sort(); myArray.reverse(); 
//Array now becomes ["Bully", "Bob", "Amy“]
//Sort numerically and ascending: 
var myArray=[25, 8, 7, 41]; myArray.sort(function(a,b){return a - b}); 
//Array now becomes [7, 8, 25, 41]
//Sort numerically and descending: 
var myArray=[25, 8, 7, 41]; myArray.sort(function(a,b){return b - a}); 
//Array now becomes [41, 25, 8, 7]
```

### **CSS**
---
**Cascading Style Sheet (CSS)**: used to control the "style & layout" of web documents. *Can be external or included in the HTML document*

- Difference between an ELEMENT and an ATTRIBUTE
**Element**
Everything from the start tag to the end tag. 
Starts with a start tag and ends with an end tag.
Element content is everything between the start & end tag.

**Attribute**
- Difference between a BL
_Internal_:
```html
<head>
    <style>
    </style>
</head>
```
### **PHP**
---
**Hypertext Preprocessor (PHP)**: server-side scripting language used for web application logic
* Based on C/C++ language
* Open source
* Can be embedded in HTML documents
* Can also embed HTML tags and data
* Web server needs a PHP interpreter to interpret the embedded PHP statements

When a client request a file with a ".php" extension, the web server sends the request to the PHP interpreter for pre-processing
PHP interpreter will interept the code adn return HTML back to the web server, which is then sent to the client
**Server Side Programming**
**Variables**
- Variables in PHP are dynamically typed
  - Their type is only determined after they are assigned a value
- Variable names start with a "$"
- Variables are case sensative
- Uninitialized variables will be undefined and printing them will produce a syntax error

**Constants**
- No "$"
- Use the `define` function

**Data Types**
- String
  - **Functions**
    - gettype()
    - strlen()
    - strtoupper(), strtolower()
    - ucfirst(), ucwords()
    - strstr(), trim(), strrev()
    - stripslashes(), addslashes()
- Integer
- Float
- Boolean
  - **Functions**
    - isset()
    - unset()
    - is_numeric()
    - is_float()
    - is_array()
- Array
  - **Functions**
    - count()
    - sizeof()
    - max()
    - min()
    - sort()
    - rsort()
    - implode()
    - explode()
- Object

**Cookies**
A cookie is often used to identify a user. A cookie is a small file that the server embeds on the user's computer. Each time the same computer requests a page with a browser, it will send the cookie too. With PHP, you can both create and retrieve cookie values.


**Input (Using Cookies)**
- Creating a Cookie on the client's browser
```php
$cookieName = "IU-RETAIN";
$cookieValue = "Spring 2013";
$expire = time() + 20;
$expire = time() + (60*60*24*7);

setcookie($cookieName,$cookieName,$expire);
```

**Input (Using Cookies)**

**Input (Using SESSION)**
- A SESSION is bassically a data structure associated with a given browser session
- When the user's browser connects to web application (on a web server), the application can choose to create a new session for the client
- Once the session is created user's data (while they are interacting with the application) can be stored in the SESSION data structure, allowing the user to transfer its data from one web page to the next, until the interaction with the application is complete.
- **To initiate a session we must:**
1. Issue a session_start() statement
- *This must be done before anything else is sent to the server*
2. Store or retieve session information

```php
$_SESSION['firstname'] = "Cyrus";
$Name = $_SESSION['firstname' ;  
```

**Loops**
- **While**
```php
$number = 0;
while($number<5) {
    echo($number + "<br />");
    $number++;
}
```
- **Do-While**
```php
$number = 0;
do {
    echo $number . "<br />";
} while ($number < 5);
```
- **For**
```php
for($i=0; $i<3; $i++)
{
    echo("repeat <br />");
}
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

**User-defined Functions**
```php
function getArea($w, $h)
{
    $area = $w * $h;
    return $area;
}

echo("The area is: " . getArea(3, 5));
```

**Recursive Functions**
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

**Object Oriented Programming (OOP)**
- **Encapsulation**
  - Achieved by tightly coupling the data structure & its related functions
  - Access to the data is only possible through the public interface provided
    - Hides the details of the object from the client
- **Inheritance**
  - A new class can inherit or reuse the behavior and structure of previously defined classes
  - The Sub-Classes (Derived Classes) can extend or ass more functionality to the base class
  - A natural tool to express relationships such as classification, specialization, generalization, evolution, and approximation
- **Polymorphism**
  - Alows the same method name to be used to perform a "given general task" on a number of different data types
  - Allows the use of the same method name to perform different functions
  - 2 Methods:
    - Overloading
      - *not supported in PHP*
    - Overriding
- **Constructor**
  - __construt()
    - *Purpose*: prepare the object for initial use
- **Destructor**
  - __destruct()
### **MySQL**
- **Database**: logically coherent collection of data with inherent meaning
  - An integrated, shared repository of operational data
- **Why Use a Database?**
  - Controlled redundancy
  - Restricted & authorized access (Users, databases, tables)
  - Persistent storage
  - Ability to represent complex relationship among data
  - Enforce integrity constraints
  - Backup and recovery
  - Standardized Query Language (SQL)
- **Database Management System (DBMS)**
  - A collection of programs that enable the user to create & maintain a database
  - Provides the following capabilites:
    - Defining the database
      - Schema, attributes, types, size, constraints
    - Populate the database
    - Manipulate the database
- **Data Model**
  - An abstract model that organizes elements of data and standardizes how they relate to one another and to properties of the real world entities
- **Entitiy Relationship Diagram (ERD)**: shows the relationships fo entity sets stored in a database.
- 