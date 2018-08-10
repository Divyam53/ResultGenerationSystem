<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function callQuery(){
$("#loadfile").load("callQuery.jsp");

}

</script>
</head>
<body>
      		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i>Enter Student Details</h4>
                     <center> <form class="form-horizontal style-form" action="callQuery.jsp" method="post" style="width:40%;">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Student Id</label>
                              <div class="col-sm-10">
                                  <input type="text" name="id" class="form-control">
                              </div>
                          </div>
                          
                                                    <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Semester</label>
                              <div class="col-sm-10">
                                  <input type="text" name="sem" class="form-control">
                              </div>
                          </div>
                          
                      
                          
                          <center> <button type="submit" onclick="callQuery()" class="btn btn-theme">Get Result</button></center>

                      </form> </center>
                  </div>
          		</div><!-- col-lg-12--> 
</body>
</html>