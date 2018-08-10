<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.admin.login.FacultyParameters"%>
<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if (session.getAttribute("currentFacultySessionUser") != null) {
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>UserLoggedIn</title>
<link rel="stylesheet" type="text/css" href="index.css" media="screen" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<SCRIPT type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	var x = new String("");
	jQuery(function() {
		jQuery('#loadPage').click(
				function() {
					jQuery('#options').load('changeFacultyPasswordForm.jsp',
							function() {
								alert('Change Your Password')
							});
				});
	})
	function abc(verifyType) {
	
		switch (verifyType) {
		case "T": 
			$("#buttons").load("facultyOptions.jsp");
			break;
		case "M":
			$("#options").load("checkerOptions.jsp");
			break;
		default:
			$("#options").load("adminOptions.jsp");
			break;
		}
	}

</SCRIPT>
<style>
.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	align
	="center";
}
</style>

</head>

<BODY onload="noBack();">
<body>


	<!-- Always on top: Position Fixed-->
	<header>
	<table>
	<tr>
		<td><img src="images/logo.gif" style="width:50%;height:50%;"></td>
		<td><h1>&nbsp; &nbsp; &nbsp; &nbsp; INDIAN INSTITUTE OF INFORMATION TECHNOLOGY, KOTA</h1></td>
	</tr>
	</table>
	</header>
	<!-- Fixed size after header-->
	<div class="main">
		<ul>
			<li><a class="active" href="facultyLogged.jsp">Home</a></li>
			<li><a href="javascript:void(0);" id="loadPage">Change
					Password</a></li>
			<li><a href="#contact">News</a></li>
			<li><a href="javascript:void(0);" id="loadPage1">Contact</a></li>
			<li><a class="active2" href="facultylogout">Logout</a></li>
		</ul>

		<div class="content">

			<%
				FacultyParameters facultyUser = (FacultyParameters) (session.getAttribute("currentFacultySessionUser"));
			%>
			<div class="strip">
				<h2 >
					Welcome
					<%=facultyUser.getFacName() + " " + facultyUser.getFacId()%></h2>
			</div>
			<div class="options" id="options">
				<div id="first">
					<table class="profile" "border="1" style="width: 100%">
						<tr>
							<td width="70%" style="color:black;">Faculty Name: <%=facultyUser.getFacName()%>

								<div align="left" style="color:black;">
									Faculty ID:
									<%=facultyUser.getFacId()%></div>

								<div align="left" style="color:black;">
									Email:
									<%=facultyUser.getFacEmail()%></div>

								<div align="left" style="color:black;"></td>

							<td width="30%">
								<div style="">
									<img border="0" src="images/logo.gif" height="120" width="160" />
								</div>
							</td>

						</tr>
					</table>
				</div>
				<div id="buttons">
					<h2 align="center" style="color:black;">
						Welcome

						<%
						String uname = facultyUser.getFacId();
							String verifyType = uname.substring(0, 1);
							System.out.print(verifyType);
							switch (verifyType) {
							case "T":
								out.print("Faculty");
								//response.sendRedirect("facultyLogged.jsp"); //logged-in page 
								break;
							case "M":
								out.print("Operator");
								//response.sendRedirect("contact.jsp");
								break;
							default:
								out.print("Admin");
								break;
							}
					%>
					</h2>


					<center>
						<button class="button" id="buttonid"
							onClick="abc('<%=verifyType%>')">Continue</button>
					</center>
				</div>

			</div>
		</div>
	</div>
	<!-- Always at the end of the page -->
	<footer> Copyright© IIIT Kota </footer>

</body>

</html>
<%
	} else
		response.sendRedirect("fclogin.html");
%>