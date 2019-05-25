## **JavaScript**
Java vs. JavaScript
- Java
  - OOP language
  - Stand alone language and runs on a virtual machine
  - Compiled in a byte-code (an intermediate machine language) and produces a stand-alone executable
  - Object-oriented (Encapsulation, inheritance, polymorphism)
  - Strongly typed language
- JavaScript
  - Must be part of HTML document and runs within a browser
  - Interpreted line-by-line by the browser
  - Object-based: code uses built0in extensible objects but no classes or inheritance
  - Dynamically typed language
**What is JavaScript**
- A scripting language which is typically used to enhance the functionality and appearance of web pages.
- *de facto* standard for client side programming for web based applications
- Executed by the browser

**Ex**: JavaScript Example
```js
<!DOCTYPE html>
<html>
<head>
<script>
function displayDate()
{
    document.getElementById("placeholder").innerHTML = Date();
}
</script>
</head>
<body>

<h1>My First JavaScript</h1>
<p id="placeholder">the date will appear here...</p>

<button type="button" onclick="displayDate()">Display Date</button>

</body>
</html>
```