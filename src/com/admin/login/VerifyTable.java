package com.admin.login;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 * Servlet implementation class VerifyTable
 */
@WebServlet(name = "verify", description = "it verifies table and remove temp table", urlPatterns = { "/verify" })
public class VerifyTable extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String droptablename=(String)session.getAttribute("DropTableName");
		//String tablename=request.getParameter("tablename");
		//System.out.println("drop table "+droptablename);
	try
			{

				ServletRequest session=null;
				//These value must be taken from UI 
	 			String course_id=session.getAttribute("course_id").toString();//"mat102";
//	 			int semester=4;
//	 			String table_author="Brijesh";
//	 			//

				//This value comes from the table temp_grade_tables 
				String table_name=(String)session.getAttribute("DropTableName");//"tempsem4mat102";

				// ----------------------------- Connection to database ------------------------------------------- //
				Connection c = null;
				Class.forName("org.postgresql.Driver");
				c = DriverManager
						.getConnection("jdbc:postgresql://localhost:5432/mydb",
								"postgres", "postgres");
				c.setAutoCommit(true);
				// ------------------------------------------------------------------------------------------------ //

				PreparedStatement stmt= c.prepareStatement("Select * from "+table_name);
				
				ResultSet  rs= stmt.executeQuery();

				while(rs.next()){
					String ID=rs.getString(1);
					String year=ID.substring(0, 4);

					PreparedStatement stmt1=c.prepareStatement("select st_id from kucp"+year+";");
					ResultSet rs1=stmt1.executeQuery();

					while(rs1.next()){
						if(rs1.getString(1).equalsIgnoreCase(ID)){


							String grade=rs.getString(2);
							PreparedStatement stmt2=c.prepareStatement("Update kucp"+year+" set "+course_id+"=(?) where st_id=?");
							//  System.out.println(stmt);
							stmt2.setString(1, grade);
							stmt2.setString(2, ID);
							try{
								stmt2.executeUpdate();
							}catch(Exception e){System.out.println(stmt2);}
						}
					}

				}
			
				stmt.close();
				
				
				PreparedStatement stmt3=c.prepareStatement("Drop table "+table_name);
				try{stmt3.execute();}catch(Exception e){System.out.println("problem while deleting table");}
				
				stmt3.close();
				PreparedStatement stmt4=c.prepareStatement("Delete from  temp_grade_tables where table_name=? and course_id=?");
				stmt4.setString(1, table_name);
				stmt4.setString(2, course_id);
				try{stmt4.execute();}catch(Exception e){
					e.printStackTrace();
					System.out.println("problem while deleting information table temp_grade_tables");}
				
				




				c.close(); // closing connection to database 
				System.out.println("Congratulations ..!!!!!");
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
	}



}
