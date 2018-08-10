<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<head>
<title>View Image Page</title>
</head>
<body>


<form action="UploadServlet" method="post" enctype="multipart/form-data"> <br><br>

<form action="UploadServlet" method="post" enctype="multipart/form-data"> <br><br>
<table>
      <tr>
                 <td>UserName:  </td>
                 <td width='10px'></td>
                 <td><input type="text" name="unname"/></td>
      </tr>
      
      <tr>
                 <td>Upload: </td>
                 <td width='10px'></td>
                 <td><input type="file" name="filecover" value="Upload"/></td>
      </tr>
      <tr>
          <td><input type="submit" value="submit"></td>
      </tr>
</table>
</form>
</body>
</html>