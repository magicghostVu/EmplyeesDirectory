<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
        <h2>Department Details</h2>


        <div class="row">
            <div class="col-md-7">
            	<s:if test="isLogin()">
	                <table class="table table-bordered table-striped">
	                    <tr>
	                        <th>Name</th>
	                        <td><input id='dname' class="form-control" type="text" value='<s:property value="department.name" />' ></td>
	                       
	                    </tr>
	                    <tr>
	                        <th>Phone</th>
	                        <td><input id='dphone' type="text" value='<s:property  value ="department.officeNumber" />' class="form-control"></td>
	                    </tr>
	
	                    <tr>
	                        <th>Manager</th>
	                        <td><input id='nameMan' data-provide="typeahead" type="text" value='<s:property  value ="department.employees.name" />' class="form-control"></td>
	                    </tr>
	
	                    <tr>
	                        <th>ID Manager</th>
	                        <td><input id='idMan' class="form-control" type="text" value="<s:property  value ="department.employees.id" />"></td>
	
	                    </tr>
	
	                </table>
                </s:if>
                <s:else>
                	<table class="table table-bordered table-hover table-striped">
	                    <tr>
	                        <th>Name</th>
	                        <td><s:property value="department.name" /></td>
	                       
	                    </tr>
	                    <tr>
	                        <th>Phone</th>
	                        <td><s:property  value ="department.officeNumber" /></td>
	                    </tr>
	
	                    <tr>
	                        <th>Manager</th>
	                        <td><s:property  value ="department.employees.name" /></td>
	                    </tr>
	                    
	                </table>
                </s:else>
                
                
            </div>
        </div>
		<s:if test="isLogin()">
        	<button id='btnUpateDmp' class="btn btn-default" disabled>Update</button>
        	<button id='deleteDpm' class="btn btn-default">Delete Department</button>
		</s:if>

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
	<script src='js/bootstrap3-typeahead.min.js'></script>
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
			var idD=getUrlParameter('id');
			var sourceName={};
			$.getJSON(G_URL+'/allEmpJS', function(data) {
				sourceName= data.all;
			});
			
			$(document).ajaxComplete(function() {
				$('#nameMan').typeahead({
					source: sourceName
				});
				var inputN=$('#nameMan');
				$('#nameMan').keyup(function() {
					if($('#nameMan').val()==''){
						$('#idMan').val('');
						$('#btnUpateDmp').prop('disabled', true);
					}
					var tmp=inputN.typeahead('getActive');
					if(tmp.name==inputN.val()){
						$('#idMan').val(tmp.id);
						$('#idMan').removeClass('alert-danger');
						$('#btnUpateDmp').prop('disabled', false);
					}else{
						$('#idMan').val('');
						$('#btnUpateDmp').prop('disabled', true);
					}
				});
				$('#idMan').keyup(function() {
					var curVal=$('#idMan').val();
					for(var i=0;i<sourceName.length;++i){
		                if(curVal==sourceName[i].id){
		                    inputN.val(sourceName[i].name);
		                    $("#idMan").removeClass("alert-danger");
		                    $('#btnUpateDmp').prop('disabled', false);
		                    return;
		                }
		            }
					$("#idMan").addClass("alert-danger");
					inputN.val('');
					$('#btnUpateDmp').prop('disabled', true);
		            return;
				});
				
			});
			var dname=$('#dname');
			var dphone=$('#dphone');
			dname.keyup(function() {
				if(dname.val()==''){
					dname.addClass('alert-danger');
					$('#btnUpateDmp').prop('disabled', true);
					return ;
				}else{
					dname.removeClass('alert-danger');
					
				}
				$('#btnUpateDmp').prop('disabled', false);
			});
			dphone.keyup(function() {
				if(dphone.val()==''){
					dphone.addClass('alert-danger');
					$('#btnUpateDmp').prop('disabled', true);
					return ;
				}else{
					dphone.removeClass('alert-danger');
					
				}
				$('#btnUpateDmp').prop('disabled', false);
			});
			
			$('#btnUpateDmp').click(function() {
				var p1, p2, p3, p4;
				var url=G_URL+'/updateDpm?';
				p1='id='+idD;
				p2='name='+dname.val();
				p3='officeNumber='+dphone.val();
				p4='idMan='+$('#idMan').val();
				
				url=url+p1+"&"+p2+'&'+p3+"&"+p4;
				$.getJSON(url, function(data) {
					alert(data.result);
				})
				
			});
			$("#deleteDpm").click(function() {
				var t=confirm("Delete department will delete all the employees in this department, you sure ?");
				//alert(t);
				if(t==true){
					var url=G_URL+"/deleteDpmJS?id="+idD;
					$.getJSON(url, function(data) {
						if(data.result==true){
							alert("Deleted");
						}else{
							alert("Somethings went wrong !");
						}
					});
					//alert(url);
				}
				
			});
			
		</script>
					
						
	</s:if>
</body>
</html>