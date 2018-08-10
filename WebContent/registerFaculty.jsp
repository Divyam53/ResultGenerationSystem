<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
      		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i>Register New Faculty</h4>
                    <center>  <form class="form-horizontal style-form" action="operatorRegistration.jsp" method="post" style="width:40%;">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Name</label>
                              <div class="col-sm-10">
                                  <input type="text" name="name" class="form-control">
                              </div>
                          </div>
                          
                                                    <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Email</label>
                              <div class="col-sm-10">
                                  <input type="text" name="email" class="form-control">
                              </div>
                          </div>
                          
                                                    <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Username</label>
                              <div class="col-sm-10">
                                  <input type="text" name="uname" class="form-control">
                              </div>
                          </div>
                          
                                                    <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Password</label>
                              <div class="col-sm-10">
                                  <input type="password" name="pwd" class="form-control">
                              </div>
                          </div>
                          
                          
                                                    <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Contact</label>
                              <div class="col-sm-10">
                                  <input type="text" name="contact" class="form-control">
                              </div>
                          </div>
                          
                          <center> <button type="submit" class="btn btn-theme">Register</button></center>

                      </form> </center>
                  </div> 
          		</div><!-- col-lg-12--> 
</body>
</html>