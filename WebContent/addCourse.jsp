<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function coreg() {
		$("#options").load("courseRegistration.jsp");
	}
</script>
</head>
<body>
	<form action="courseRegistration.jsp">
		<h1>Course Registration</h1>

		<div class="col-md-12">
			<div class="content-panel">
				<h4>
					<i class="fa fa-angle-right"></i> Add a Course
				</h4>
				<hr>
				<center>
					<table style="width: 40%;" class="table">
						<tbody>
							<tr>
								<th>Course_code:</th>
								<th><input type="text" name="course_code" /></th>
							</tr>
							<tr>
								<th>Course_title:</th>
								<th><input type="text" name="course_title" /></th>
							</tr>
							<tr>
								<th>Program:</th>
								<th><input type="text" name="program" /></th>
							</tr>


							<tr>
								<th>Semester:</th>
								<th><input type="text" name="semester" /></th>
							</tr>

							<tr>
								<th>Credits:</th>
								<th><input type="text" name="credits" /></th>
							</tr>

							<tr>
								<th>Branch:</th>
								<th><input type="text" name="branch" /></th>
							</tr>


							</tr>


						</tbody>
					</table>
				</center>
				<center>
					<input type="submit" value="Submit" onClick="coreg()" />
					</th>
				</center>
			</div>
			<! --/content-panel -->
		</div>
		<!-- /col-md-12 -->




	</form>
</body>
</html>

