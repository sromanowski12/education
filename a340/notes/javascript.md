## **JavaScript**
Both Java & JavaScript syntax are based on the C & C++ language

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

DOM vs. BOM
- DOM
  - Document Object Model (DOM) is an application programming interface (API) for HTML & XML
  - Organizes the entire web page as a document composed of a hierarchy of nodes like a tree structure and using the DOM API, nodes can be removed, added, and replaced
  - *DOM allows the developer to manipulate the document*
- BOM
  - Browser Object Model (BOM) allows access and manipulation of the browser window (i.e. browser history, location, navigator, and screen)
  - Each browser has its own implementation
  - *BOM allows the developer to manipulate the browser window*

**Interacting w/ BOM**

| Window    | Methods/Events/Properties |
|-----------|----------------|
|           | open           |
|           | close          |
|           | name           |
|           | length         |
|           | width          |
|           | parent         |
|           | screenleft     |
|           | screentop      |
|           | alert()        |
|           | prompt()       |
|           | print()        |
|           | moveTo()       |
|           | moveBy()       |
|           | scrollBy()     |
|           | scrollTo()     |
|           | blur()         |
|           | setTimeout()   |
| Screen    |                |
|           | height         |
|           | width          |
|           | colorDepth     |
| Navigator |                |
|           | appName        |
|           | CookiesEnabled |
|           | JavaEnabled    |
| History   |                |
|           | length         |
|           | back()         |
|           | forward()      |
|           | go()           |
| Location  |                |
|           | host           |
|           | hostname       |
|           | href           |
|           | port           |
|           | portocal()     |
|           | assign()       |
|           | reload()       |
|           | replace()      |

**Interacting w/ DOM**

| Propeties | Description/Name    |
|-----------|---------------------|
|           | doctype             |
|           | documentURL         |
|           | inputEncoding       |
|           | xmlEncoding         |
|           | anchors             |
|           | forms               |
|           | images              |
|           | links               |
|           | referrer            |
|           | title               |
|           | URL                 |
|           | domain              |
|           | lastmodified        |
| Methods   |                     |
|           | open()              |
|           | close()             |
|           | write()             |
|           | writeIn()           |
|           | getElementName()    |
|           | getElementById()    |
|           | getElementTagName() |
|           | renameNode()        |
|           | setAttribute()      |
|           | getAttribute()      |
|           | removeAttribute()   |
| Events    |                     |
|           | load                |
|           | close()             |
|           | unload              |
|           | resize              |
|           | scroll              |
|           | click               |
|           | dblclick            |
|           | mousedown           |
|           | mouseup             |
|           | mouseover           |
|           | mouseout            |
|           | keydown             |
|           | keyup               |
|           | keypress            |

**Variables**
- Variables are dynamically typed
- Their type is determined only after they are assigned a value

```js
var myName;         // no data type yet (undefined)
var myNumber;

myName = "Cyrus";   // variable type will become string
myNumber = 5;       // variable type will become int

myNumber = 5.6;     // change the type int to float
myName = 4;         // change the type from string to int
```

**Arrays**
Allocated statically & dynamically.

Dynamic Arrays
```js
var mySchedule = new Array([size]);
mySchedule[0] = "CSCI-A 340";
mySchedule[1] = "MATH-M 215";
```

Literal Arrays
```js
var mySchedule = ["CSCI-A 340", "MATH-M 215"];
```

Array Properties
```js
mySchedule.length;
```

**Operations on Arrays**
Array.sort()
Array.reverse()

Sorting an Array (Bubble Sort)
```vb
Private Sub BubbleSort(ByRef TheArray() As Integer)
    Dim Pass, Index, Hold as Integer
    For Pass = 1 To TheArray.GetUpperBound(0)
        For Index = 0 To TheArray.GetUpperBound(0) - 1
            If (TheArray(Index) > TheArray(Index+1)) Then
                Hold = TheArray(Index)
                TheArray(Index) = TheArray(Index + 1)
                TheArray(Index + 1) = Hold
            End If
        Next Index
    Next Pass
End Sub
```

Array.concat()
```js
var fruits=["Apple", "Oranges"];
var meat=["Pork", "Chicken"];

var dinner=fruits.concat(meat);
//creates ["Apple","Oranges", "Pork", "Chicken"]. fruits and meat arrays not changed. 
var snack=fruits.concat("Grapes", ["Cookies", "Milk"]);
//creates ["Apple", "Oranges", "Grapes", "Cookies", "Milk"] fruits array not changed. 
```

**Associative Arrays**
An Array that uses a "string" (instead of a number) as the index to the elements of an array
```js
var testScore = [];

testScore["Bob"] = 89;
testScore["May"] = 95;

document.write(testScore["Bob"]);

document.write(testScore.length + "<br>");

for(var student in testScore)
{
    document.write(student + " : ");
    document.write(testScore[student] + "<br>");
}
```

**Conditional**
- **If Statement**
```js
if(statement)
{
    statement1;
}
else if(statement2)
{
    statement2;
}
else
{
    statement3;
}
```
- **Switch Statement**
```js
switch(expression)
{
    case label1:
        statement1;
        break;
    case label2:
        statement2;
        break;
    default: statement3;
}
```

**Loops**
- While Loop
```js
var number=0;
while (number < 5){
    document.write(number + "<br>");
    number++;
}
```
- Do-While Loop
```js
var number=0;
do{
    document.write(number + "<br>");
    number++;
}
while(number < 5);
```
- For Loop
```js
for(var i = 0; i < 3; i++){
    document.write("This text us repeated <br>");
}
```
- For -in Loop
```js
var userprofile = {name:'George', age:30, sex:'male', getage:function(){return this.age}};

for(var attr in userprofile){
    document.write("<b>" + attr + ":</b>"+userprofile[attr] + "<br />");
}
```

**User-defined Functions**
```js
function getArea(w, h)
{
    var area = w*h;
    return area;
}

document.writeIn(getArea(3, ))
```

Recursive Functions:
Ex.
```js
function factorial(number)
{
    if(number <=1 )
        return 1;
    else
        return(number * factorial(number-1));
}

alert(factorial(5));
```