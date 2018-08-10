<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script>
function verifyTable(){
	$("#loadfile").load("verifyTable.jsp");
}
function goBack(){
	$("#loadfile").load("pendingTask.jsp");
}
function discardTable(){
	$("#loadfile").load("discardTable.jsp");
}

function callservlet() {
	  //do your processing.
	  document.getElementsByName('getdata')[0].submit();
	}
</script>
</head>
<body>        	<h3><i class="fa fa-angle-right"></i> Verify Table</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i>Grade Info</h4>
                          <section id="unseen">
                           <center> <table  style="width:40%;" class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr><th>	</th>>
                                  <th>Student Id</th>
                                  <th>Grade</th>
                              </tr>
                              </thead>
                              <tbody>
                              <%
	Connection con = null;
    Statement st = null;
	String pass = "";
	String tablename=(String)session.getAttribute("tableName");
	//String tablename=request.getParameter("tablename");
	System.out.println("SUTD1:  "+tablename);
	request.getSession().setAttribute("DropTableName",tablename);
	System.out.println("SUTD2:  "+	(String)request.getSession().getAttribute("DropTableName"));
	
	try {
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres", "postgres");
		st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM " +tablename+ "");int i=1;
		while(rs.next()) {
		String st_id = rs.getString("st_id");
		String gradepoint=rs.getString("grade");
		
		%>
                              <tr><td><%out.print(i); %></td>
                                 <td><%out.print(st_id); %></td>
								 <td><%out.print(gradepoint); %></td>
                              </tr><% i++;%>
                              </tbody>
        <%	}
			st.close();
			con.close();

	} catch (Exception e) {
		out.println(e);
		System.out.println("Error");
	}
%>
                          </table></center>
                          <center> <button type="submit" class="btn btn-theme"  name="fetchdata" onclick="verifyTable();">Verify</button>
                        
                         <a href="#" onclick="discardTable()" class="btn btn-theme">Discard</a> </center> 
                          <a href="#" onclick="goBack()" class="btn btn-theme"> Back</a> </center> 
                          </section>
                  </div><!-- /content-panel -->
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
			
</body>
</html>