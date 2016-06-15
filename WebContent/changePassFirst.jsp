<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    
    <title>Change Password</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-face.css">
	<style>
		body{
			font-family: miui;
		}
	
	</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-5 col-md-offset-3">

                <h3>Change Password First</h3> <br>
                
                <form id='changePass'>
                <table class="table table-bordered">
                	<tr>
                		<td>ID</td>
                		<td><s:property value="adminF" /></td>
                	</tr>
                    <tr>
                        <td>New password</td>
                        <td><input id='newPass-1' type="password" class="form-control" name='password'></td>
                    </tr>
                    
                    <tr>
                        <td>Confirm new password</td>
                        <td><input id='newPass-2' type="password" class="form-control" name='none'></td>
                    </tr>
                </table>
                </form>
                
                
                <button id='btn-update' class="btn btn-default" disabled>Change Password</button>
                
            </div>
        </div>



    </div>
    <script src="js/jquery-2.2.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    	$('#newPass-1').keyup(function() {
    		$('#newPass-2').val('');
    		$('#btn-update').prop('disabled', true);
			
		});
    	$('#newPass-2').keyup(function() {
			if($(this).val()!=$('#newPass-1').val()){
				$(this).addClass('alert-danger');
				$('#btn-update').prop('disabled', true);
			}else {
				$(this).removeClass('alert-danger');
				$('#newPass-1').removeClass('alert-danger');
				
				$('#btn-update').prop('disabled', false);
			}
		});
    	
    	
    	$('#btn-update').click(function() {
			var fd=new FormData(document.getElementById('changePass'));
			
			//alert($('#changePass').serialize());
			
			
			 $.ajax({
				url: 'changePassFirstJS',
				data: fd,
				type: 'POST',
				processData : false,
				contentType: false
			}).done(function(data) {
				
				
				if(data.result==true){
					alert('Change password successed, login again');
					window.location.href='login';
				}else{
					alert('Somethings went wrong, try login again');
					window.location.href='login';
				}
				/* alert(data.result);
				alert("Login Again");
				window.location.href='login'; */
			}); 
			
		});
    	
    	
    	
    	
    	
    	
    	
    
    </script>
    
</body>
</html>