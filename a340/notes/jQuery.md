## **JQuery**

```js
<script src="/node_modules/jquery/dist/jquery.js"></script>
<script>
//        $("h1");
$(document).ready(function() {
    $("p").click(function() {
        $(this).hide();
        $("#LeftNav").hide();
        
        var data = $("p").text();
        $("p").text("This text has changed");
        $("p").html("<h1>This changed to a heading</h1>");
        $("#BodyContent").css("background-color", "lightgrey");
        $("#BodyContent").after("<p>This is a new node</p>");
        alert(data);
    });
});

</script>
```

```js
.after()
.append()
.appendTo()
.before()
.insertAfter()
.insertBefore()
.prepend()
.prependTo()

.empty()
.remove()
```

text()
html()
val()
attr()

onclick
oncontextmenu
ondblclick
onmousedown
onmouseenter
onmouseleave
onmousemove
onmouseover
onmouseout
onmouseup

