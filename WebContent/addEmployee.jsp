<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bs3_sticky-footer.css">
    <link rel="stylesheet" href="css/btn-file-input.css">
    <title>Add Emp</title>
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
		                        <li><a href="adMan">Ad Manager</a></li>
		                    </ul>
                		</li>
					</s:if>
					<li><a href="home">Department</a></li>
					<li><a href="employees">Employees</a></li>
					<!-- <li><a href="login">Log in</a></li> -->
				</ul>
			</div>


		</nav>

    <br>


    <h2>Add Employee</h2>
    <div class="row">
        <div class="col-md-offset-2 col-md-4">
            <img class="img-responsive" src="img/img.png" alt="" style="width: 180px; height: 180px"> <br>
            
            <s:if test="isLogin()">
            
            
	            <%-- <span class="btn btn-primary btn-file">
				    Browse... <input type="file" >
				</span>
				<button class="btn btn-default">Upload Image</button> --%>
				You can only change avatar after employee is created
				
			</s:if>
			<br>
			<br>
        </div>
        <div class="col-md-6">
            <s:if test='isLogin()'>
	            <table id="employee-list" class="table table-striped">
	                <tr>
	                    <th>Name</th>
	                    <td><input id='ename' class="form-control" type="text" value='<s:property value="e.name" />' /></td>
	                </tr>
	                <tr>
	                    <th>Department</th>
	                    <td>
							<select name="department_id" class="form-control" id="department_id">
                                <s:iterator value='allD' var='l'>
                                	<option value="<s:property value='#l.id' />"><s:property value='#l.name' /></option>
                                </s:iterator>
                            </select>
	                    </td>
	                </tr>
	                <tr>
	                    <th>Job Title</th>
	                    <td><input id='jobTitle' class="form-control" type="text" value="<s:property value='e.jobTitle' />"></td>
	                </tr>
	                <tr>
	                    <th>Cellphone</th>
	                    <td><input id='phone' class="form-control" type="text" value="<s:property value='e.phone' />"></td>
	                </tr>
	                <tr>
	                    <th>Email</th>
	                    <td>
	                        <input id='email' class="form-control" type="text" value="<s:property value='e.email' />">
	
	                    </td>
	                </tr>
	            </table>
            </s:if>
        </div>


        
    </div>
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-6 col-md-offset-6">
            <button id='btnAddEmp' class="btn btn-default" disabled>Add Employess</button>

        </div>

    </div>




</div>
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
		
		<script>
			var ename=$('#ename');
			ename.keyup(function() {
				if(ename.val()==''){
					ename.addClass('alert-danger');
					$('#btnAddEmp').prop('disabled', true);
				}else{
					ename.removeClass('alert-danger');
					$('#btnAddEmp').prop('disabled', false);
				}
			});
			$('#btnAddEmp').click(function() {
				var p1, p2, p3, p4, p5;
				p1='name='+ename.val();
				if($('#jobTitle').val()==''){
					p2='jobTitle='+'n/a';
				}else{
					p2='jobTitle='+$('#jobTitle').val();
				}
				if($('#phone').val()==''){
					p3='phone='+'n/a';
				}else{
					p3='phone='+$('#phone').val();
				}
				if($('#email').val()==''){
					p4='email='+'n/a';
				}else{
					p4='email='+$('#email').val();
				}
				p5='dmpId='+$("#department_id").val();
				
				var url=G_URL+'/addEmpJS?'+p1+'&'+p2+'&'+p3+'&'+p4+'&'+p5;
				$.getJSON(url, function(data){
					if(data.result==true){
						alert("Add emp successfully");
						var t=confirm("You want to add more emp?");
						if(t==true){
							location.reload();
						}else{
							window.location.href='employees';
						}
						
					}else{
						alert("Add emp failed, try login again");
					}
				});
			});
			
			
		</script>			
						
	</s:if>
</body>
</html>