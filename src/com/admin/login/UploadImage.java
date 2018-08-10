package com.admin.login;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/UploadImage")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)

public class UploadImage extends HttpServlet {
    private static final String SAVE_DIR="Database";
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        FacultyParameters facultyUser = (FacultyParameters) (session.getAttribute("currentFacultySessionUser"));
        String name=facultyUser.getFacId();
            String savePath = "/home/lakshman/workspace2/ResultGenerationSystem/WebContent/assets/"+ SAVE_DIR;
                File fileSaveDir=new File(savePath);
                if(!fileSaveDir.exists()){
                    fileSaveDir.mkdir();
                }
            Connection con=null;
            Part part=request.getPart("file");
            String fileName=extractFileName(part);
            /*if you may have more than one files with same name then you can calculate some random characters and append that characters in fileName so that it will  make your each image name identical.*/
            part.write(savePath + File.separator + fileName);
           /* 
            //You need this loop if you submitted more than one file
            for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            part.write(savePath + File.separator + fileName);
        }*/
            try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mydb","postgres","postgres");
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
 		   
 		   // Provide URL, database and credentials according to your database 
 		   

            String query="UPDATE faculty SET file=? where fac_id= '"+name+"' " ;
            try {
                PreparedStatement pst;
                pst=con.prepareStatement(query);

                //String filePath= savePath + File.separator + fileName ;
                String filePath= "assets/Database/"+fileName ;
                pst.setString(1,filePath);
                
					pst.executeUpdate();
					response.sendRedirect("facultyIndexx.jsp");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    }
    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}
