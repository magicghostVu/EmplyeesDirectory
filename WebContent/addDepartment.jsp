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

		<h2>Add Department</h2>
		<div class="row">
			<div class="col-md-5">
				<table class="table">
					<tr>
						<th>Name</th>
						<td><input id='dname' class="form-control" type="text"
							value="Department Name"></td>
					</tr>
					<tr>
						<th>Phone</th>
						<td><input id='dphone' type="text" value=""
							class="form-control"></td>
					</tr>

					<tr>
						<th>Manager</th>
						<td><input id='nameMan' type="text" value=""
							class="form-control"></td>
					</tr>

					<tr>
						<th>ID Manager</th>
						<td><input id='idMan' class="form-control" type="text"
							value=""></td>

					</tr>

				</table>
			</div>
		</div>

		<button id='addBnt' class="btn btn-default">Add Department</button>




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
	<s:if test='isLogin()'>
		<script src='js/bootstrap3-typeahead.min.js'></script>
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
			var idMan=$('#idMan');
			var inputN=$('#nameMan');
			var all;
			$.getJSON(G_URL+'/allEmpJS', function(data){
				//var inputN=$('#nameMan');
				all=data.all;
				inputN.typeahead({
					source: data.all
				});
				
			});
			
			inputN.change(function(){
				var man= inputN.typeahead('getActive');
				if(inputN.val()==man.name){
					idMan.val(man.id);
					//inputN.removeClass('alert-danger');
				}
				
			});
			idMan.keyup(function() {
				if(idMan.val()==''){
					idMan.removeClass('alert-danger');
					$('#addBnt').prop('disabled', false);
					inputN.val('');
					return;
				}
				for(var i=0;i<all.length;++i){
					if(all[i].id==idMan.val()){
						inputN.val(all[i].name);
						idMan.removeClass('alert-danger');
						$('#addBnt').prop('disabled', false);
						return;
					}
				}
				idMan.addClass('alert-danger');
				inputN.val('');
				$('#addBnt').prop('disabled', true);
			});
			var dname=$('#dname');
			
			dname.keyup(function() {
				if(dname.val()==''){
					dname.addClass('alert-danger');
					$('#addBnt').prop('disabled', true);
				}else {
					dname.removeClass('alert-danger');
					$('#addBnt').prop('disabled', false);
				}
			})
			$('#dphone').keyup(function() {
				
			});
			
			$('#addBnt').click(function() {
				var url=G_URL+'/addDpmJSON?';
				var p1,p2,p3;
				p1='name='+dname.val();
				
				if($('#dphone').val()==''){
					p2='phone='+'n/a';
				}else {
					p2='phone='+$('#dphone').val();
				}
				
				if(idMan.val()==''){
					p3='idMan='+'-1';
				}else{
					p3='idMan='+idMan.val();
				}
				url=url+p1+'&'+p2+"&"+p3;
				$.getJSON(url, function(data){
					alert(data.result);
				});
			})
			
			
		</script>
	</s:if>
	
	
</body>
</html>