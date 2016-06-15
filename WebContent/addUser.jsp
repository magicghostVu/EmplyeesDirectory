<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
    
    <title>Add User</title>
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

                <h3>Add User</h3> <br>
                
                <form id='changePassForm'>
                <table class="table table-bordered">
                	<tr>
                		<td>ID</td>
                		<td><input type="text" class="form-control" name='userName' id='a-username' ></td>
                	</tr>
                	
                    <tr>
                        <td>Email</td>
                        <td><input type="email" class="form-control" name='email' id='a-email' ></td>
                    </tr>
                </table>
                </form>
                
                
                <button id='btn-update' class="btn btn-default" disabled>Add User</button>
                <a href='home' class="btn btn-default">Go Home</a>
                <br><br>
                <p id='message'></p>
            </div>
            
            
        </div>



    </div>
    <script src="js/jquery-2.2.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <script>
    	$('#a-username').keyup(function() {
			if($(this).val()==''){
				$('#btn-update').attr('disabled', true);
			}
		});
    	
    	$('#a-email').keyup(function() {
			if($(this).val()==''){
				$('#btn-update').attr('disabled', true);
				$(this).addClass('alert-danger');
				return;
			}
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			var ok= re.test($(this).val());
			if(ok==true){
				if($('#a-username').val()==''){
					$('#btn-update').attr('disabled', true);
				}else{
					$('#btn-update').attr('disabled', false);
					$(this).removeClass('alert-danger');
				}
			}else{
				$('#btn-update').attr('disabled', true);
				$(this).addClass('alert-danger');
			}
			
		});
    	$("#btn-update").click(function() {
			var fd=new FormData(document.getElementById('changePassForm'));
			
			
			$('#message').html('Adding user...');
			$.ajax({
				data: fd,
				url: 'addUserJS',
				type: "POST",
				processData : false,
				contentType: false
			}).done(function(data) {
				console.log(data.message);
				$('#message').html(data.message);
			});
			
		});
    	
    	
    </script>
    
</body>
</html>