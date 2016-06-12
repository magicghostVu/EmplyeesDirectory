


<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Login</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

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
        <div class="col-md-4 col-md-offset-4">
            <h2 class="text-center">Login page</h2>
            <!-- <form action=""> -->
                <div class="form-group">
                    <label class="control-label" for="">User name</label>
                    <input id="username" type="text" class="form-control">

                </div>
                <div class="form-group">
                    <label class="control-label" for="">Password</label>
                    <input id="password" type="password" class="form-control">


                </div>

				<br>
                <button id='btn-login' class="btn btn-success form-control" >Login</button>
                <br>
                <br>
				<p id='message'></p>

            <!-- </form> -->



        </div>

    </div>



</div>


















	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="js/jquery-2.2.0.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<script src='js/global_url.js'></script>
	<script type="text/javascript">
	
		function login(){
			var userName=$('#username').val();
			var passWord=$('#password').val();
			
			
			//alert(userName+" "+passWord+" "+G_URL);
			var p1='userName='+userName;
			var p2='passWord='+passWord;
			var action='/loginAction';
			var url=G_URL+action+'?'+p1+'&'+p2;
			$.getJSON(url, function(data){
				if(data.result==true){
					//alert("Login succsess");
					window.location.replace(G_URL);
				}else{
					$('#message').html('Incorect username or password');
				}
			});
		}
		
		$('#btn-login').click(function(){
			login();
		});
		
		
	
	</script>
	
	
</body>
</html>