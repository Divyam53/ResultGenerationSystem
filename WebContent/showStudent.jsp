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
			function callservlet() {
				  //do your processing.
				  document.getElementsByName('getdata')[0].submit();
			}
		</script>
	</head>
	<body>
		<h3><i class="fa fa-angle-right"></i> 2013 Batch</h3>
		<div class="row mt">
			<div class="col-lg-12">
				<div class="content-panel">
					<h4><i class="fa fa-angle-right"></i>CSE Students</h4>
					<section id="unseen">
						<center>
							<table style="width: 80%;" class="table table-bordered table-striped table-condensed">
								<thead>
									<tr><th></th>
										<th>Student Id</th>
										<th>Student Name</th>
										<th>Email</th>
										<th>Year Admitted</th>
										<th>Program</th>
										<th>Dob</th>
										<th>Father's Name</th>
										<th>Mother's Name</th>
										<th>Mobile No</th>
									</tr>
								</thead>
								<tbody>
									<%
										Connection con = null;
										Statement st = null;
										String tablename="student2013";
										try {
											Class.forName("org.postgresql.Driver");
											con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres",
												"postgres", "Dj284204");
											st = con.createStatement();
											ResultSet rs = st.executeQuery("SELECT * FROM " +tablename+ "");
											int i=1;
											while(rs.next()) {
												String id = rs.getString("st_id");
												String name = rs.getString("st_name");
												String email=rs.getString("email");
												String year=rs.getString("year_admitted");
												String program	=rs.getString("program");
												String dob=rs.getString("dob");
												String fname=rs.getString("fname");
												String mname=rs.getString("mname");
												String mobile=rs.getString("mobile_no");
									%>
									<tr>
										<td><%out.print(i); %></td>
										<td><%out.print(id); %></td>
										<td><%out.print(name); %></td>
										<td><% 
												if(email==null)
													out.print("NA");
												else
													out.print(email);
											%>
										</td>
										<td><%out.print(year); %></td>
										<td><%out.print(program); %></td>
										<td><% 
												if(dob==null)
													out.print("NA");
												else
													out.print(dob); 
											%>
										</td>
										<td>
											<% 
												if(fname==null)
													out.print("NA");
												else
													out.print(fname); 
											%>
										</td>
										<td>
											<% 
												if(mname==null)
													out.print("NA");
												else
													out.print(mname); 
											%>
										</td>
										<td>
											<% 
												if(mobile==null)
													out.print("NA");
												else
													out.print(mobile); %>
										</td>
									</tr>
									<% i++;%>
								</tbody>
								<%			}
										st.close();
										con.close();
										} catch (Exception e) {
												out.println(e);
												System.out.println("Error");
										}
								%>
							</table>
						</center>
						<center><a href="adminIndex.jsp" class="btn btn-theme">Go Back</a></center>
					</section>
				</div>
				<!-- /content-panel -->
			</div>
			<!-- /col-lg-4 -->
		</div>
		<!-- /row -->
	</body>
</html>