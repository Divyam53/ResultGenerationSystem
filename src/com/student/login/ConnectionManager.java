package com.student.login;
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
			connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres","Dj284204");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("failed"+e.getMessage());
			return null;
		}
		if(connection != null){
			System.out.println("Connection created successfully....");
		}
		return connection;
	}
}
