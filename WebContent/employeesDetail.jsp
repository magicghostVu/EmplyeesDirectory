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
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/btn-file-input.css">
    <link rel="stylesheet" href="css/bs3_sticky-footer.css">
    <title>Title</title>

</head>
<body>
<div class="container">
    <nav class="navbar navbar-inverse">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#menu">
					<span class="sr-only">Toggle navigation </span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>

				</button>
				<a class="navbar-brand" href="">Employees Directory</a>
			</div>
			<div class="navbar-collapse collapse" id="menu">
				<ul class="navbar-right nav navbar-nav">
					<s:if test="isLogin()">
						<li>
		                    <a href="" data-toggle="dropdown"><s:property value="admin.userName" /> <span class="caret"></span></a>
		                    <ul class="dropdown-menu">
		                        <li><a id="logout">Log out</a></li>
		                        <li><a href="changePass">Change password</a></li>
		                    </ul>
                		</li>
					</s:if>
					<li><a href="home">Department</a></li>
					<li><a href="employees">Employees</a></li>
					<li><a href="login">Log in</a></li>
				</ul>
			</div>


		</nav>

    <br>


    <h2>Employee Detail</h2>
    <div class="row">
        <div class="col-md-offset-2 col-md-4">
            <img class="img-responsive" src="img/img.png" alt="" style="width: 180px; height: 180px"> <br>
            
            
            
            <s:if test="isLogin()">
            
            
	            <span class="btn btn-primary btn-file">
				    Browse... <input type="file" >
				</span>
				<button class="btn btn-default">Upload Image</button>
				
				
			</s:if>
			
            <br>
            <br>
            <!-- <button class="btn btn-default">Upload Image</button> -->

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
            <s:else>
            	<table class="table table-striped">
	                <tr>
	                    <th>Name</th>
	                    <td><s:property value='e.name' /></td>
	                </tr>
	                <tr>
	                    <th>Department</th>
	                    <td><s:property value='e.departments.name' /></td>
	                </tr>
	                <tr>
	                    <th>Job Title</th>
	                    <td><s:property  value='e.jobTitle' /></td>
	                </tr>
	                <tr>
	                    <th>Cellphone</th>
	                    <td><s:property value='e.phone' /></td>
	                </tr>
	                <tr>
	                    <th>Email</th>
	                    <td><s:property  value='e.email'/></td>
	                </tr>
	            </table>
            
            </s:else>
            
        </div>


        
    </div>
    <div class="clearfix"></div>
    
    <s:if test="isLogin()">
	    <div class="row">
	        <div class="col-md-6 col-md-offset-6">
	            <button id='btnUpdate' class="btn btn-default" disabled>Update</button>
	            <button id='deleteEmp' class="btn btn-default">Delete Employee</button>
	        </div>
	
	    </div>
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
			var log='#logout';
			
			
			var logout=$(log);
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
			function getUrlParameter(sParam) {
			    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
			        sURLVariables = sPageURL.split('&'),
			        sParameterName,
			        i;
	
			    for (i = 0; i < sURLVariables.length; i++) {
			        sParameterName = sURLVariables[i].split('=');
	
			        if (sParameterName[0] === sParam) {
			            return sParameterName[1] === undefined ? true : sParameterName[1];
			        }
			    }
			}
			var updateBtn=$('#btnUpdate');
			$('#ename').keyup(function(){
				if($('#ename').val()==''){
					updateBtn.prop('disabled',true );
					$('#ename').addClass('alert-danger');
				}else{
					updateBtn.prop('disabled',false );
					$('#ename').removeClass('alert-danger');
				}
			});
			
			updateBtn.click(function(){
				var url=G_URL+'/updateEmp?';
				var name=$('#ename').val();
				
				var idDepart=$('#department_id').val();
				var jobTitle=$('#jobTitle').val();
				if(jobTitle==''){
					jobTitle='n/a';
				}
				var email=$('#email').val();
				if(email==''){
					email='n/a';
					
				}
				var phone=$('#phone').val();
				if(phone==''){
					phone='n/a';
					
				}
				
				//alert(name+' '+email+" "+phone+" "+jobTitle)
				var p0='id='+getUrlParameter('id');
				var p1='name='+name;
				var p2='jobTitle='+jobTitle;
				var p3='email='+email;
				var p4='phone='+phone;
				var p5='idDepartment='+idDepart;
				//alert(url+p1+"&"+p2+"&"+p3+"&"+p4+"&"+p5);
				url=url+p1+"&"+p2+"&"+p3+"&"+p4+"&"+p5+'&'+p0;
				$.get(url, function(data){
					alert(data.result);
				});
				//alert(url);
			});
			
			var btnDelete=$("#deleteEmp");
			btnDelete.click(function() {
				var id=getUrlParameter('id');
				var t=confirm("It will delete this employee, you sure ?")
				if(t==true){
					var url=G_URL+'/deleteEmpJS?id='+id;
					$.getJSON(url, function(data) {
						alert(data.result);
					})
				}
			});
			
			
			
		</script>
					
						
	</s:if>

</body>
</html>