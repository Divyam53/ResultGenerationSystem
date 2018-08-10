<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
	String coursetitle = request.getParameter("course_title");
	String  coursecode= request.getParameter("course_code");
	coursecode=coursecode.toLowerCase();
	String program = request.getParameter("program");
	//program=program.substring(0,2).toUpperCase()+program.substring(2,program.length()).toLowerCase();
	String semester = request.getParameter("semester");
	int sem = Integer.parseInt(semester);
	String credits = request.getParameter("credits");
	int credit=Integer.parseInt(credits);
	String branch = request.getParameter("branch");
	branch=branch.toUpperCase();
	Connection con = null;
	Statement st = null;
	try {
		Class.forName("org.postgresql.Driver");
		con =  DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres","postgres");
		st = con.createStatement();
		st.executeUpdate("INSERT INTO courseinfo VALUES('"+coursecode+"','"+coursetitle+"','"+program+"',"+sem+","+credit+",'"+branch+"')  ");%>
<script type="text/javascript">
alert("registered");
window.location.href = "adminIndex.jsp";
</script><%
		
	}
		 catch (Exception e) {
			 %>
				<script>alert("operator not registered");
				<jsp:forward page = "adminIndex.jsp" /></script><%
			out.println(e);
			System.out.println("EXCEPTION OCCURRED");
			}
%>