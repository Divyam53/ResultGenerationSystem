<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.admin.login.FacultyParameters"%>
<%
	response.setHeader("Cache-Control", "no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", -1);
	new java.util.Date();
	if (session.getAttribute("currentFacultySessionUser") != null) {
%>
      
			<%

FacultyParameters facultyUser = (FacultyParameters) (session.getAttribute("currentFacultySessionUser"));
			
			request.getSession().setAttribute("fac_name",facultyUser.getFacName());
			%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Personal Details</title>
</head>
<body>

         	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Edit Details</h4>
                      <form class="form-horizontal style-form" method="get">
                                               <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Faculty ID</label>
                              <div class="col-sm-10">
                                  <input class="form-control" id="disabledInput" type="text" placeholder="<%=facultyUser.getFacId()%>" disabled>
                              </div>
                          </div>
                          
                                              <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Faculty Name</label>
                              <div class="col-sm-10">
                                  <input class="form-control" id="focusedInput" type="text" value="<%=facultyUser.getFacName()%>">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Mobile</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control">
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Email</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control">
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">About</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control">
                                  <span class="help-block">Add some info about yourself.</span>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Password</label>
                              <div class="col-sm-10">
                                  <input type="password"  class="form-control" placeholder="">
                              </div>
                          </div>
                          <!--  div class="form-group">
                              <label class="col-lg-2 col-sm-2 control-label">Email</label>
                              <div class="col-lg-10">
                                  <p class="form-control-static">email@example.com</p>
                              </div>
                          </div>-->
                          <center><button>Submit</button></center>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->

</body>
</html><%
	} else
		response.sendRedirect("fclogin.html");
%>