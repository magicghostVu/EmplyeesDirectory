<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bs3_sticky-footer.css">
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 	<title>Admin Man</title>
 	<link rel="stylesheet" href="css/font-face.css">
 	<style>
	/* custom font */
		body{
			font-family: miui;
		}
	</style>
</head>
<body>
	<div class="container">
        <!-- navbar start -->
	
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
					<li class='active'><a href="home">Department</a></li>
					<li><a href="employees">Employees</a></li>
					
					<s:if test="!isLogin()">
						<li><a href="login">Log in</a></li>
					</s:if>
				</ul>
			</div>


		</nav>
	<!-- navbar end -->
		<br>

        <h3>Admin Manager</h3>
        <div class='table-responsive'>
        <table class="table table-hover table-striped">
            <thead>
                <tr>

                    <th>Username</th>
                    <th>Is Owner</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <!-- <tr>
                    <td>magicghost.vu</td>
                    <td><input type="checkbox" checked ></td>
                    <td><input type="button" class="btn btn-default" value="Delete"></td>
                </tr>

                <tr>
                    <td>magicghost.jksjfgndl</td>
                    <td><input type="checkbox" disabled></td>
                    <td><input type="button" class="btn btn-default"  value="Delete"></td>
                </tr>
                <tr>
                    <td>magicghost.vu</td>
                    <td><input type="checkbox"></td>
                    <td><input type="button" class="btn btn-default" value="Delete"></td>
                </tr> -->
                
                
                <s:iterator var='l' value="allAd">
					<tr>
	                    <td><s:property value="#l.userName" /></td>
	                    <td>
	                    	<s:if test='#l.getOwner()'>
	                    		<input type="checkbox" checked class='change-own'>
	                    	</s:if>
	                    	<s:else>
	                    		<input type="checkbox" class='change-own'>
	                    	</s:else>
	                    </td>
	                    <td><input type="button" class="btn btn-default deleteAdmin"  value="Delete" idman='<s:property value='#l.getUserName()' />' ></td>
                	</tr>
				</s:iterator>

            </tbody>

        </table>
		</div>
        <p id='message'></p>
		<a href ='addUser' class='btn btn-default'>Add Admin</a>

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
		<script>
			$('.deleteAdmin').click(function() {
				console.log($(this).attr('idman'));
				var tmpbtn=$(this);
				var idMan=$(this).attr('idman');
				var url_='deleteAdminJS?userName='+idMan;
				$.ajax({
					url: url_,
					type: 'POST',
				}).done(function(data) {
					alert(data.message);
					if(data.result==true){
						var tr=tmpbtn.parent().parent();
						tr.remove();
					}
				});
				
				
			});
			
			$('.change-own').change(function() {
				var tmp=$(this);
				
				var buttonDelete= $(this).parent().next().children().get(0);
				console.log($(buttonDelete).attr('idman'));
				var p1='userName='+$(buttonDelete).attr('idman');
				
				
				$('.change-own').attr('disabled', true);
				
				
				if($(this).is(':checked')){
					var p2='data='+'1';
					
					var url_='changeOwn?'+p1+'&'+p2;
					//alert(url_);
					
					$.ajax({
						url:'changeOwn?'+p1+'&'+p2,
						type:'POST'
					}).done(function(data) {
						$('.change-own').attr('disabled', false);
						alert(data.message);
					});
					
					//console.log('checked');
				}else{
					var p2='data='+'0';
					var url_='changeOwn?'+p1+'&'+p2;
					//alert(url_);
					//console.log('unchecked');
					
					$.ajax({
						url:'changeOwn?'+p1+'&'+p2,
						type:'POST'
					}).done(function(data) {
						$('.change-own').attr('disabled', false);
						if(data.message=='You can\'t unown yourself'){
							tmp.prop('checked', true);
						}
						alert(data.message);
					});
				}
			});
		
		</script>				
	</s:if>
	
</body>
</html>