    <%@page import="java.io.*"%>
    <%@page import="java.util.*" %>
<%@page import ="java.util.Iterator" %>
<%@page import="org.apache.poi.ss.usermodel.*" %>
<%@page import="org.apache.poi.xssf.usermodel.*" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.admin.login.FacultyParameters"%>
<%
	
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if (session.getAttribute("currentFacultySessionUser") != null) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>IIITKota - Faculty	</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="assets/js/chart-master/Chart.js"></script>
<script>



function callservlet() {

    var servletname=document.getdata.fetchdata.value;

    if(servletname== "")
        {
        alert("NO value..");
        return false;
        }
    else
        {
        alert("value"+servletname);
            document.forms[0].action = "facultylogout"
            document.forms[0].submit();
        }
}
</script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="http://jzaefferer.github.com/jquery-validation/jquery.validate.js"></script>
    <script>
        $(document).ready(function(){
            $("#choice").validate();
        });
    </script>
</head>

<body>

	<section id="container">
		<!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
		<!--header start-->


		<header class="header black-bg">

			<div class="sidebar-toggle-box">
				<div class="fa fa-bars tooltips" data-placement="right"
					data-original-title="Toggle Navigation"></div>
			</div>
			<!--logo start-->
			<a href="facultyIndexx.jsp" class="logo"><img src="assets/img/logo.gif"
				style="width: 8%; height: 8%;" /><b> Indian Institute Of
					Information Technology, Kota</b></a>
			<!--logo end-->

			<div class="nav notify-row" id="top_menu">
				<!--  notification start -->
				<ul class="nav top-menu">

				</ul>
				<!--  notification end -->
			</div>
			<div class="top-menu">
				<!-- starting of the right part of header -->
				<ul class="nav pull-right top-menu">
					<li><ul class="nav top-menu" style="margin-right: 40%;">
	
								
							<!-- ======================================                               =========================================== -->
						</ul>
					</li>
					<li><a class="logout" name="fetchdata"  href="<%=request.getContextPath()%>/facultylogout">	Logout</a></li>
				</ul>
				<!-- ending of the right part of header -->
			</div>
		</header>
		<!--header end-->

		<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      
			<%
				FacultyParameters facultyUser = (FacultyParameters) (session.getAttribute("currentFacultySessionUser"));
			%>
		<!--sidebar start-->
		<aside>
			<div id="sidebar" class="nav-collapse ">
				<!-- sidebar menu start-->
				<ul class="sidebar-menu" id="nav-accordion">

					<p class="centered">
						<a href="profile.html"><img src="<%=facultyUser.getFileName()%>"
							class="img-circle" width="60"></a>
					</p>
					<h5 class="centered"><%=facultyUser.getFacName()%></h5>

					<li class="mt"><a class="active" href="facultyIndexx.jsp"> <i
							class="fa fa-dashboard"></i> <span>Home</span>
					</a></li>
					<li class="sub-menu"><a name="fetchdata"  href="<%=request.getContextPath()%>/facultylogout"> <i
							class=" fa fa-bar-chart-o"></i> <span >Logout</span>
					</a></li>

				</ul>
			
			</div>
		</aside>
		<!--sidebar end-->

		<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT///////////////////////////////////////////////////////////////////// -->
		<!--main content start-->
		<section id="main-content">
		
			<section class="wrapper">

				<div class="row">	<div id="loadfile">

					<!-- *************************88RIGHT SIDEBAR content ends here**************************************** -->
					<div style="text-align: center;">

					
					</div>			
	 <form method="post"   action="facultyOptions.jsp" id="choice">
		<h1>Upload Grade</h1>

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
						<th>Select Semester:</th>
						<th><select name="semester" required>
						
								<option value="">Select</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
						</select></th>
					</tr>

					<tr>
						<th>Enter course code:</th>
						<th><select name="coursecode" required>
						<option value="">Select course</option>
								<%			
											response.setHeader("Cache-Control", "no-store,must-revalidate");
											response.setHeader("Pragma", "no-cache");
											response.setDateHeader("Expires", -1);
											new java.util.Date();
											String facid = null;
											if (session.getAttribute("currentFacultySessionUser") != null) {

												facultyUser = (FacultyParameters) (session.getAttribute("currentFacultySessionUser"));
												facid = facultyUser.getFacId();
											}
											Connection con = null;
											Statement st = null;
											try {
												Class.forName("org.postgresql.Driver");
												con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres", "postgres");
												st = con.createStatement();
												ResultSet rs = st.executeQuery("SELECT * FROM facultycourseinfo WHERE fac_id = '" + facid + "'");
												while (rs.next()) {
													String coursecod = rs.getString("course_code");
										%>
								<option id="<%out.print(coursecod);%>">
									<%out.print(coursecod);%>
								</option>
								<%
											}
											} catch (Exception e) {
												out.println(e);
												System.out.println("2154");
											}
										%>
						</select></th>
					</tr>
					
					<tr>
											<%
	String lastPage=(String)request.getSession().getAttribute("from-uploadFile");
	if(lastPage.equals("true")){
		%>
		<script type="text/javascript">
		alert("Grades for this course have already been uploaded");</script>
		
		<h4 style="color:red;">Choose another file</h4>
		<% 
	
	}
	
	%>
					
					
					</tr>
					
</tbody>
					</table>
				</center>
				<center>
			
						
					<input type="submit" value="Next"  href="facultyOptions.jsp"/>	
					 
					</th>
				
					
				</center>
			</div>
			<! --/content-panel -->
		</div>
		<!-- /col-md-12 -->

	</form>
	

					
				</div>
				<! --/row -->
			</section></div>
		</section>

		<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT ENDS HERE//////////////////////////////////////////////////////////////////-->
		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				


Copyright 2016 - IIIT Kota - All rights reserved
 <a href="#" class="go-top"> <i
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



