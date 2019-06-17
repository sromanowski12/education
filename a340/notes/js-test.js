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