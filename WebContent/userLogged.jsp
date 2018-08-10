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
<link rel="stylesheet" type="text/css" href="ststyle.css" media="screen" />
<link rel="stylesheet" type="text/css" href="index.css" media="screen" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<SCRIPT type="text/javascript">
	function noBack() {
		window.history.forward();
	}
	jQuery(function(){
		jQuery('#loadPage').click(function(){
			jQuery('#options').load('changePasswordForm.jsp', 
					function(){alert('Change Your Password')} 
			);
		});
	})
		jQuery(function(){
		jQuery('#loadContactPage').click(function(){
			jQuery('#options').load('contact.jsp'
			);
		});
	})
	jQuery(function(){
		jQuery('#grade').click(function(){
			jQuery('#options').load('student_result.html'
			);
		});
	})


</SCRIPT>

</head>

<BODY onload="noBack();">
<body>


	<!-- Always on top: Position Fixed-->
<header>
	<table>
	<tr>
		<td><img src="images/logo.gif" style="width:50%;height:50%;"></td>
		<td><h3>&nbsp; &nbsp; &nbsp; &nbsp; INDIAN INSTITUTE OF INFORMATION TECHNOLOGY, KOTA</h3></td>
	</tr>
	</table>
	</header>
	<!-- Fixed size after header-->
	<div class="main">
		<ul>
			<li><a class="active" href="home.html">Home</a></li>
			<li><a href="javascript:void(0)" id="loadPage">Change
					Password</a></li>
			<li><a href="#" id="grade">Grades</a></li>
			<li><a href="javascript:void(0)" id="loadContactPage">Contact</a></li>
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
							<td width="70%" style="color:black;" > Student Name: <%=currentUser.getName()%>

								<div align="left"style="color:black;">
									Student ID:
									<%=currentUser.getId()%></div>

								<div align="left"style="color:black;">
									DateOfBirth:
									<%=currentUser.getDob()%></div>

								<div align="left"style="color:black;">
									Program:
									<%=currentUser.getProgram()%></div>

								<div align="left" style="color:black;">
									Father's Name:<%=currentUser.getFname()%></div>



							</td>

							<td width="30%">
								<div style="">
									<img border="0" src="images/<%=currentUser.getId()%>.jpg" height="160px" width="30%" />
								</div>
							</td>

						</tr>
					</table>
				</div>
				<div id="buttons" style="color:black;" >OPTIONS</div>
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