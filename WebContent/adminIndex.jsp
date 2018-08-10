<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.admin.login.FacultyParameters"%>
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
<meta name="keyword"
	content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

<title>IIITKota - Admin	</title>

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
						<a href="adminIndex.jsp"><img src="assets/img/ui-zac.jpg"
							class="img-circle" width="60"></a>
					</p>
					<h5 class="centered"><%=facultyUser.getFacName()%></h5>

					<li class="mt"><a class="active" href="adminIndex.jsp"> <i class="fa fa-dashboard"></i> <span>Home</span></a></li>

					<li class="sub-menu"><a href="javascript:;"> <i	class="fa fa-desktop"></i> <span>Edit Info</span></a>
						<ul class="sub">
							<li><a href="#" onclick="changePassword()">Change Password</a></li>
						</ul></li>

					<li class="sub-menu"><a href="javascript:;"> <i class="fa fa-cogs"></i> <span>Manage Data Operators</span></a>
						<ul class="sub">
							<li><a href="#" onClick="showOperator()" >Show All</a></li>
							<li><a href="#" onClick="addopr()">Register New</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i class="fa fa-book"></i> <span>Manage Students</span></a>
						<ul class="sub">
							<li><a href="#" onclick="loadFirstBatch() ">2013 Batch</a></li>
							<li><a href="#" onclick="loadSecondBatch()">2014 Batch</a></li>
							<li><a href="#" onclick="loadThirdBatch()">2015 Batch</a></li>
							<li><a href="#" onclick="addNewBatch()">Add Batch</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i class="fa fa-tasks"></i> <span>Manage Faculty</span></a>
						<ul class="sub">
							<li><a href="#" onclick="showFaculty()">Show All</a></li>
							<li><a href="#" onclick="registerFaculty()">Register New</a></li>
							<li><a href="#" onclick="assignCourse()">Assign Course</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i class="fa fa-th"></i> <span>Courses</span></a>
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

		<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT///////////////////////////////////////////////////////////////////// -->
		<!--main content start-->
		<section id="main-content">
		
			<section class="wrapper">

				<div class="row">	<div id="loadfile" >
					<div class="col-lg-9 main-chart" >
				<div id="first">
					<table class="profile" "border="1" style="width: 80%;">
						<tr>
							<td width="70%" style="font-size: 150%;">Name: <%=facultyUser.getFacName()%>

								<div align="left" style="">
									ID:
									<%=facultyUser.getFacId()%></div>

								<div align="left" style="">
														Contact:<br>
									Email:
									<%=facultyUser.getFacEmail()%></div>

								<div align="left" style=""></td>

							<td width="30%">
								<div style="">
									<img href="#" border="0" src="assets/img/ui-zac.jpg" height="120" width="160" />
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
					<!-- /col-lg-9 END SECTION MIDDLE -->


					<!-- *******************************RIGHT SIDEBAR CONTENT***************** -->

					<div class="col-lg-3 ds">
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
<jsp:include page="footer.jsp" />

	</section>

	<!-- js placed at the end of the document so the pages load faster -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="assets/js/chart-master/Chart.js"></script>
<script>

function changePassword(){
	$("#loadfile").load("changeAdminPassword.jsp");
}
function showOperator(){
	$("#loadfile").load("showOperator.jsp");
}
function addopr(){
	$("#loadfile").load("addOperator.jsp");	
}
function loadFirstBatch(){
	$("#loadfile").load("showStudent.jsp");
}
function loadSecondBatch(){
	$("#loadfile").load("showStudent1.jsp");	
}
function loadThirdBatch(){	
	$("#loadfile").load("showStudent2.jsp");
}
function addNewBatch(){
	$("#loadfile").load("addBatch.jsp");
}
function showFaculty(){
	$("#loadfile").load("showFaculty.jsp");
}
function registerFaculty(){
	$("#loadfile").load("registerFaculty.jsp");
}
function assignCourse(){
	$("#loadfile").load("assignCourse.jsp");
}
function showCourse(){
	$("#loadfile").load("showCourse.jsp");
}
function addCourse(){
	$("#loadfile").load("addCourse.jsp");
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
		response.sendRedirect("login.html");
%>