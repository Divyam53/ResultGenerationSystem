<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.admin.login.FacultyParameters" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="com.admin.*" %>

<%
	String oldpass = request.getParameter("OldPassword");
	String newpass = request.getParameter("newpassword");
	String conpass = request.getParameter("conpassword");
	
	FacultyParameters facultyUser = (FacultyParameters) (session.getAttribute("currentFacultySessionUser"));
	System.out.println("Your old password is " + oldpass); 
	System.out.println("Your new password " + newpass); 
	System.out.println("Your confirmed password is "+conpass); 
	String Id = "A_ADM101";
	char[] newpass1 = new char[newpass.length()];
	for(int i=0;i<2*(newpass.length());i++){
		if(i>0&&i<newpass.length()-1)
		{newpass1[i]=newpass.charAt(i);
		newpass1[i+1]=newpass.charAt(2);
		}
	}
	char[] conpass1 = new char[conpass.length()];
	for(int i=0;i<2*(conpass.length());i++){
		if(i>0&&i<conpass.length()-1)
		{conpass1[i]=conpass.charAt(i);
		conpass1[i+1]=conpass.charAt(2);
		}
	}
	String FacId=facultyUser.getFacId();
	System.out.println(FacId);
	System.out.println("Fac Id is "+Id);
	int id = 0;
	Connection con = null;
	Statement st = null;
	String pass = "";
	try {
		Class.forName("org.postgresql.Driver");
		con =  DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres","postgres");
		st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM faculty WHERE fac_id = '"+FacId+"'");
		if (rs.next()) { 
			pass = rs.getString("fac_pwd");
			System.out.println(pass);
		} 
		System.out.println("database password "+pass);
		System.out.println(pass.equals(oldpass));
		System.out.println(newpass.equals(conpass));
		if (pass.equals(oldpass)){
			if(newpass1.equals(conpass1))
		// {
				st = con.createStatement();
				int i = st.executeUpdate("UPDATE faculty SET fac_pwd='"+ newpass1 +"' WHERE fac_id='" + facultyUser.getFacId() + "' ");
%>
	<head>
		<%
			String NewFacId=FacId.substring(0,1);
			switch(NewFacId){
				case "A":
		%>
			<script type="text/javascript">
				alert("Password changed successfully!!");
				window.location.href = "adminIndex.jsp";
			</script>
		<% 
				break;
			case "T":
		%>
			<script type="text/javascript">
				alert("Password changed successfully!!");
				window.location.href = "facultyIndexx.jsp";
			</script>
		<%
				break;
			case "M":
		%>
			<script type="text/javascript">
				alert("Password changed successfully!!");
				window.location.href = "operatorIndex.jsp";
			</script>
		<%
				 break;		
			}
		%>
		<% 
			st.close();
			con.close();
			} else {
				String NewFacId=FacId.substring(0,1);
				switch(NewFacId){
					case "A":
		%>
			<script type="text/javascript">
				alert("Old Password doesn't match");
				window.location.href = "adminIndex.jsp";
			</script>
		<% 
			break;
			case "T":
		%>
			<script type="text/javascript">
				alert("Old Password doesn't match");
				window.location.href = "facultyIndexx.jsp";
			</script>
		<%
			break;
			case "M":
		%>
			<script type="text/javascript">
				alert("Old Password doesn't match");
				window.location.href = "operatorIndex.jsp";
			</script>
		<%
			 break;						
			}
			}
			/*}else{
				out.println("new password and confirm new password is not matching");
			}*/
			//}	
			}catch (Exception e) {
				out.println(e);
				System.out.println("2154");
			}		
		%>
	</head>
	<body>
	</body>
</html>