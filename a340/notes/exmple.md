<head>
<script type="text/javascript">
    function displayDate()
    {
        var myDoc = document.getElementById("placeholder");
  //      document.getElementById("placeholder").innerHTML = Date();
        myDoc.innerHTML = "<b>This is a test</b><br>";
    }
    function setHeight()
    {  
        var h;
        var btn = document.createElement("button");
        var para = document.createElement("p");
        para.innerHTML = "This is a paragraph"; 
        btn.innerHTML = "CLICK ME";
        document.body.appendChild(para);
        document.body.appendChild(btn);
    }
    function newBrowser()
    {
        var mySchedule = new Array(1);
        mySchedule[0] = "CSCI-A 340";
        mySchedule[1] = "ENG-W 301";
        for(var course in mySchedule)
        {
            document.write(mySchedule[course] + "<br />");
        }
    }
    function sortHoses()
    {
        var myDoc = document.getElementById("placeholder");
        var blkHose = [36, 42, 12, 19, 17, 79, 144];
        for(var hose in blkHose)
        {
            document.write(blkHose[hose] + "<br />");
//            document.body.appendChild(myDoc.innerHTML);
        }
        blkHose.sort();
        for(var hose in blkHose)
        {
            document.write(blkHose[hose] + "</style><br />");
//            document.body.appendChild(myDoc.innerHTML);
        }
    }
    function getGHeightAdj(h, w, inc)
    {
        var temp = ((h-inc)*w);
        var para = document.createElement("p");
        para.innerHTML = temp;
        document.body.appendChild(para);
    }
    function getArea(w, h)
    {
        var area = w*h;
        var myDoc = document.getElementById("placeholder");
        myDoc.innerHTML = "<b>"+area+"</b>";
    }
    function getSQF(w, h, div)
    {
        var sqf = ((w*h)/div);
        var myDoc = document.getElementById("placeholder");
        myDoc.innerHTML = "<b>"+sqf+"</b>";
    }
</script>
</head>
<body>
<div id="container" style="width:500px">

<div id="header"
                style="background-color:gray;
                text-align:center;
                height:50px;
                width:500px;">
<h1>Title of the Page</h1>
</div>
<div id="leftnav"
                style="height:200px;
                width:100px;
                float:left;">

<b>Left Nav</b> <br />
HTML<br>
CSS<br>
JavaScript<br>
PHP
</div>

<div id="rightnav" 
                style="height:200px;
                width:100px;
                float:right;">
Right Nav<br />
About<br>
Contact
</div>
<div id="content"
                style="background-color:lightgray;
                color:black;
                text-align:left;
                height:200px;
                width:300px;
                float:left;">
<center><h2>Title of the Page</h2></center>

#### **This is an example of Markdown**
<input type="text" value="0">
<button type="button" onclick="newBrowser()">Display Date</button>

<div id="placeholder"></div>
</div>

</div>
</body>