<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<title>Home</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/bs3_sticky-footer.css">
<link rel="stylesheet" href="css/font-face.css">
<style>
body{
	font-family: miui;
}

</style>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#menu">
					<span class="sr-only">Toggle navigation </span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>

				</button>
				<a class="navbar-brand" href="home">Employees Directory</a>
			</div>
			<div class="navbar-collapse collapse" id="menu">
				<ul class="navbar-right nav navbar-nav">
					<s:if test="isLogin()">
						<li>
		                    <a href="" data-toggle="dropdown"><s:property value="admin.userName" /> <span class="caret"></span></a>
		                    <ul class="dropdown-menu">
		                        <li><a id="logout">Log out</a></li>
		                        <li><a href="changePass">Change password</a></li>
		                        <li><a href="addUser">Add User</a></li>
		                    </ul>
                		</li>
					</s:if>
					<li class='active'><a href="home">Department</a></li>
					<li><a href="employees">Employees</a></li>
					<li><a href="login">Log in</a></li>
				</ul>
			</div>


		</nav>

		<br>

		<h3>Department</h3>
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Manager</th>
					<th>Office number</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="allDepartment" var="l">
					<tr>
						<td><s:property value="#l.id" /></td>
						<td>
						
							<a href='department?id=<s:property value="#l.id" />'> <s:property value="#l.name" /></a>
							
						</td>
						<td><s:property value="#l.employees.name" /></td>
						<td><s:property value="#l.officeNumber" /></td>
					</tr>

				</s:iterator>


				<!-- <tr>
                    <td>1</td>
                    <td>Phòng Nhân Sự</td>
                    <td>H.P.</td>
                    <td>01689357005</td>
                </tr>

                <tr>
                    <td>1</td>
                    <td>Phòng Nhân Sự</td>
                    <td>H.P.</td>
                    <td>01689357005</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Phòng Nhân Sự</td>
                    <td>H.P.</td>
                    <td>01689357005</td>
                </tr>
 -->


			</tbody>

		</table>
		
		<s:if test='isLogin()==true'> 
			<a href='addDpm' class="btn btn-default">Add Department</a>
		</s:if>

	</div>
	<br>
	<footer class="footer">
        <div class="container_">
            <div class="col-md-offset-1">
                <p class="text-muted">Phát triển ứng dụng web</p>
            </div>

        </div>
    </footer>



	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/global_url.js"></script>
	<s:if test="isLogin()">
		<script>
			var logout=$('#logout');
			var urlLogout=G_URL+'/logout';
			logout.click(function(){
				$.getJSON(urlLogout, function(data){
					if(data.res1==true){
						alert("Logout success")
						window.location.replace(G_URL);
					}
				});
			});
			
		</script>				
						
	</s:if>
	

</body>
</html>