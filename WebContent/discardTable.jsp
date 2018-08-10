<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<%
	
	
	//String table_name=(String)session.getAttribute("DropTableName");
	//String tablename=request.getParameter("tablename");
	//System.out.println("drop table "+droptablename);
try
		{System.out.println("IN discardTable");
	

			//These value must be taken from UI 
 			String course_id=(String)session.getAttribute("course_id");

 			/*
 			we can take name of faculty who verified table From pendingTask.jsp  to add more functionality in future
 			*/

			String table_name=(String)session.getAttribute("DropTableName");


			// ----------------------------- Connection to database ------------------------------------------- //
			Connection c = null;
			Class.forName("org.postgresql.Driver");
			c = DriverManager
					.getConnection("jdbc:postgresql://localhost:5432/mydb",
							"postgres", "postgres");
			c.setAutoCommit(true);
			// ------------------------------------------------------------------------------------------------ //

			
			
			PreparedStatement stmt3=c.prepareStatement("Drop table "+table_name);
			try{
				
				stmt3.execute();
				%>
				<script type="text/javascript">

				alert("Table discarded successfully ");
				window.location.href="operatorIndex.jsp";
				



				</script>
				<% 
			
			}catch(Exception e){
				
				%>
				<script type="text/javascript">

				alert("Error in deletion of table ");
				window.location.href="operatorIndex.jsp";
				



				</script>
				<% 
				
			}
			
			stmt3.close();
			
			PreparedStatement stmt4=c.prepareStatement("Delete from  temp_grade_tables where table_name=? ");
			stmt4.setString(1, table_name);
			//stmt4.setString(2, course_id);
			try{stmt4.execute();}catch(Exception e){
				e.printStackTrace();
				System.out.println("problem while deleting information table temp_grade_tables");}
			
			




			c.close(); // closing connection to database 
			System.out.println("Congratulations ..!!!!!");
			%>
			<script type="text/javascript">

			alert("Table has been discarded successfully ");
			window.location.href="operatorIndex.jsp";




			</script>
			
			<% 
		} 
		catch (Exception e) 
		{
			%>
			<script type="text/javascript">

			alert("Error in verification (please contact your DBA)");
			window.location.href="operatorIndex.jsp";




			</script>
			
			<% 
			
			
			e.printStackTrace();
		}
%>


</body>

</html>