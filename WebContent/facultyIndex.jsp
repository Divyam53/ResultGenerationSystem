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

<title>IIIT Kota	</title>

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

<script src="assets/js/chart-master/Chart.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
			<a href="index.html" class="logo"><img src="assets/img/logo.gif"
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
									class="badge bg-theme">4</span>
							</a> 
								<ul class="dropdown-menu extended tasks-bar">
									<div class="notify-arrow notify-arrow-green"></div>
									<li>
										<p class="green">You have 4 pending tasks</p>
									</li>
									<li><a href="index.html#">
											<div class="task-info">
												<div class="desc">DashGum Admin Panel</div>
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
									<li><a href="index.html#">
											<div class="task-info">
												<div class="desc">Database Update</div>
												<div class="percent">60%</div>
											</div>
											<div class="progress progress-striped">
												<div class="progress-bar progress-bar-warning"
													role="progressbar" aria-valuenow="60" aria-valuemin="0"
													aria-valuemax="100" style="width: 60%">
													<span class="sr-only">60% Complete (warning)</span>
												</div>
											</div>
									</a></li>
									<li><a href="index.html#">
											<div class="task-info">
												<div class="desc">Product Development</div>
												<div class="percent">80%</div>
											</div>
											<div class="progress progress-striped">
												<div class="progress-bar progress-bar-info"
													role="progressbar" aria-valuenow="80" aria-valuemin="0"
													aria-valuemax="100" style="width: 80%">
													<span class="sr-only">80% Complete</span>
												</div>
											</div>
									</a></li>
									<li><a href="index.html#">
											<div class="task-info">
												<div class="desc">Payments Sent</div>
												<div class="percent">70%</div>
											</div>
											<div class="progress progress-striped">
												<div class="progress-bar progress-bar-danger"
													role="progressbar" aria-valuenow="70" aria-valuemin="0"
													aria-valuemax="100" style="width: 70%">
													<span class="sr-only">70% Complete (Important)</span>
												</div>
											</div>
									</a></li>
									<li class="external"><a href="#">See All Tasks</a></li>
								</ul> 
								
							</li>
							<!-- +++++++++++++++++++++++++++                         +++++++++++++++++++++++++++++++++++++++++++++++ -->
							<!-- ============================This results into "MESSAGES" and onclicking it expands inbox=======================================-->
							<li id="header_inbox_bar" class="dropdown">
							<a
								data-toggle="dropdown" class="dropdown-toggle"
								href="index.html#" style="margin-top: 25%;"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-theme">5</span>
							</a>
								<ul class="dropdown-menu extended inbox">
									<div class="notify-arrow notify-arrow-green"></div>
									<li>
										<p class="green">You have 5 new messages</p>
									</li>
									<li><a href="index.html#"> <span class="photo"><img
												alt="avatar" src="assets/img/ui-zac.jpg"></span> <span
											class="subject"> <span class="from">Zac Snider</span>
												<span class="time">Just now</span>
										</span> <span class="message"> Hi mate, how is everything? </span>
									</a></li>
									<li><a href="index.html#"> <span class="photo"><img
												alt="avatar" src="assets/img/ui-divya.jpg"></span> <span
											class="subject"> <span class="from">Divya
													Manian</span> <span class="time">40 mins.</span>
										</span> <span class="message"> Hi, I need your help with this.
										</span>
									</a></li>
									<li><a href="index.html#"> <span class="photo"><img
												alt="avatar" src="assets/img/ui-danro.jpg"></span> <span
											class="subject"> <span class="from">Dan Rogers</span>
												<span class="time">2 hrs.</span>
										</span> <span class="message"> Love your new Dashboard. </span>
									</a></li>
									<li><a href="index.html#"> <span class="photo"><img
												alt="avatar" src="assets/img/ui-sherman.jpg"></span> <span
											class="subject"> <span class="from">Dj Sherman</span>
												<span class="time">4 hrs.</span>
										</span> <span class="message"> Please, answer asap. </span>
									</a></li>
									<li><a href="index.html#">See all messages</a></li>
								</ul>
								</li>
								
							<!-- ======================================                               =========================================== -->
						</ul>
					</li>
					<li><a class="logout" href="login.html">Logout</a></li>
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
						<a href="profile.html"><img src="assets/img/ui-sam.jpg"
							class="img-circle" width="60"></a>
					</p>
					<h5 class="centered"><%=facultyUser.getFacName()%></h5>

					<li class="mt"><a class="active" href="index.html"> <i
							class="fa fa-dashboard"></i> <span>Home</span>
					</a></li>

					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-desktop"></i> <span>UI Elements</span>
					</a>
						<ul class="sub">
							<li><a href="test.html">General</a></li>
							<li><a href="buttons.html">Buttons</a></li>
							<li><a href="panels.html">Panels</a></li>
						</ul></li>

					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-cogs"></i> <span>Components</span>
					</a>
						<ul class="sub">
							<li><a href="calendar.html">Calendar</a></li>
							<li><a href="gallery.html">Gallery</a></li>
							<li><a href="todo_list.html">Todo List</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-book"></i> <span>Extra Pages</span>
					</a>
						<ul class="sub">
							<li><a href="signup.html">Sign Up</a></li>
							<li><a href="login.html">Login</a></li>
							<li><a href="lock_screen.html">Lock Screen</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-tasks"></i> <span>Forms</span>
					</a>
						<ul class="sub">
							<li><a href="form_component.html">Form Components</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-th"></i> <span>Data Tables</span>
					</a>
						<ul class="sub">
							<li><a href="basic_table.html">Basic Table</a></li>
							<li><a href="responsive_table.html">Responsive Table</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class=" fa fa-bar-chart-o"></i> <span>Charts</span>
					</a>
						<ul class="sub">
							<li><a href="morris.html">Morris</a></li>
							<li><a href="chartjs.html">Chartjs</a></li>
						</ul></li>

				</ul>
				<!-- sidebar menu end-->
			</div>
		</aside>
		<!--sidebar end-->

		<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT///////////////////////////////////////////////////////////////////// -->
		<!--main content start-->
		<section id="main-content">
			<section class="wrapper">

				<div class="row">
					<div class="col-lg-9 main-chart">
kjhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn hndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchf
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchf
kjhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn hndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchf
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchfhndjncnjkndnjcndcn 
jkbshjbcjbnbckjbdbjbcjdbjkdbcjbjkdbjdbjdcbjdbckjbkjbdcjkb db cbdjkbjkdb jkbkjb bdjbdjb dhchdhmmcmhchf
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
						<h3>NOTIFICATIONS</h3>

						<!-- First Action -->
						<div class="desc">
							<div class="thumb">
								<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
							</div>
							<div class="details">
								<p>
									<muted>2 Minutes Ago</muted>
									<br /> <a href="#">James Brown</a> subscribed to your
									newsletter.<br />
								</p>
							</div>
						</div>

						<!-- Fifth Action -->
						<div class="desc">
							<div class="thumb">
								<span class="badge bg-theme"><i class="fa fa-clock-o"></i></span>
							</div>
							<div class="details">
								<p>
									<muted>18 Hours Ago</muted>
									<br /> <a href="#">Daniel Pratt</a> purchased a wallet in your
									store.<br />
								</p>
							</div>
						</div>

						<!-- USERS ONLINE SECTION -->
						<h3>TEAM MEMBERS</h3>
						<!-- First Member -->
						<div class="desc">
							<div class="thumb">
								<img class="img-circle" src="assets/img/ui-zac.jpg" width="35px"
									height="35px" align="">
							</div>
							<div class="details">
								<p>
									<a href="#">Zac Sniders</a><br />
									<muted>Available</muted>
								</p>
							</div>
						</div>
						<!-- Second Member -->
						<div class="desc">
							<div class="thumb">
								<img class="img-circle" src="assets/img/ui-sam.jpg" width="35px"
									height="35px" align="">
							</div>
							<div class="details">
								<p>
									<a href="#">Marcel Newman</a><br />
									<muted>Available</muted>
								</p>
							</div>
						</div>

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
			</section>
		</section>

		<!--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\MAIN CONTENT ENDS HERE//////////////////////////////////////////////////////////////////-->
		<!--footer start-->
		<footer class="site-footer">
			<div class="text-center">
				2014 - Alvarez.is <a href="index.html#" class="go-top"> <i
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

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var unique_id = $.gritter
									.add({
										// (string | mandatory) the heading of the notification
										title : 'Welcome to Dashgum!',
										// (string | mandatory) the text inside the notification
										text : 'Hover me to enable the Close Button. You can hide the left sidebar clicking on the button next to the logo. Free version for <a href="http://blacktie.co" target="_blank" style="color:#ffd777">BlackTie.co</a>.',
										// (string | optional) the image to display on the left
										image : 'assets/img/ui-sam.jpg',
										// (bool | optional) if you want it to fade out on its own or just sit there
										sticky : true,
										// (int | optional) the time you want it to be alive for before fading out
										time : '',
										// (string | optional) the class name you want to apply to that specific message
										class_name : 'my-sticky-class'
									});

							return false;
						});
	</script>

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