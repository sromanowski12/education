•
While Loop
```js
var number=0; while (number<5){
    document.write(number+"<br>");
    number++; 
}
```

•
Do-While Loop
var number=0; do{ document.write(number+"<br>"); number++; } while (number<5) ;
•
For Loop
for (var i=0; i<3; i++){ document.write("This text is repeated three times<br>"); }
•For –in Loop
var userprofile={name:'George', age:30, sex:'male', getage:function(){return this.age}};
for (var attr in userprofile){ document.write("<b>"+attr+":</b> "+userprofile[attr]+"<br />"); }