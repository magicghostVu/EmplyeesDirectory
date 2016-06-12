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
<title>All Employees</title>
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
						<li><a href="" data-toggle="dropdown"><s:property
									value="admin.userName" /> <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a id="logout">Log out</a></li>
								<li><a href="changePass">Change password</a></li>
							</ul></li>

					</s:if>
					<li><a href="home">Department</a></li>
					<li class='active'><a href="employees">Employees</a></li>
					<li><a href="login">Log in</a></li>

				</ul>
			</div>


		</nav>

		<br>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Search</h3>
			</div>
			<div class="panel-body">
				<div class="form-inline" id="indexForm" accept-charset="utf-8">
					<div class="form-group">
						<label class="sr-only" for="Name">Employee Name</label> <input
							name="name" class="form-control" placeholder="Employee Name"
							type="text" id="name-emp" />
					</div>
					<div class="form-group">
						<label class="sr-only" for="DepartmentId">Department</label> <select
							name="idDpm" class="form-control" id="department_id">
							<option value="0">Department</option>
							<s:iterator value="alldpm" var='l'>
								<option value='<s:property value="#l.id" />'><s:property
										value="#l.name" /></option>
							</s:iterator>

						</select>
					</div>
					<button id="btn-search" class="btn btn-success">Search</button>
					<button id='btn-clear' class="btn btn-default btn-clear" >Clear</button>
				</div>
			</div>
		</div>
		<h3>Employees</h3>
		<table class="table table-hover table-striped" >
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Department</th>
					<th>Job Title</th>
					<th>Email</th>

					<s:if test="isLogin()">
						<th>Selected</th>
					</s:if>
				</tr>
			</thead>
			<tbody id='table-body'>
				<s:iterator value="allEmployees" var="l">
					<tr>
						<td><s:property value="#l.id" /></td>
						<td><a href="employee?id=<s:property value='#l.id' />"><s:property
									value='#l.name' /></a></td>
						<td><s:property value="#l.departments.name" /></td>
						<td><s:property value="#l.jobTitle" /></td>
						<td><s:property value="#l.email" /></td>
						<s:if test="isLogin()">
							<td><input class='checkDelete' type="checkbox"
								idemp='<s:property value='#l.id'/>'></td>
						</s:if>
					</tr>
				</s:iterator>
			</tbody>

		</table>

		<s:if test='isLogin()'>
			<a href="addEmp" class="btn btn-default">Add Employees</a>
			<button id='deleteEmp' class="btn btn-default" disabled>Delete
				Employees</button>
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
			var logout = $('#logout');
			var urlLogout = G_URL + '/logout';
			logout.click(function() {
				$.getJSON(urlLogout, function(data) {
					if (data.res1 == true) {
						alert("Logout success")
						window.location.replace(G_URL);
					}
				});
			});
		</script>


		<script>
			var checkBox = $('.checkDelete');
			checkBox.change(function() {
				checkBox = $('.checkDelete');
				var n = 0;
				for (var i = 0; i < checkBox.size(); ++i) {
					var tmp = $(checkBox[i]);
					if (tmp.is(':checked')) {
						n++;
					}
				}
				console.log(n);
				if (n > 0) {
					$('#deleteEmp').prop("disabled", false);
					console.log('okok');
				} else {
					$('#deleteEmp').prop("disabled", true);
				}
			});

			$("#deleteEmp").click(function() {
				
				var sure= confirm("Delete all employees selected ?")
				
				if(sure==true){
					checkBox = $('.checkDelete');
					var listToDelete=[];
					for (var i = 0; i < checkBox.size(); ++i) {
						var tmp = $(checkBox[i]);
						if (tmp.is(':checked')) {
							listToDelete.push(tmp.attr('idemp'));
							//console.log(tmp.attr('idemp'));
							
						}
					}
					var strQuery=listToDelete.join();
					console.log(strQuery);
					var formdata=new FormData();
					formdata.append('lst', strQuery);
					$.ajax({
						url:'deleteSomeEmp',
						type: 'POST',
						data: formdata,
						processData : false,
						contentType: false
					}).done(function(data) {
						for (var i = 0; i < checkBox.size(); ++i) {
							var tmp = $(checkBox[i]);
							if (tmp.is(':checked')) {
								tmp.parent().parent().remove();
							}
						}
						console.log(data);
						checkBox=$('.checkDelete');
						
						console.log(checkBox.size());
						$('#deleteEmp').prop("disabled", true);
					});
					
				}
				
				
				/* checkBox = $('.checkDelete');
				var listToDelete=[];
				for (var i = 0; i < checkBox.size(); ++i) {
					var tmp = $(checkBox[i]);
					if (tmp.is(':checked')) {
						listToDelete.push(tmp.attr('idemp'));
						//console.log(tmp.attr('idemp'));
						
					}
				}
				var strQuery=listToDelete.join();
				console.log(strQuery);
				var formdata=new FormData();
				formdata.append('lst', strQuery);
				$.ajax({
					url:'deleteSomeEmp',
					type: 'POST',
					data: formdata,
					processData : false,
					contentType: false
				}).done(function(data) {
					
					for (var i = 0; i < checkBox.size(); ++i) {
						var tmp = $(checkBox[i]);
						if (tmp.is(':checked')) {
							tmp.parent().parent().remove();
						}
					}
					console.log(data);
					checkBox=$('.checkDelete');
					
					console.log(checkBox.size());
					$('#deleteEmp').prop("disabled", true);
				}); */
				
				
			});
		</script>

	</s:if>
	<script>
		$('#btn-search').click(function() {
			$('#table-body').html('');
			$('#deleteEmp').prop("disabled", true);
			var p2, url;
			
			p2='idDpm='+$('#department_id').val();
			
			if($('#name-emp').val()!=''){
				url='queryEmp?'+p2+'&name='+$('#name-emp').val();
				//console.log(url);
			}else{
				url='queryEmp?'+p2;
			}
			
			console.log(url);
			
			
			$.ajax({
				type: 'GET',
				url: url,
				processData : false,
				contentType: false
				
			}).done(function(data) {
				//console.log(data);
				//console.log(data.result.length);
				var arr=data.result;
				var trArr=[];
				for(var i=0; i<arr.length;++i){
					var tr= $('<tr></tr>');
					var tdId=$('<td></td>');
					var tdName=tdId.clone();
					var tdDpm=tdId.clone();
					var tdJobTit=tdId.clone();
					var tdEmail=tdId.clone();
					var tdSelect=tdId.clone();
					
					
					tdId.text(arr[i].id);
					//tdName.text(arr[i].name);
					
					var nameTag=$('<a></a>');
					nameTag.attr('href','employee?id='+arr[i].id );
					nameTag.text(arr[i].name);
					tdName.append(nameTag);
					
					tdDpm.text(arr[i].dpmName);
					tdJobTit.text(arr[i].jobTitle);
					tdEmail.text(arr[i].email);
					
					
					
					var inputS=$('<input/>');
					inputS.attr('type', 'checkbox');
					inputS.addClass('checkDelete');
					inputS.attr('idemp', arr[i].id);
					tdSelect.append(inputS);
					
					
					
					tr.append(tdId);
					tr.append(tdName);
					tr.append(tdDpm);
					tr.append(tdJobTit);
					tr.append(tdEmail);
					tr.append(tdSelect);
					trArr.push(tr);
					
				}
				
				for(var i=0;i<trArr.length;++i){
					$('#table-body').append(trArr[i]);
					/* checkBox = $('.checkDelete');
					checkBox.change(function() {
						checkBox = $('.checkDelete');
						var n = 0;
						for (var i = 0; i < checkBox.size(); ++i) {
							var tmp = $(checkBox[i]);
							if (tmp.is(':checked')) {
								n++;
							}
						}
						console.log(n);
						if (n > 0) {
							$('#deleteEmp').prop("disabled", false);
							console.log('okok');
						} else {
							$('#deleteEmp').prop("disabled", true);
						}
					}); */
				}
				checkBox = $('.checkDelete');
				checkBox.change(function() {
					checkBox = $('.checkDelete');
					var n = 0;
					for (var i = 0; i < checkBox.size(); ++i) {
						var tmp = $(checkBox[i]);
						if (tmp.is(':checked')) {
							n++;
						}
					}
					console.log(n);
					if (n > 0) {
						$('#deleteEmp').prop("disabled", false);
						console.log('okok');
					} else {
						$('#deleteEmp').prop("disabled", true);
					}
				});
				
			});
			
			
		});
	
	</script>

</body>
</html>