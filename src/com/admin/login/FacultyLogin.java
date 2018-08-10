package com.admin.login;

import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet(description = "Validates user against data of database", urlPatterns = { "/facultyservlet" })
public class FacultyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException { 
		try{ 
			Integer visitCount = new Integer(0);
			String visitCountKey = new String("visitCount");
			FacultyParameters facuser = new FacultyParameters(); 
			String uname=request.getParameter("username");
			uname=uname.toUpperCase();
			facuser.setFacName(uname); 
			facuser.setFacPassword(request.getParameter("password"));
			facuser = FacultyDAO.login(facuser); 
			if (facuser.isValid()){ 
				HttpSession session = request.getSession(true); 
				session. setMaxInactiveInterval(15*5);
				Date createTime = new Date(session.getCreationTime());    // Get session creation time.
				Date lastAccessTime = new Date(session.getLastAccessedTime());   // Get last access time of this web page.
				System.out.println("Current time " +createTime+"last accessed "+lastAccessTime);
				String verifyType = uname.substring(0, 1);
				session.setAttribute("currentFacultySessionUser",facuser); //currentSessionUser is object of user
				switch (verifyType) {
					case "T":
						System.out.print("Faculty Logged in type");
						response.sendRedirect("facultyIndexx.jsp");
						break;
					case "M":
						System.out.print("Operator Logged in type");
						response.sendRedirect("operatorIndex.jsp");
						break;
					case "A":
						System.out.print("Admin Logged in type");
						response.sendRedirect("adminIndex.jsp");
						break;
				}
			}else 
				response.sendRedirect("invalidLogin.jsp"); //error page 
		}catch (Throwable theException){ 
				System.out.println(theException); 
		} 
	}
}

