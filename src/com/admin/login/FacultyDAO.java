package com.admin.login;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.student.login.ConnectionManager;
public class FacultyDAO { 
	static Connection currentCon = null; 
	static ResultSet rs = null; 
	public static FacultyParameters login(FacultyParameters bean) { 
		//preparing some objects for connection 
		Statement stmt = null; 
		String username = bean.getFacName(); 
		String password = bean.getFacPassword(); 
//code added
		char[] newpass1 = new char[password.length()];
		for(int i=0;i<2*(password.length());i++){
			if(i>0&&i<password.length()-1)
			{newpass1[i]=password.charAt(i);
			newpass1[i+1]=password.charAt(2);
			}
		}
		String b = new String(newpass1);
		System.out.println(b);
		//password=b;
//code added
		String searchQuery =  "SELECT * FROM faculty WHERE fac_id = '"+username+"' AND fac_pwd = '"+password+"' "; 
		// "System.out.println" prints in the console; Normally used to trace the process 
		System.out.println("Your user name is " + username); 
		System.out.println("Your password is " + password); 
		System.out.println("Query: "+searchQuery); 
		
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
				String id = rs.getString("fac_id"); 
				String name = rs.getString("fac_name"); 
				String email = rs.getString("fac_email");
				String mobile=rs.getString("fac_mobile");
				String filename=rs.getString("file");
				System.out.println("Welcome " + name+" "+ id +" "+ email); 
				bean.setFacId(id); 
				bean.setFacName(name); 
				bean.setFacEmail(email);
				bean.setFacMobile(mobile);
				bean.setFileName(filename);
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
