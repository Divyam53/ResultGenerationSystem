
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.*"%>
<%
	Connection con = null;
	Statement st = null;
	String pass = "";
	try {
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres", "postgres");
		st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM temp_grade_tables");
		int i = 1;
%>

<!DOCTYPE html>
<html>
<head>
<script>
	function loadTable() {
		$("#loadfile").load("showUncheckedTableDetails.jsp");
	}

	function callservlet() {

		var servletname = document.getdata.fetchdata.value;

		if (servletname == "") {
			alert("NO value..");
			return false;
		} else {
			alert("value" + servletname);
			document.forms[0].action = "verify"
			document.forms[0].submit();
		}
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row mt">
		<div class="col-md-12">
			<div class="content-panel">
				<table class="table table-striped table-advance table-hover">
					<h4>
						<i class="fa fa-angle-right"></i> Advanced Table
					</h4>
					<hr>
					<thead>

						<tr>
							<th><i class=" fa fa-edit"></i>S. No</th>
							<th><i class="fa fa-bullhorn"></i> Table Name</th>
							<th class="hidden-phone"><i class="fa fa-question-circle"></i>
								Author Name</th>
							<th><i class="fa fa-bookmark"></i> Course Id</th>
							<th><i class=" fa fa-edit"></i>Semester</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
								while (rs.next()) {
										String tablename = rs.getString("table_name");
										String name = rs.getString("author");
										String courseid = rs.getString("course_id").toUpperCase();
										String sem = rs.getString("semester");
										//session.setAttribute("course_id",courseid);
							%>

							<td>
								<%
									out.print(i);
								%>
							</td>
							<td><a href="#" onClick="loadTable()"> <%out.print(tablename); %>
							</a> <%request.getSession().setAttribute("tableName", tablename);%></td>
							<td>
								<%
									out.print(name);
								request.getSession().setAttribute("author_name", name);
								%>
							</td>
							<td>
								<%
									out.print(courseid);
								request.getSession().setAttribute("course_id", courseid);
								%>
							</td>
							<td>
								<%
									out.print(sem);
								request.getSession().setAttribute("semester", sem);
								%>
							</td>
						<!-- <td><a name="fetchdata"
							//	href="<%//	request.getContextPath()%>/verify"> <%
 	//session.setAttribute("course_id", courseid);
 %>
									<button class="btn btn-success btn-xs">
										<i class="fa fa-check"></i>
									</button>
							</a>
								<button class="btn btn-danger btn-xs">
									<i class="fa fa-trash-o "></i>
								</button></td>  -->	
						</tr>

						<%
							i++;
								}
								st.close();
								con.close();

							} catch (Exception e) {
								out.println(e);
								System.out.println("2154");
							}
						%>





					</tbody>
				</table>
			</div>
			<! --/content-panel -->
		</div>
</body>
</html>