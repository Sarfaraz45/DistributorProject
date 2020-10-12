<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MUMTAJ</title>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="loginPage/img/favicon.png">
    <link href="loginPage/css/bootstrap.min.css" rel="stylesheet">
    <link href="loginPage/font-awesome/css/font-awesome.css" rel="stylesheet">
     
   
	<link href="loginPage/css/style2.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="loginPage/css/green.css" />
</head>
<body class="double-diagonal dark auth-page">
 <script>
     function Login() {
         var dataToSend = JSON.stringify({ 'LoginID': $('#email').val(), 'password': $('#password').val() });
         //alert(dataToSend);
         //alert("a");
         $.ajax({
             type: "POST",
             url: "Login.aspx/loginUser",
             data: dataToSend,
             dataType: "json",
             contentType: "application/json; charset=utf-8",
             success: function (data) {
                 var jsdata = JSON.parse(data.d);
                 $.each(jsdata, function (key, value) {
                     
                     localStorage.setItem("UserID", value.ID);
                     localStorage.setItem("UserName", value.Name);
                     localStorage.setItem("LoginID", value.Login);
                     localStorage.setItem("Picture", value.Picture);
                     localStorage.setItem("ManagerID", value.Manager);
                     localStorage.setItem("UTID", value.UTID);
                     localStorage.setItem("Designation", value.Designation);
//                     localStorage.setItem("DesignationName", value.DesignationName);
                     localStorage.setItem("UID", value.ID);

                     window.location.replace("HR/Default.aspx");
                 });

             },
             error: function (data) {
                 alert("UserID or Password Incorrect");
                 alert("error found");
             }
         });
     };

    
     
       
        function EnterEvent(e) {
          //  alert("A");
            if (e.keyCode == 13) {
                event.preventDefault();
                //document.getElementById("BtnLogin").click();
                $('#BtnLogin').click();
            }
        }

        </script>
    
       <div class="preloader" id="preloader">
        <div class="logopreloader">
            <img src="loginPage/img/wastenable.png" alt="logo-black">
        </div>
        <div class="loader" id="loader"></div>
    </div>
    
    
    
    <div class="wrapper">
        <div class="container-fluid user-auth">
			<div class="hidden-xs col-sm-7 col-md-7 col-lg-7">
			
				<div id="carousel-testimonials" class="carousel slide carousel-fade" data-ride="carousel">
				
					<ol class="carousel-indicators">
					   
					</ol>
					
					<div class="carousel-inner">
						
						<div class="carousel-item item active item-1">
							<div>
							 
							</div>
						</div>
						
				  
						
					</div>
					
				</div>
				


				
			</div>
		 
			<div class="col-xs-12 col-sm-5 col-md-5 col-lg-5" id="particles-js" >
				
				<a class="visible-xs" href="#">
					<img id="logo-mobile-light" class="img-responsive mobile-logo white-l" src="loginPage/img/wastenable.png" alt="logo">
			
				</a>
				
				<div class="form-container">
					<div style="background-color:#2D4B8B;">
						
					<div class="text-center top-text">
						<h1><span>user</span> login</h1>
						<p>great to have you back!</p>
					</div>
				
						<form class="custom-form">
						
							<div class="form-group">
								<input class="form-control" name="email" id="email" placeholder="USERNAME" type="text" required autocomplete="off"  onkeypress="return EnterEvent(event)" />
							</div>
						
							<div class="form-group">
								<input class="form-control" name="password" id="password" placeholder="PASSWORD" type="password" required autocomplete="off"  onkeypress="return EnterEvent(event)" />
							</div>
							
							<div class="form-group">
					<button class="custom-button login" id="BtnLogin" onclick="Login();" type="button">login</button>
							   <%--<input type="button" name="submit" value="login" class="custom-button login"  id="BtnLogin" onclick="Login();" />--%>
								<p class="text-center">Forgot Password ? <a href="#">Click here</a>
							</div>
							
						</form>
						
					</div>
				</div>
				
				<p class="text-center copyright-text">Copyright © 2020 AQM Solutions All Rights Reserved</p>
				
			</div>
		</div>
    </div>
  
    
   
    
    
    <script src="loginPage/js/jquery-3.1.1.min.js"></script>
	<script src="loginPage/js/jquery.easing.js"></script>

    <script src="loginPage/js/bootstrap.min.js"></script>

	<script src="loginPage/js/custom.js"></script>
	<script src="loginPage/js/particles-js.js"></script>
</body>
</html>
