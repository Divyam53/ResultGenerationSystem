
<%	String sem=(String)request.getParameter("semester");
String coursecode=(String)request.getParameter("coursecode");
request.getSession().setAttribute("semester",sem);
request.getSession().setAttribute("coursecode",coursecode);

System.out.println("Get parameter(sem): "+sem+"   ...  Get parameter(course code): "+coursecode);


%>

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
}</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
function validate(){

    if($('#upload')[0].files.length === 0){
        alert("Attachment Required");
        $('#upload').focus();

        return false;
    }
}
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
							<!-- ++++++++++++++++++++++++This results into "PENDING TASK" and on clicking it,it expands into a list++++++++++++++  -->
							<li class="dropdown"><a data-toggle="dropdown"
								class="dropdown-toggle" href="index.html#"
								style="margin-top: 25%;"> <i class="fa fa-tasks"></i> <span
									class="badge bg-theme">2</span>
							</a> 
								<ul class="dropdown-menu extended tasks-bar">
									<div class="notify-arrow notify-arrow-green"></div>
									<li>
										<p class="green">You have 2 pending tasks</p>
									</li>
									<li><a href="index.html#">
											<div class="task-info">
												<div class="desc">2 tables to verify</div>
												<div class="percent">40%</div>
											</div>
											<div class="progress progress-striped">
												<div class="progress-bar progress-bar-success"
													role="progressbar" aria-valuenow="40" aria-valuemin="0"
													aria-valuemax="100" style="width: 40%">
													<span class="sr-only">40% Complete (success)</span>
												</div>
											</div>
									</a></li>
					
									<li class="external"><a href="#">See All Tasks</a></li>
								</ul> 
								
							</li>
								
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
						<a href="facultyIndexx.jsp"><img src="assets/img/ui-zac.jpg"
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
						<ul class="sub">
							<li><a href="#" onclick="changePassword()">Edit Details</a></li>
							<!--  <li><a href="buttons.html">Buttons</a></li>
							<li><a href="panels.html">Panels</a></li> -->
						</ul>
						
						</li>

					<li class="sub-menu"><a href="#" onclick=""> <i
							class="fa fa-cogs"></i> <span>Student</span>
							</a>
						<ul class="sub">
							<li><a href="firstSelect.jsp" >Upload File</a></li>
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
				
			</div>
		</aside>
		<!--sidebar end-->

		<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT///////////////////////////////////////////////////////////////////// -->
		<!--main content start-->
		<section id="main-content">
		
			<section class="wrapper">

				<div class="row">	<div id="loadfile">
					 <form method="post" action="uploadFile" id="upload" enctype="multipart/form-data" onsubmit="return(validate());">
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
						<th> Select file to upload:</th>
						<th> <input type="file" name="uploadFile" required/></th>
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
		response.sendRedirect("login.html");
%>


