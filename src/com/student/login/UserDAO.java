package com.student.login;
import java.sql.*;
public class UserDAO { 
	static Connection currentCon = null; 
	static ResultSet rs = null; 
	public static UserBean login(UserBean bean) { 
		//preparing some objects for connection 
		Statement stmt = null; 
		String username = bean.getUsername();
		String password = bean.getPassword(); 
		String uname=username.substring(0,4);
		uname="student"+uname;
		username=username.toUpperCase();
		String searchQuery =  "SELECT * FROM "+ uname+" WHERE st_id = '"+username+"' AND password = '"+password+"' "; 
		// "System.out.println" prints in the console; Normally used to trace the process 
		System.out.print(" Your user name is " + username); 
		System.out.print(" Your password is " + password); 
		System.out.print(" Query: "+searchQuery); 

		try { 
			//connect to DB 
			currentCon = ConnectionManager.getConnection(); 
			stmt=currentCon.createStatement(); 
			rs = stmt.executeQuery(searchQuery); 
			boolean more = rs.next(); 
			// if user does not exist set the isValid variable to false 

			if (!more) { 
				System.out.println("Sorry, you are not a registered user! Please sign up first"); 
				bean.setValid(false); } //if user exists set the isValid variable to true 

			else if (more) { 
				String id = rs.getString("st_id"); 
				String name = rs.getString("st_name"); 
				String fname = rs.getString("fname");
				String dob=rs.getString("dob");
				String program=rs.getString("program");
				System.out.println("Welcome " + name+" "+dob +" "+ program); 
				bean.setId(id); 
				bean.setName(name); 
				bean.setFname(fname);
				bean.setDob(dob);
				bean.setProgram(program); 
				bean.setValid(true); 
			} 
		} 
		catch (Exception ex) { 
			System.out.println("Log In failed: An Exception has occurred! " + ex); 
		} 
		//some exception handling 
		finally {
			if (rs != null) { 
				try { 
					rs.close(); 
				} 
				catch (Exception e) {

				} 
				rs = null; 
			} 
			if (stmt != null) { 
				try { stmt.close(); 
				} 
				catch (Exception e) {

				} stmt = null; 
			} 
			if (currentCon != null) { 
				try { 
					currentCon.close(); 
				} 
				catch (Exception e) {

				} 
				currentCon = null; 
			} 
		} 
		return bean; 

	} 
}	
