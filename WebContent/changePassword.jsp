
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.student.login.UserBean" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.io.*"%>
<%
	String oldpass = request.getParameter("OldPassword");
	String newpass = request.getParameter("newpassword");
	String conpass = request.getParameter("conpassword");
	UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
	System.out.println("Your old password is " + oldpass);
	System.out.println("Your new password " + newpass);
	System.out.println("Your confirmed password is " + conpass);
	String Id = currentUser.getId();
	System.out.println("Id is " + Id);
	int id = 0;
	Connection con = null;

	Statement st = null;
	String pass = "";
	try {
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres", "postgres");
		st = con.createStatement();
		String tablename = "student" + Id.substring(0, 4);
		ResultSet rs = st.executeQuery("SELECT * FROM " + tablename + " WHERE st_id = '" + Id + "'");
		if (rs.next()) {
			pass = rs.getString("password");
			System.out.println(pass);
		}
		if (newpass.equals(conpass)) {
			//if (pass.equals(oldpass)) {
			st = con.createStatement();
			int i = st.executeUpdate(
					"UPDATE student2014 SET password='" + newpass + "' WHERE st_id='" + Id + "' ");
			//out.println("Password changed successfully..............");
			response.sendRedirect("userLogged.jsp");
			st.close();
			con.close();
		} else {
			out.println("Old Password doesn't match");
		}

	} catch (Exception e) {
		out.println(e);
		System.out.println("2154");
	}
%>