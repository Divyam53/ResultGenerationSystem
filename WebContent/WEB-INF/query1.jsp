<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="com.student.login.UserBean" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style>
@page{size: A4;}
th, td {
    border: 1px solid black;
    border-collapse: collapse;
    width: auto;
    margin-left: auto;
    margin-right: auto;
   
}
.tabl{

    border: 1px solid black;
    border-collapse: collapse;
    width: auto;
    margin-left: auto;
    margin-right: auto;


}
table{
    border:none;
    width: auto;
    margin-left: auto;
    margin-right: auto;
    border-collapse:collapse;



}
h1 {
    display: block;
    font-size: 1.8em;
    margin-top: 0.67em;
    margin-bottom: 0.1em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;
    align:center;
}
h2 {
    display: block;
    font-size: 0.8em;
    margin-top: 0.67em;
    margin-bottom: 0.1em;
    margin-left: 0;
    margin-right: 0;
    font-weight: bold;
    text-decoration: underline;
}
p {
  font-size:0.6em;


}

 th, td {
    padding: 5px;
    text-align: center;
    font-size: 0.6em;
}
 img {width:80%;
text-align:center;
margin-left:10%;
height:160px;}
.first {border:1px solid #FFFFFF;
text-align:left;}
.second{border:1px solid #FFFFFF;
text-align:right;}
</style></head>
<body>
<title>IIIT GRADESHEET</title>


<!--<h1>
<center>Indian Institute of Information Technology, Kota</center>
<center>भारतीय सूचना प्रौद्योगिकी संस्थान,कोटा</center>
</h1>
<p><center>(Mentor Institute: Malviya National Institute of Technology, Jaipur)</p></center></br>
-->
<img src="IIITKLetterHead.png"></img>
<h2><center>SEMESTER GRADE REPORT / सत्र  ग्रेड रिपोर्ट</center></h2></br>

<table class="tabl" style="width:80% ";>
<tr>
    <td>STUDENT'S NAME <BR> छात्र / छात्रा का नाम</td><td>ID NO. <BR>रोल नं.</td><td>SEMESTER<BR>सत्र </td><td>YEAR <BR>वर्ष</td>
   
</tr>
<%
            UserBean currentUser = (UserBean) (session.getAttribute("currentSessionUser"));
            String Id = currentUser.getId();
            System.out.println("Id is " + Id);
        %>
<tr>
    <td style="text-align:left;">
        <%
                    out.print(currentUser.getName());
                %>
    </td>
    <td>
        <%
                    out.print(currentUser.getId());
                %>
    </td>
           <%
                    int id = 0;
                    float sum = 0;// for the total grades obtained
                    int total_credits = 0;
                    Connection con = null;
                    //con.setAutoCommit(false);
                    Statement st = null, st1 = null;
                    String pass = "";
                    String batch = Id.substring(0, 4);
                    batch = "kucp" + batch;
                    String s = request.getParameter("str");
                    System.out.println(batch);
                    int var = Integer.parseInt(s);
                %>
    <td >
        <%
                    out.print(var);
                %>
    </td>
    <td>
         <%
                    out.print("2015-2016");
                %>
    </td>
</tr>

</table></br>
<table class="tabl" style="width:80%;border:hide";>
<col width="100%">
<tr>
    <td class="first">PROGRAM / कार्यक्रम : B.TECH</td>
    </tr>
<tr>
    <td class="first">DEPARTMENT / विभाग : COMPUTER SCIENCE & ENGINEERING</td>
    </tr>
</table>
<!--<table class="tabl" style="width:80%">
 <tr>
    <td>FATHER'S NAME:Nitesh Kumar Giri</td>
   
    <td rowspan="2">PROGRAMME:B.TECH</td>
  </tr>
  <tr>
    <td>DEPARTMENT:Electronics & Communication Engineering</td>
   
  </tr>
</table></br>
--></br>

<table class="tabl" style="width:80%">
  <col width="20%">
  <col width="37%">
  <col width="12%">
  <col width="15%">
    <tr>
        <td><span style='font-weight:bold;'>COURSE CODE <br> पाठ्यक्रम  क्.</span>
        </td>
        <td><span style='font-weight:bold;'> COURSE TITLE <BR> पाठ्यक्रम नाम</span>
        </td>
        <td><span style='font-weight:bold;'>COURSE CREDIT <BR> पाठ्यक्रम अंक</span>
        </td>
        <td><span style='font-weight:bold;'>GRADE OBTAINED <BR> अर्जित ग्रेड</span>
        </td>
    </tr>
    <%
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println(e);
            System.exit(-1);
        }
        try {
            con = DriverManager.getConnection("jdbc:postgresql://172.17.21.141:5432/mydb", "postgres", "postgres");
            st = con.createStatement();
            st1 = con.createStatement();
            int size = 0, j = 0;
            ResultSet rs0 = null, rs = null;
            if (var != 9) {
                rs0 = st.executeQuery("SELECT count(1) FROM courseinfo WHERE semester='" + var + "'");
                while (rs0.next())
                    size = rs0.getInt("count");
                rs = st.executeQuery("SELECT * FROM courseinfo WHERE semester='" + var + "'");
            } else if (var == 9) {
                rs0 = st.executeQuery("SELECT count(1) FROM courseinfo ");
                while (rs0.next())
                    size = rs0.getInt("count");
                rs = st.executeQuery("SELECT * FROM courseinfo");
            }
            String[][] ccode = new String[size][3];
            while (rs.next()) {
                String course_id = rs.getString(1);
                int sem = rs.getInt(4);
                int credit = rs.getInt(5);
                String coursecode = rs.getString(1);
                ccode[j][0] = coursecode.toUpperCase();//course code
                ccode[j][1] = rs.getString(2);//course title
                ccode[j][2] = Integer.toString(credit);//credits
                total_credits = total_credits + credit;
                ResultSet rs1 = st1
                        .executeQuery("select " + course_id + " from " + batch + " where st_id='" + Id + "'");
    %>
    <!--<tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <tr><td>MAT-101</td><td style="text-align:left;">MATHEMATICS-I</td><td>4</td><td>D</td></tr>
    <!-- <tr><td colspan="2">SGPA</td><td colspan="2">3.84</td></tr> -->
    -->
       <tr>
                <td>
                    <%
                        out.print(ccode[j][0]);
                    %>
                </td>
                <td>
                    <%
                        out.print(ccode[j][1]);
                    %>
                </td>
                <td>
                    <%
                        out.print(ccode[j][2]);
                    %>
                </td>
             <%
                        while (rs1.next()) {
                        final String cases = rs1.getString(1);
             %>
                    <td>
                    <%
                        out.print(cases);
                    %>
                </td>
            </tr>
<%             switch (cases) {
                    case "AA":
                        sum = sum + (credit * 10);
                        break;
                    case "AB":
                        sum = sum + (credit * 9);
                        break;
                    case "BB":
                        sum = sum + (credit * 8);
                        break;
                    case "BC":
                        sum = sum + (credit * 7);
                        break;
                    case "CC":
                        sum = sum + (credit * 6);
                        break;
                    case "CD":
                        sum = sum + (credit * 5);
                        break;
                    case "D":
                        sum = sum + (credit * 4);
                        break;
                    case "F":
                        sum = sum + (credit * 0);
                        break;
                    }
                }
                j++;
            }
    %>
        <%
            for (int k = 0; k<j; k++)
                    System.out.println(ccode[k][0] + "   " + ccode[k][1] + "    " + ccode[k][2]);
                System.out.println("CGPA ::  " + (sum / total_credits));
        %>
</table></br>
<table class="tabl" style="width:80%;border:hide";>
<col width="100%">
<tr>
    <td class="first">REMARKS / टिप्पणी :</td>
    </tr>
</table>   
<!--<table style="width:80%;">
<tr><td><span style='font-weight:bold;'>DUGC,IIIT Kota</span></td><td></td></tr>
<tr><td></td><td><span style='font-weight:bold;'>Signature</span></td></tr>
<tr><td></td><td><span style='font-weight:bold;'>Coordinator,IIIT KOta</span></td></tr>
</table> -->
<table class="tabl" style="width:80%">
  <col width="50%">
  <col width="50%">
    <tr >
        <td><span style='font-weight:bold;'>CURRENT SEMESTER PERFORMANCE <br>वर्तमान सत्र प्रदर्शन</span>
        </td>
        <td><span style='font-weight:bold;'>  CUMMULATIVE PERFORMANCE <BR> संचित प्रदर्शन</span>
        </td>
    </tr>

</table>
<table class="tabl" style="width:80%">
  <col width="20%">
  <col width="15%">
 <col width="15%">
  <col width="20%">
 <col width="15%">
  <col width="15%">
    <tr style="border-bottom:1px solid #FFFFFF" >
        <td>TOTAL CREDIT REGISTERED <br>कुल पंजीकृत अंक</td>
        <td>GRADE POINT<BR>ग्रेड प्वाइंट</td>
        <td>SGPA<BR>एसजीपीए</td>
        <td>TOTAL CREDIT REGISTERED<BR>कुल पंजीकृत अंक</td>
        <td>GRADE POINT<BR>ग्रेड प्वाइंट</td>
        <td>CGPA<BR>सीजीपीए</td>
    </tr>
    <tr>
        <td>723</TD>
        <td></TD>
        <td>
            <%
                            out.print((sum / total_credits));
                    %>
        </TD>
        <td></TD>
        <td></TD>
        <td></TD>
    </tr>
<%
            st.close();
                con.close();
            } catch (java.sql.SQLException e) {
                System.err.println(e);
                System.exit(-1);
            }
        %>
</table>
<BR>
<BR>
<BR>
<table class="tabl" style="width:80%;border:hide";>
<col width="100%">
<tr>
    <td class="second">उप / सहायक कुलसचिव (अकादमिक)</td>
    </tr>
<tr>
    <td class="second">DEPUTY/ASSTT. REGISTRAR(ACADEMIC)</td>
    </tr>
</table>



</body>



</html>