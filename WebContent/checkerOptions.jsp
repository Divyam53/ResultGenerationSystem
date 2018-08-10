
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<script>
function loadTable(){
	$("#options").load("showUncheckedTableDetails.jsp");
}
</script>
<style>
table {
	border-collapse: collapse;
	width: 80%;
}

td, tr {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
th{
padding: 8px;
	text-align: center;
	border-bottom: 3px solid #ddd;
}

td:hover {
	background-color: #f5f5f5
}
</style>
</head>
<body>
	<center>
		<h1>UNCHECKED TABLES</h1>
	</center>

	<table border="solid" bordercolor="" align="center">
		<tr>			<th>TABLE NAME</th>
			<th>AUTHOR</th>
			<th>NAME</th>
			<th></th>
		</tr>
<%
	Connection con = null;
    Statement st = null;
	String pass = "";
	try {
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres", "postgres");
		st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM temp_grade_tables");
		while(rs.next()) {
		String table = rs.getString("table_name");
		String author=rs.getString("author");
		String courseid=rs.getString("course_id");
		session.setAttribute("course_id",courseid);
		%>
			<td><%out.print(table); %></td>
			<td><%out.print(author); %></td>
			<td><%out.print(courseid); %></td>
			<td><button class="button" id="buttonid" onClick="loadTable()">verify</button></td><%session.setAttribute("tableName",table); %>
		</tr>
	<%	}
			st.close();
			con.close();

	} catch (Exception e) {
		out.println(e);
		System.out.println("2154");
	}
%>
	</table>
</body>
</html>