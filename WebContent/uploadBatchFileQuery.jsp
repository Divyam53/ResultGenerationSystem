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
	System.out.println("uploadbatchfile.jsp running.....");
	String table_author=(String)request.getSession().getAttribute("fac_name");
	   //These value must be taken from UI
	 String batchfile=(String)request.getSession().getAttribute("MyAttribute");

System.out.println("File name is "+batchfile);
//String get="gradesheet.xlsx";
String filename="/home/giri/workspace/ResultGenerationSystem/WebContent/"+batchfile;
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

PreparedStatement temp_table= c.prepareStatement("CREATE TABLE" + batchfile + "(st_id character varying NOT NULL,st_name character(25) NOT NULL,email text,year_admitted integer,password character(25),program character(10),dob date,fname character(25), mname character varying(20),mobile_no character varying(13),image bytea,CONSTRAINT student13_pkey PRIMARY KEY (st_id))");
System.out.println("in first block");
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
	   				String st_id=cell.getStringCellValue();
             		cell=row.getCell(1);
             		String st_name=cell.getStringCellValue();
             	    cell=row.getCell(2);
             	    String email=cell.getStringCellValue();
             	     cell=row.getCell(3);
            	 String year_admitted=cell.getStringCellValue();
            	   
            	   cell=row.getCell(4);
             	   String password=cell.getStringCellValue();
             	  
             	   cell=row.getCell(5);
            	   String program=cell.getStringCellValue();
            	   cell=row.getCell(6);
             	   String dob=cell.getStringCellValue();
             	  cell=row.getCell(7);
            	   String fname=cell.getStringCellValue();
            	   cell=row.getCell(8);
             	   String mname=cell.getStringCellValue();
             	  cell=row.getCell(9);
            	   String mobile_no=cell.getStringCellValue();
            	   
             	   //..
             	  PreparedStatement stmt1=c.prepareStatement("Insert into "+batchfile+" values (?,?,?,?,?,?,?,?,?)");
             	  stmt1.setString(1, st_id);
             	  stmt1.setString(2, st_name);
             	  stmt1.setString(3, email);
            	  stmt1.setString(4, year_admitted);
            	  stmt1.setString(5, password);
             	  stmt1.setString(6, program);
             	  stmt1.setString(7, dob);
            	  stmt1.setString(8, fname);
            	  stmt1.setString(9, mname);
            	  stmt1.setString(10, mobile_no);
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

PreparedStatement stmt=c.prepareStatement("Insert into addedbatch values (?,?)");
stmt.setString(1, batchfile);
stmt.setString(2, table_author);
try {
	stmt.executeUpdate();

	request.getSession().setAttribute("from-uploadFile", "true" );

%>
<head>
<script type="text/javascript">

window.location.href="uploadBatchFile.jsp";



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


window.location.href="adminIndex.jsp";


<script type="text/javascript">
alert("File upload failed");</script>

<h4 style="color:red;">Try again</h4>

</script>
<% 

}
c.close();
file.close();
} 
catch (Exception e) 
{
e.printStackTrace();
}%>
<body></body>
</html>