<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.student.login.UserBean"%>
<%
    response.setHeader("Cache-Control","no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", -1);
    new java.util.Date();
    if(session.getAttribute("currentSessionUser")!=null)
    {
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>UserLoggedIn</title>
<link rel="stylesheet" type="text/css" href="index.css" media="screen" />
<SCRIPT type="text/javascript">
function noBack() {
   window.history.forward();
   }
</SCRIPT>
<style>
.strip {
	position: absolute;
	margin-top: 10px;
	width: 100%;
	background-color: #909090;
	padding: 2px 2px;
}

.strip h2 {
	font-size: .72em;
	color: #300000;
	text-align: center;
}
</style>
</head>

<BODY onload="noBack();">
<body>


	<!-- Always on top: Position Fixed-->
	<header>
	<h1>INDIAN INSTITUTE OF INFORMATION TECHNLOGY,KOTA</h1>
	</header>
	<!-- Fixed size after header-->
	<div class="main">
		<ul>
			<li><a class="active" href="#home">Home</a></li>
			<li><a href="#news">Grades</a></li>
			<li><a href="#contact">News</a></li>
			<li><a href="#about">Contact</a></li>
			<li><a class="active2" href="logout">Logout</a></li>
		</ul>

		<div class="content">

			<% UserBean currentUser = (UserBean)(session.getAttribute("currentSessionUser"));%>
			<div class="strip">
				<h2>
					Welcome
					<%= currentUser.getName() + " " + currentUser.getId() %></h2>
			</div>
		</div>
	</div>
	<!-- Always at the end of the page -->
	<footer> Copyright© IIIT Kota </footer>

</body>

</html>

<%}
else
response.sendRedirect("stlogin.html");%>