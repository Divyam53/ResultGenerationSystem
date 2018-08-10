package com.admin.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionManager { 
	static Connection con; 
	static String url; 
	public static Connection getConnection() { 
		  System.out.println("Creating postgres DataBase Connection");
		  Connection connection = null;

		  try {
		   
		   // Provide database Driver according to your database
		   Class.forName("org.postgresql.Driver");
		   
		   // Provide URL, database and credentials according to your database 
		   connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","postgres");

		  } catch (Exception e) {
		   e.printStackTrace();
		   return null;
		  }
		  if(connection != null){
		   System.out.println("Connection created successfully....");
		  }
		  return connection;
		  }
}

