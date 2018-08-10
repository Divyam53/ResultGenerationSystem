
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.*"%>
<%
	Connection con = null;
    Statement st = null;
	String pass = "";
	try {
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "Dj284204");
		st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM courseinfo");
		int i=1;%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	                  <div class="col-md-12 mt">
	                  	<div class="content-panel">
	                          <table class="table table-hover">
	                  	  	  <h4><i class="fa fa-angle-right"></i>Available Courses</h4>
	                  	  	  <hr>
	                              <thead>
	                              <tr>
	                                  <th>S No</th>
	                                  <th>Course Code</th>
	                                  <th>Course Title</th>
	                                  <th>Program</th>
	                                  <th>Semester</th>
	                                  <th>Credits</th>
	                                  <th>Branch</th>
	                              </tr>
	                              </thead>
	                              <tbody>    <tr>
	                       <%       while(rs.next()) {
		String code = rs.getString("course_code");
		String title=rs.getString("course_title");
		String program=rs.getString("program");
		String sem=rs.getString("semester");
		String credit=rs.getString("credits");
		String branch=rs.getString("branch");
		//session.setAttribute("course_id",courseid);
		
		%>
	                          
	                                  <td><%out.print(i); %>	</td>
	                                  <td><%out.print(code); %></td>
	                                  <td><%out.print(title); %></td>
	                                  <td><%out.print(program); %></td>
	                                  <td><%out.print(sem); %></td>
	                                  <td><%out.print(credit); %></td>
	                                  <td><%out.print(branch); %></td>
	                              </tr>

<%i++;	}
			st.close();
			con.close();

	} catch (Exception e) {
		out.println(e);
		System.out.println("2154");
	}
%>

	                              </tbody>
	                          </table>
	                  	  </div><! --/content-panel -->
	                  </div>
</body>
</html>