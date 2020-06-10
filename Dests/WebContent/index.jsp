<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Destination Login</title>
 <link href="https://fonts.googleapis.com/css?family=Kaushan+Script&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="css/style.css" rel="stylesheet">
<style type="text/css">
  <style>
    body,
    html {
        height: 100%;
        margin: 0;
    }

    .bg {
         
        background-image: url("image/home.jpeg");

      height:100%;

        /* Center and scale the image nicely */
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
    }
   

.container1 {
    padding: 170px;
      font-family: 'Courgette', cursive;
}

::placeholder { 
    color: #ffffff!important;
    opacity: 1; /* Firefox */
    font-size:18px!important;
}
.form-login {
    background-color: rgba(0,0,0,0.55);
    padding-top: 10px;
    padding-bottom: 20px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 15px;
    border-color:#d2d2d2;
    border-width: 5px;
    color:white;
    box-shadow:0 1px 0 #cfcfcf;
}
.form-control{
    background:transparent!important;
    color:white!important;
    font-size: 18px!important;
  
}
h1{
    color:white!important;
}
h4 { 
 border:0 solid #fff; 
 border-bottom-width:1px;
 padding-bottom:10px;
 text-align: center;
}

.form-control {
    border-radius: 10px;
}
.text-white{
    color: white!important;
}
.wrapper {
    text-align: center;
}
   .error
   {
   color:white;
   }
  span
  {
  color:red;
  font-size:22px;
  }
</style>
</head>
<body>
 
<div class="container-fluid bg" >

<!-- -------------------------------------Login page -->

<div class="container1">
    <div class="row">
        <div class="col-md-offset-5 col-md-4 text-center mx-auto d-block ">
           
            <form action="loginprocess" method="post">
            <div class="form-login">

                <h4>Admin Login</h4>
                <%
        String email=(String)session.getAttribute("email");
        
        //redirect user to home page if already logged in
        if(email!=null){
            response.sendRedirect("ItemController?action=LIST");
        }
 
        String status=request.getParameter("status");
        
        if(status!=null){
        	if(status.equals("false")){
        		   out.print("<span>Incorrect login details!</span>");	           		
        	}
        	else{
        		out.print("<span>Some error occurred!</span>");
        	}
        }
        
        %>
                <input type="text" name="email"  id="email"class="form-control input-sm chat-input" placeholder="username" >

                <input type="password" name="password"  id="password" class="form-control input-sm chat-input mt-3 "
                    placeholder="password" >
                    <a href="emailDisp.jsp"> <p>Forgot password</p></a>
                    <p class="error">
                 
                   </p>

                <div class="wrapper mt-3">
                    <span class="group-btn  ">
                        <button type="submit" class="  btn btn-info shadow-lg p-2 ">Login </button>
       
                       <!-- <input type="button"class="btn btn-primary btn-md" (click)="formLogin()" value="Login">-->
                    </span>
                </div>
            </div>
            
            </form>
        </div>
    </div>
</div>
</div><!-- --------------------main -->

<!----------------footer-------------------------->
<footer class="bg-dark">
    <p class="pt-5 text-white text-center">Copyright ©2020 All rights reserved | Develop & Design By:- by Mohan Singh</p>
    <br>
</footer>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>