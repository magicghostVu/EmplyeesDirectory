<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<form id="upFile" enctype="multipart/form-data" method="post" onsubmit='return upFile();'>
		<input type="file" name='file'>
		<input type="submit" value='Up'>
	</form>
	
	
	<!-- //<button id='test'>Click here</button> -->
	
	
	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/global_url.js"></script>
	<script>
		/* $('#test').click(function() {
			var fd= new FormData(document.getElementById('upFile'));
			$.ajax({
				url: 'upFile',
				data: fd,
				type: 'POST',
				processData : false,
				contentType : false
			}).done(function(data) {
				console.log(data);
			});
			
		}); */
		function upFile() {
			var fd=new FormData(document.getElementById('upFile'));
			fd.append('id','1');
			$.ajax({
				url: 'upImg',
				type: 'POST',
				data: fd,
				processData : false,
				contentType : false
			}).done(function(data) {
				console.log(data);
				//console.log($(fd).serialize());
			});
			return false;
		}
	
	
	</script>
	
</body>
</html>