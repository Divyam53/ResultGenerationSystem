<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%
    response.setHeader("Cache-Control","no-store, must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", -1);
    new java.util.Date();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<script>
function clearForms()
{
  var i;
  for (i = 0; (i < document.forms.length); i++) {
    document.forms[i].reset();
  }
}
function validateForm()
{
var x=document.forms["myForm"]["un"].value;
if (x==null || x=="")
  {
  alert("Username must be filled out");
  document.getElementById('un').focus();
  return false;
  }
var y=document.forms["myForm"]["pw"].value;
if (y==null || y=="")
  {
  alert("password must be filled out");
  document.getElementById('pw').focus();
  return false;
  }
}
</script>

<title>IIIT Kota/StudentLogin</title>
<link rel="stylesheet" type="text/css" href="ststyle.css" media="screen" />
</head>
<body onLoad="clearForms()" onunload="clearForms()">
	<!-- Always on top: Position Fixed-->
	<header>
	<h1>INDIAN INSTITUTE OF INFORMATION TECHNLOGY,KOTA</h1>
	</header>
	<!-- Fixed size after header-->
	<div class="main">
		<ul>
			<li><a class="active" href="#home">Home</a></li>
			<li><a href="#news">News</a></li>
			<li><a href="#contact">Contact</a></li>
			<li><a href="#about">About</a></li>
		</ul>

		<div class="content">
			<div id="container">
				<div class="text">
					<img src="images/stud.jpeg" alt="logo" />
					<h1>STUDENT LOGIN</h1>
				</div>
				<form action="login" onsubmit="return validateForm()" method="post"
					name="myForm">
					<label for="username">Username:</label> <input type="text"
						id="username" name="username"> <label for="password">Password:</label>
					<input type="password" id="password" name="password">
					<div id="lower">
						<input type="checkbox"><label class="check" for="checkbox">Keep
							me logged in</label> <input type="submit" value="Login">
					</div>
					<!--/ lower-->
				</form>
			</div>
		</div>
	</div>
	<!-- Always at the end of the page -->
	<footer> Copyright© IIIT Kota </footer>
</body>
</html>
