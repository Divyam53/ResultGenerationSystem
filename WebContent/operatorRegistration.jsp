<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
	<head>
		<%
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("pwd");
			String contact = request.getParameter("contact");
			String user = request.getParameter("uname");
			user=user.toUpperCase();
			Connection con = null;
			Statement st = null;
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres", "postgres");
				st = con.createStatement();
				st.executeUpdate("INSERT INTO faculty VALUES('" + user + "','" + name + "','" + contact + "','" + email
						+ "','" + password + "') ");
			%>
			<script type="text/javascript">
				alert("Registered successfully!!");
				window.location.href = "adminIndex.jsp";
			</script>
				<%
				} catch (Exception e) {
					out.println(e);
				%>
			<script type="text/javascript">
				alert("Invalid Input please Try Again");
				window.location.href = "adminIndex.jsp";
			</script>
			<%
				}
		%>
	</head>
</html>