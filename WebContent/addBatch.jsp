<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>IIITK Admin</title>
	</head>
	<body>				
		<form method="post" action="uploadBatchFile.jsp">
			<h1>Add a new Batch</h1>
			<div class="col-md-12">
				<div class="content-panel">
					<h4><i class="fa fa-angle-right"></i></h4>
					<hr>
						<center>
							<table style="width: 40%;" class="table">
								<tbody>
									<tr>
										<th>Enter Batch ID:</th>
										<th><input type="text" name="id" required></th>
									</tr>						
								</tbody>
							</table>
						</center>
						<center>
							<th><input type="submit" value="Next"  href="uploadBatchFile.jsp"/></th>							
						</center>
				</div>
				<! --/content-panel -->
			</div>
			<!-- /col-md-12 -->
		</form>
	</body>			
</html>