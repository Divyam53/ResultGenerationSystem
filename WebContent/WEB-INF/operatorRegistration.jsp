<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String contact = request.getParameter("contact");
	String user = request.getParameter("user");
	Connection con = null;
	Statement st = null;
	try {
		Class.forName("org.postgresql.Driver");
		con = DriverManager.getConnection("jdbc:postgresql://172.17.21.141:5432/mydb", "postgres", "postgres");
		st = con.createStatement();
		st.executeUpdate("INSERT INTO faculty VALUES('" + user + "','" + name + "','" + contact + "','" + email+ "','" + password + "') ");
	} catch (Exception e) {
		out.println(e);
		System.out.println("EXCEPTION OCCURRED");
	}
%>