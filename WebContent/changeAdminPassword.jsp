<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<script language="javascript">
			function fncSubmit(){
				if(document.ChangePasswordForm.OldPassword.value == ""){
					alert('Please input old password');
					document.ChangePasswordForm.OldPassword.focus();
					return false;
				}	 
				if(document.ChangePasswordForm.newpassword.value == ""){
					alert('Please input Password');
					document.ChangePasswordForm.newpassword.focus(); 
					return false;
				} 
				if(document.ChangePasswordForm.conpassword.value == ""){
					alert('Please input Confirm Password');
					document.ChangePasswordForm.conpassword.focus(); 
					return false;
				} 
				if(document.ChangePasswordForm.newpassword.value != document.ChangePasswordForm.conpassword.value){
					alert('Confirm Password Not Match');
					document.ChangePasswordForm.conpassword.focus(); 
					return false;
				} 
				document.ChangePasswordForm.submit();
			}
		</script>
	</head>
	<body>
		<div class="col-lg-12">
			<div class="form-panel" style="width:500px;margin:0 
				auto;height:auto;position:relative;margin-top:100px;margin-bottom:100px;">
				<h4 class="mb"><i class="fa fa-angle-right"></i>Change Password</h4>
				<form class="form-horizontal style-form"  method="post" 
					action="changeFacultyPassword.jsp" OnSubmit="return fncSubmit();">
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">Old Password</label>
						<div class="col-sm-10">
						    <input type="password" name="OldPassword" class="form-control">
						</div>
					</div>  
					<div class="form-group">
					    <label class="col-sm-2 col-sm-2 control-label">New Password</label>
						<div class="col-sm-10">
							<input type="password" name="newpassword" class="form-control">
						</div>
					</div>					 					  
					<div class="form-group">
						<label class="col-sm-2 col-sm-2 control-label">Confirm Password</label>
						<div class="col-sm-10">
							<input type="password" name="conpassword" class="form-control">
						</div>
					</div>
					<center> <button type="submit" class="btn btn-theme">Change Password</button></center>
				</form>
			</div>
		</div><!-- col-lg-12--> 
	</body>
</html>