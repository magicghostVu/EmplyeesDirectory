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
	<!-- <form action="upFile" method="get" enctype="multipart/form-data">
		<input type="file" id='idFile'/>
		<input type='submit' value="Upload">
	</form> -->
	
	
	<s:form action="upFile" method="POST" enctype="multipart/form-data" >
		<s:file name="file" label="Select a File to upload" size="40" />
		
		<s:submit value="submit"/>
	
	</s:form>
	
	<button id='test'>Click here</button>
	
	
	<script src="js/jquery-2.2.0.min.js"></script>
	<script src="js/global_url.js"></script>
	<script>
		$('#upFile_file').change(function() {
			console.log($(this).val());
		});
		
		$('#test').click(function() {
			var url=G_URL+'/upFile?file='+$('#upFile_file').val();
			$.post(url, function(data) {
				alert(data.result);
			});
		});
		
	
	
	</script>
	
</body>
</html>