package com.admin.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(description = "Logout", urlPatterns = { "/facultylogout" })
public class FacultyLogout extends HttpServlet {
   private static final long serialVersionUID = 1L;
   public void doGet(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, java.io.IOException {

   try
   {      

        FacultyParameters user = new FacultyParameters();
        user.removeName();
        user.removeId();
        HttpSession session=request.getSession(false);
        session.removeAttribute("currentSessionUser");
        session.invalidate();
        response.sendRedirect("login.html");
        System.out.println("logged out !!!!");
   }      
   catch (Throwable theException)       
   {
        System.out.println(theException);
   }
  }
}

