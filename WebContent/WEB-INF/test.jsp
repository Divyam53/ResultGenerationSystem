<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.student.login.UserBean"%>
<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if (session.getAttribute("currentSessionUser") != null) {
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
<SCRIPT type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	jQuery(function(){
		jQuery('#loadPage').click(function(){
			jQuery('#options').load('test.html', 
					function(){alert('Content Successfully Loaded.')} 
			);
		});
	})	
</SCRIPT>

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
			<li><a href="changepassword.jsp">Change Password</a></li>
			<li><a href="#contact">News</a></li>
			<li><a href="javascript:void(0)" id="loadPage">Contact</a></li>
			<li><a class="active2" href="logout">Logout</a></li>
		</ul>

		<div class="content">

			<%
				UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
			%>
			<div class="strip">
				<h2>
					Welcome
					<%=currentUser.getName() + " " + currentUser.getId()%></h2>
			</div>
			<div class="options" id="options">
				<div id="first">
					<table class="profile" "border="1" style="width: 100%">
						<tr>
							<td width="70%">Student Name: <%=currentUser.getName()%>

								<div align="left">
									Student ID:
									<%=currentUser.getId()%></div>

								<div align="left">
									DateOfBirth:
									<%=currentUser.getDob()%></div>

								<div align="left">
									Program:
									<%=currentUser.getProgram()%></div>

								<div align="left">
									Father's Name:<%=currentUser.getFname()%></div>



							</td>

							<td width="30%">
								<div style="">
									<img border="1" src="" height="120" width="160" />
								</div>
							</td>

						</tr>
					</table>
				</div>
				<div id="buttons">
					<a href="test.html" id="0" class="mybutton myred">Div 1</a> <a
						href="#" id="1" class="mybutton myblue">Div 2</a> <a href="#"
						id="2" class="mybutton myblue">Div 3</a>
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
		response.sendRedirect("stlogin.html");
%>