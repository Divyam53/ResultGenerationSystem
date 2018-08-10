<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ChangePassword</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<h2 align="center">
	<strong style="color:black;" >Change your Password</strong>
</h2>
<body background-color="yellow">
	<script language="javascript">
function fncSubmit()
{

if(document.ChangePasswordForm.OldPassword.value == "")
{
alert('Please input old password');
document.ChangePasswordForm.OldPassword.focus();
return false;
} 

if(document.ChangePasswordForm.newpassword.value == "")
{
alert('Please input Password');
document.ChangePasswordForm.newpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.conpassword.value == "")
{
alert('Please input Confirm Password');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value)
{
alert('Confirm Password Not Match');
document.ChangePasswordForm.conpassword.focus(); 
return false;
} 

document.ChangePasswordForm.submit();
}
</script>
	<form name="ChangePasswordForm" method="post"
		action="changeFacultyPassword.jsp" OnSubmit="return fncSubmit();">

		<table border="0" align="center" bgcolor="#E0E0E0">

			<tr style="color:black;" >
				<td >Old Password</td>
				<TD><input name="OldPassword" type="password" id="OLDpwd"
					size="20"></td>
			</tr>
			<tr style="color:black;" >
				<td>New Password</td>
				<td><input name="newpassword" type="password" id="newpassword">
				</td>
			</tr>
			<tr style="color:black;" >
				<td>Confirm Password</td>
				<td><input name="conpassword" type="password" id="conpassword">
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" name="Submit" value="Save"></td>
			</tr>

		</table>
	</form>
</body>
</html>