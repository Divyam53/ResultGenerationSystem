package com.admin.login;
import java.io.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteRow
 */
@WebServlet(description = "deleteItem", urlPatterns = { "/DeleteRow" })
public class DeleteRow extends HttpServlet {
private static final long serialVersionUID = 1L;


public DeleteRow() {
    super();
    // TODO Auto-generated constructor stub
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");

	  PrintWriter out = response.getWriter();	
	  String id = request.getParameter("id");
	  System.out.println("  ID to be deleted is "+id);
	  try {
 	   Class.forName("org.postgresql.Driver");
 	   Connection conn= DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb", "postgres","postgres");
        String query = "delete from faculty where fac_id='"+id+"' ";
        Statement stmt = conn.createStatement();
        int i = stmt.executeUpdate(query);
        if(i>0){
        	if(id.charAt(0)=='M')
        		response.sendRedirect("showOperator.jsp");
        	else if(id.charAt(0)=='T')
        		response.sendRedirect("showFaculty.jsp");
        }
        else{
        	if(id.charAt(0)=='M')
        		response.sendRedirect("showOperator.jsp");
        	else if(id.charAt(0)=='T')
        		response.sendRedirect("showFaculty.jsp");
        }
        	
        conn.close();
    }
    catch(Exception e){
        e.printStackTrace();
    }
}
}
