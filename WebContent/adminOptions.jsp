<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
  <title>IIIT KOTA</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
  p {
    background:white;
  }

.button:hover {background-color:#1ABC9C  }
  table {
    border-collapse: separate;
    border-spacing: 10px;
}
tr {
height:30px;
width:70px;
border:hide;
text-align:center;
border: 1px;}
.div1 {
margin-top:30px;
text-align: center;
background-color:#F3F3F3;
height:150px
}
.div2 {
  text-align: center;
}
 ul#menu {
    padding: 0;
    margin-bottom: 11px;
}

ul#menu li {
    display: inline;
    margin-right: 3px;
}

ul#menu li button {
    background-color: #ffffff;
    padding: 10px 20px;
    text-decoration: none;
    color: #696969;
    border-radius: 4px 4px 0 0;
}

ul#menu li button:hover {
    color: white;
    background-color: blue;
}
  </style>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script><nav id="nav01"></nav>
</head>

<body style="background-color:#16A085">
<div style="text-align: center;" >
<h1 style="margin-top:30px" id="welcome" style="color:black;">Welcome Admin!</h1>
</div>
<div class="div2" id="div2">
<div class="container">
  <a type="button" class="btn btn-info" data-toggle="collapse" data-target="#demo" id='check';>Button</a>
  <div id="demo" class="collapse">
   <table style="margin-left:220px">
</table>
  </div>
</div>

</div>
<script >document.getElementById("check").style.visibility = "hidden"; 
document.getElementById("welcome").style.visibility = "visible"; 
document.getElementById("nav01").innerHTML =
"<ul id='menu'>" +
"<li><button onclick='verify()' id='verify'>Verify</button></li>" +
"<li><button onclick='lock()' >Lock Result</button></li>" +
"<li><button onclick='addOperator()' id='operator'>Add Operator</button></li>" +
"<li><button onclick='addCourse()' id='course'>Add Course</button></li>" +
"</ul>"; 
function verify(){
document.getElementById("check").innerHTML="<select color='black'>"+
	  "<option value='#'>Volvo</option>"+
	  "<option value='saab'>Saab</option>"+
	  "<option value='mercedes'>Mercedes</option>"+
	  "<option value='audi'>Audi</option>"+
	  "</select>";
document.getElementById("check").style.visibility = "visible";
}
function update(){
document.getElementById("check").innerHTML="Update Result";
}
function lock(){
document.getElementById("check").innerHTML="Lock Result";
document.getElementById("check").style.visibility = "visible";
}
function addOperator(){
	document.getElementById("welcome").style.visibility = "hidden"; 
	 $('#div2').load('addOperator.jsp');																
	}
function addCourse(){
	document.getElementById("welcome").style.visibility = "hidden"; 
	$('#div2').load('addCourse.jsp');
	}
</script>
</body>
</html>
<!-- button {

  display: inline-block;
  padding: 15px 25px;
  font-size: 24px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #1ABC9C;
  border: none;
  border-radius: 15px;
 
}-->