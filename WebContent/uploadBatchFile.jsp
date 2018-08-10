
<%
	String sem=(String)request.getParameter("id");
	request.getSession().setAttribute("id",sem);
	System.out.println("Batch to be added: "+sem+" ");
%>
<%@ page language="java" contentType="text/html; charset=windows-1256" 
	geEncoding="windows-1256" import="com.admin.login.FacultyParameters"
%>
<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if (session.getAttribute("currentFacultySessionUser") != null) {
%>
<jsp:include page="header.jsp" />
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="Dashboard">
		<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
		<title>IIITKota - Admin	</title>
		<!-- Bootstrap core CSS -->
		<link href="assets/css/bootstrap.css" rel="stylesheet">
		<!--external css-->
		<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
		<link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
		<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">
		<!-- Custom styles for this template -->
		<link href="assets/css/style.css" rel="stylesheet">
		<link href="assets/css/style-responsive.css" rel="stylesheet">
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
		<script src="assets/js/chart-master/Chart.js"></script>
	</head>	
	<body>
		<section id="container">
			<%
				FacultyParameters facultyUser = (FacultyParameters) (session.getAttribute("currentFacultySessionUser"));
			%>
			<!--sidebar start-->
			<aside>
				<div id="sidebar" class="nav-collapse ">
					<!-- sidebar menu start-->
					<ul class="sidebar-menu" id="nav-accordion">
						<p class="centered">
							<a href="adminIndex.jsp">
								<img src="assets/img/ui-zac.jpg	class="img-circle" width="60">
							</a>
						</p>
						<h5 class="centered"><%=facultyUser.getFacName()%></h5>
						<li class="mt">
							<a class="active" href="adminIndex.jsp"> 
								<i class="fa fa-dashboard"></i> 
								<span>Home</span>
							</a>
						</li>
						<li class="sub-menu">
							<a href="javascript:;"> 
								<i class="fa fa-desktop"></i>
								<span>Edit Info</span>
							</a>
							<ul class="sub">
								<li><a href="#" onclick="changePassword()">Change Password</a></li>
							</ul></li>

						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-cogs"></i> <span>Manage Data Operators</span>
						</a>
							<ul class="sub">
								<li><a href="#" onClick="abc()" >Show All</a></li>
								<li><a href="#" onClick="addopr()">Register New</a></li>
								<li><a href="#">Delete</a></li>
							</ul></li>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-book"></i> <span>Manage Students</span>
						</a>
							<ul class="sub">
								<li><a href="#" onclick="loadFirstBatch() ">2013 Batch</a></li>
								<li><a href="#" onclick="loadSecondBatch()">2014 Batch</a></li>
								<li><a href="#" onclick="loadThirdBatch()">2015 Batch</a></li>
								<li><a href="#" onclick="addNewBatch()">Add Batch</a></li>
							</ul></li>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-tasks"></i> <span>Manage Faculty</span>
						</a>
							<ul class="sub">
								<li><a href="#" onclick="showFaculty()">Show All</a></li>
								<li><a href="#" onclick="registerFaculty()">Register New</a></li>
								<li><a href="#" onclick="assignCourse()">Assign Course</a></li>
							</ul></li>
						<li class="sub-menu"><a href="javascript:;"> <i
								class="fa fa-th"></i> <span>Courses</span>
						</a>
							<ul class="sub">
								<li><a href="#" onClick="showCourse()">Available Courses</a></li>
								<li><a href="#" onClick="addCourse()">Add Course</a></li>
							</ul></li>
						<li class="sub-menu"><a name="fetchdata"  href="<%=request.getContextPath()%>/facultylogout"> <i
								class=" fa fa-bar-chart-o"></i> <span >Logout</span>
						</a></li>

					</ul>
					<!-- sidebar menu end--><a href="<%=request.getContextPath()%>/callme">
				</div>
			</aside>
			<!--sidebar end-->
			<!--sidebar end-->

			<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT///////////////////////////////////////////////////////////////////// -->
			<!--main content start-->
			<section id="main-content">
			
				<section class="wrapper">

					<div class="row">	<div id="loadfile">
						 <form method="post" action="uploadBatchFile" enctype="multipart/form-data">
			<h1>Add a new Batch</h1>

			<div class="col-md-12">
				<div class="content-panel">
					<h4>
						<i class="fa fa-angle-right"></i> 
					</h4>
					<hr>
					<center>
						<table style="width: 40%;" class="table">
					<tbody>

		

						
							<tr>
							<th> Select file to upload:</th>
							<th> <input type="file" name="uploadFile" /></th>
						</tr>
						

						<tr>
							<th></th>
							<th><a href="gradesheet.xlsx" target="_blank">Click here</a>
								To view input format</th>
						</tr>
	</tbody>
						</table>
					</center>
					<center>
				
							
							
						 <input type="submit" value="Upload" />
						</th>
					</center>
				</div>
				<! --/content-panel -->
			</div>
			<!-- /col-md-12 -->

		</form>

						<!-- *************************88RIGHT SIDEBAR content ends here**************************************** -->
					</div>
					<! --/row -->
				</section></div>
			</section>

			<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT ENDS HERE//////////////////////////////////////////////////////////////////-->
			<!--footer start-->
			<footer class="site-footer">
				<div class="text-center">
					


	Copyright 2016 - IIIT Kota - All rights reserved
	 <a href="facultyIndexx.jsp" class="go-top"> <i
						class="fa fa-angle-up"></i>
					</a>
				</div>
			</footer>
			<!--footer end-->
		</section>

		<!-- js placed at the end of the document so the pages load faster -->
		<script src="assets/js/jquery.js"></script>
		<script src="assets/js/jquery-1.8.3.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script class="include" type="text/javascript"
			src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
		<script src="assets/js/jquery.scrollTo.min.js"></script>
		<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
		<script src="assets/js/jquery.sparkline.js"></script>


		<!--common script for all pages-->
		<script src="assets/js/common-scripts.js"></script>

		<script type="text/javascript"
			src="assets/js/gritter/js/jquery.gritter.js"></script>
		<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

		<!--script for this page-->
		<script src="assets/js/sparkline-chart.js"></script>
		<script src="assets/js/zabuto_calendar.js"></script>


		<script type="application/javascript">
			$(document).ready(function () {
				$("#date-popover").popover({html: true, trigger: "manual"});
				$("#date-popover").hide();
				$("#date-popover").click(function (e) {
					$(this).hide();
				});
			
				$("#my-calendar").zabuto_calendar({
					action: function () {
						return myDateFunction(this.id, false);
					},
					action_nav: function () {
						return myNavFunction(this.id);
					},
					ajax: {
						url: "show_data.php?action=1",
						modal: true
					},
					legend: [
						{type: "text", label: "Special event", badge: "00"},
						{type: "block", label: "Regular event", }
					]
				});
			});
			
			
			function myNavFunction(id) {
				$("#date-popover").hide();
				var nav = $("#" + id).data("navigation");
				var to = $("#" + id).data("to");
				console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
			}
		</script>
	</body>
</html>
<%
	} else
		response.sendRedirect("fclogin.html");
%>


