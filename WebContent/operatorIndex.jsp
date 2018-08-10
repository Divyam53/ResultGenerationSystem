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

<title>IIITKota- Operator	</title>

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
<a href="operatorIndex.jsp" class="logo"><img src="assets/img/logo.gif"
	style="width: 8%; height: 8%;" /><b> Indian Institute Of
Information Technology, Kota</b></a>
<!--logo end-->

<div class="nav notify-row" id="top_menu">
	<!--  notification start -->
<ul class="nav top-menu">&nbsp

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
&nbsp
&nbsp
&nbsp
&nbsp
&nbsp
&nbsp
&nbsp
&nbsp
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
		<a href="operatorIndex.jsp"><img src="assets/img/ui-zac.jpg"
			class="img-circle" width="60"></a>
	</p>
	<h5 class="centered"><%=facultyUser.getFacName()%></h5>

<li class="mt"><a class="active" href="operatorIndex.jsp"> <i
		class="fa fa-dashboard"></i> <span>Home</span>
</a></li>

<li class="sub-menu"><a href="javascript:;"> <i
		class="fa fa-desktop"></i> <span>Edit Info</span>
</a>
	<ul class="sub">
		<li><a href="#" onclick="changePassword()">Change Password</a></li>
<!--  <li><a href="buttons.html">Buttons</a></li>
<li><a href="panels.html">Panels</a></li> -->

	</ul>
	
	</li>

<li class="sub-menu"><a href="#" onclick=""> <i
	class="fa fa-cogs"></i> <span>Student</span>
	</a>
<ul class="sub">
	<li><a href="#" onclick="printResult()">Print Result</a></li>
<!--  <li><a href="buttons.html">Buttons</a></li>
<li><a href="panels.html">Panels</a></li> -->
	</ul>

	
	</li>
<li class="sub-menu"><a href="#" onclick="showTask()"> <i
		class="fa fa-book"></i> <span>Pending Tasks</span>
<li class="sub-menu"><a name="fetchdata"  href="<%=request.getContextPath()%>/facultylogout"> <i
			class=" fa fa-bar-chart-o"></i> <span >Logout</span>
	</a></li>

</ul>
<!-- sidebar menu end-->
	</div>
</aside>
<!--sidebar end-->

<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT///////////////////////////////////////////////////////////////////// -->
<!--main content start-->
<section id="main-content">

	<section class="wrapper">

		<div class="row">	<div id="loadfile">
			<div class="col-lg-9 main-chart" id="col-lg-9 main-chart">
		<div id="first">
			<table class="profile" "border="1" style="width: 80%;">
<tr>
	<td width="70%" style="font-size: 150%;">Name: <%=facultyUser.getFacName()%>

<div align="left" style="">
ID:
<%=facultyUser.getFacId()%></div>

<div align="left" style="">
					Contact<br>
Email:
<%=facultyUser.getFacEmail()%></div>

<div align="left" style=""></td>

<td width="30%">
	<div style="">
					<img border="0" src="assets/img/ui-zac.jpg" height="120" width="160" />
				</div>
			</td>

		</tr>
	</table>
</div>

		<div class="row mtbox"></div>
		<!-- /row mt -->



<div class="row mt">
	<!-- SERVER STATUS PANELS -->






</div>
<!-- /row -->


<div class="row">
	<!-- TWITTER PANEL -->


</div>
<!-- /row -->

<div class="row mt"></div>
<!-- /row -->

</div>
<!-- /col-lg-9 END SECTION MIDDLE -->


<!-- *******************************RIGHT SIDEBAR CONTENT***************** -->

<div class="col-lg-3 ds">
	<!--COMPLETED ACTIONS DONUTS CHART-->


<!-- CALENDAR-->
<div id="calendar" class="mb">
	<div class="panel green-panel no-margin">
		<div class="panel-body">
			<div id="date-popover" class="popover top"
				style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
<div class="arrow"></div>
<h3 class="popover-title" style="disadding: none;"></h3>
				<div id="date-popover-content" class="popover-content"></div>
			</div>
			<div id="my-calendar"></div>
		</div>
	</div>
</div>
<!-- / calendar -->

</div>
<!-- /col-lg-3 -->
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
 <a href="#" class="go-top"> <i
					class="fa fa-angle-up"></i>
				</a>
			</div>
		</footer>
		<!--footer end-->
</section>

<!-- js placed at the end of the document so the pages load faster -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="assets/js/chart-master/Chart.js"></script>
<script>


function showTask(){	
	$("#loadfile").load("pendingTask.jsp");
}
function printResult(){
	$("#loadfile").load("printResultPdf.jsp");
}
function changePassword(){	
	$("#loadfile").load("changeAdminPassword.jsp");
}
function callservlet() {
    var servletname=document.getdata.fetchdata.value;

    if(servletname== ""){
        alert("NO value..");
        return false;
        }
    else{
        alert("value"+servletname);
            document.forms[0].action = "facultylogout"
            document.forms[0].submit();
        }
}
</script>
	
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