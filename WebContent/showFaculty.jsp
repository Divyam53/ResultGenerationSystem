
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
		ResultSet rs = st.executeQuery("SELECT * FROM faculty where fac_id LIKE 'T_%' ");
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
	                  	  	  <h4><i class="fa fa-angle-right"></i> IIITK's Faculty</h4>
	                  	  	  <hr>
	                              <thead>
	                              <tr>
	                                  <th>#</th>
	                                  <th>Id</th>
	                                  <th>Name</th>
	                                  <th>Contact No</th>
	                                  <th>Email</th>
	                                  <th></th>
	                                  
	                              </tr>
	                              </thead>
	                              <tbody>    <tr>
	                       <%       while(rs.next()) {
		String id = rs.getString("fac_id");
		String name=rs.getString("fac_name");
		String mobile=rs.getString("fac_mobile");
		String email=rs.getString("fac_email");
		//session.setAttribute("course_id",courseid);
		
		%>
	                          
	                                  <td><%out.print(i); %>	</td>
	                                  <td><%out.print(id); %></td>
	                                  <td><%out.print(name); %></td>
	                                  <td><%out.print(mobile); %></td>
	                                  <td><%out.print(email); %></td>
	 <td><a href=DeleteRow?id=<%=rs.getString("fac_id")%> onclick="return del()"><button class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></button></a></td>
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
	                  <script type="text/javascript">
function del() {
    var abc=confirm("Confirm for deleting Faculty");
    return abc;
}
</script>
</body>
</html>