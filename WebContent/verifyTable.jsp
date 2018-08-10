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
			try{
			//These value must be taken from UI 
				String course_id=(String)session.getAttribute("course_id");//"mat102";
				System.out.println("3: "+course_id);
				String table_name=(String)session.getAttribute("DropTableName");//"tempsem4mat102";
				System.out.println("1: "+table_name);
				System.out.println("2: "+(String)session.getAttribute("tableName"));
				// ----------------------------- Connection to database ----------------------------------------- //
				Connection c = null;
				Class.forName("org.postgresql.Driver");
				c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb","postgres", "postgres");
				c.setAutoCommit(true);
				// ------------------------------------------------------------------------------------------------ //
				PreparedStatement stmt= c.prepareStatement("Select * from "+table_name);
				ResultSet  rs= stmt.executeQuery();
				while(rs.next()){
					String ID=rs.getString(1);
					String year=ID.substring(0, 4);
					String sem=session.getAttribute("semester").toString();
					PreparedStatement stmt1=c.prepareStatement("select st_id from kucp"+year+";");
					ResultSet rs1=stmt1.executeQuery();
					while(rs1.next()){
						if(rs1.getString(1).equalsIgnoreCase(ID)){
							String grade=rs.getString(2);
							PreparedStatement stmt2=c.prepareStatement("Update kucp"+year+" set "+course_id+"=(?) where st_id=?");
							PreparedStatement stmt3=c.prepareStatement("INSERT INTO failtable VALUES('" + ID + "','" 
								+ course_id + "'," + sem + ")");
							stmt2.setString(1, grade);
							stmt2.setString(2, ID);
							try{
								stmt2.executeUpdate();
							}catch(Exception e){
								System.out.println(stmt2);
							}
						}
					}
				}
				stmt.close();				
				PreparedStatement stmt3=c.prepareStatement("Drop table "+table_name);
				try{
					stmt3.execute();
				}catch(Exception e){
					System.out.println("problem while deleting table");
				}
				stmt3.close();
				PreparedStatement stmt4=c.prepareStatement("Delete from  temp_grade_tables where table_name=?");
				stmt4.setString(1, table_name);
				try{
					stmt4.execute();					
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("problem while deleting information table temp_grade_tables");
				}
					c.close(); // closing connection to database 
		%>
		<script type="text/javascript">
			alert("Table has been verified successfully ");
			window.location.href="operatorIndex.jsp";
		</script>	
		<% 
			}catch (Exception e){
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