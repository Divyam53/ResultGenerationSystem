<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.*"%>
    <%@page import="java.util.*" %>
<%@page import ="java.util.Iterator" %>
<%@page import="org.apache.poi.ss.usermodel.*" %>
<%@page import="org.apache.poi.xssf.usermodel.*" %>
<%@page import="java.sql.*" %>
<%-- <%-- <%@ page import="org.apache.commons.fileupload.*" %> --%>
<%-- <%@page import="org.apache.commons.fileupload.disk.*" %> --%>
<%-- <%@page import="org.apache.commons.fileupload.servlet.*" %> --%>
<%-- <%@page import="org.apache.commons.io.output.*" %> --%>

<%

try
{
	System.out.println("uploadfile.jsp running.....");
	
	
	
	   //These value must be taken from UI
	 String course_id=(String)request.getSession().getAttribute("coursecode");
//String course_id="mat102";
System.out.println("uFile 1: "+course_id);
//int semester =8;
int semester =Integer.parseInt((String)request.getSession().getAttribute("semester"));
System.out.println("uFile2: "+semester);

String table_author=(String)request.getSession().getAttribute("fac_name");

System.out.println("uFile3: "+table_author);

//String table_author="Brijesh";
//
String get=session.getAttribute("MyAttribute").toString();
System.out.println("File name is "+get);
//String get="gradesheet.xlsx";
String filename="/home/lakshman/workspace2/ResultGenerationSystem/WebContent/"+get;
//System.out.println(filename);
FileInputStream file = new FileInputStream(new File(filename));

//Create Workbook instance holding reference to .xlsx file
XSSFWorkbook workbook = new XSSFWorkbook(file);

//Get first/desired sheet from the workbook
XSSFSheet sheet = workbook.getSheetAt(0);

Connection c = null;
//PreparedStatement stmt = null;

// to connect database 
  Class.forName("org.postgresql.Driver");
  c = DriverManager
     .getConnection("jdbc:postgresql://localhost:5432/mydb",
     "postgres", "postgres");
c.setAutoCommit(true);
 
//      stmt=c.prepareStatement("insert into public.fest values(?,?,?,?,?,?);"); 

//Iterate through each rows one by one
int found=0;
String table_name="tempsem"+semester+course_id;
PreparedStatement temp_table= c.prepareStatement("create table "+table_name+" (st_id varchar(12), grade varchar(2))");
try{
temp_table.execute();

	

Iterator<Row> rowIterator = sheet.rowIterator();
while (rowIterator.hasNext()) 
{
	   XSSFRow row = (XSSFRow) rowIterator.next();

	   if(row.getRowNum()==0){
		   continue;   
	   }
	   found++;
	   Cell cell=row.getCell(0);
                
             	   String ID=cell.getStringCellValue();
             		  cell=row.getCell(1);
             	   String grade=cell.getStringCellValue();
             	   
             	   
             	  PreparedStatement stmt1=c.prepareStatement("Insert into "+table_name+" values (?,?)");
             	  stmt1.setString(1, ID);
             	  stmt1.setString(2, grade);
             	  try{	
             	  stmt1.executeUpdate();
             	 /*
             	 check here for maintainance
             	 
             	 */
          		
             	  
             	  }catch(Exception e){
             		 
             		  System.out.println("problem in the insertion query of data ");
               		  System.out.println(stmt1);
                       
             	  }
             	  
             	  

   
	 }

PreparedStatement stmt=c.prepareStatement("Insert into temp_grade_tables values (?,?,?,?)");
stmt.setString(1, table_name);
stmt.setString(2, table_author);
stmt.setString(3, course_id);
stmt.setInt(4, semester);
try {
	stmt.executeUpdate();

	request.getSession().setAttribute("from-uploadFile", "true" );

%>
<head>
<script type="text/javascript">

window.location.href="facultyIndexx.jsp";



</script></head>

<%
} catch (Exception e) {



	System.out.println("problem in insertion of temporary table information");
		System.out.println(stmt);
}

System.out.println("Total rows inserted =  "+found);


}catch(Exception e){

///System.out.println("Table already exists or cannot be created");

//System.out.println(temp_table);

request.getSession().setAttribute("from-uploadFile", "true" );
%>
<script type="text/javascript">


window.location.href="firstSelect.jsp";




</script>
<% 

}
c.close();
file.close();
} 
catch (Exception e) 
{

	%>
	<script type="text/javascript">
	alert("unsupported  file format ");

	window.location.href="firstSelect.jsp";

	</script>


	
	<% 
e.printStackTrace();
}%>
<body></body>
</html>