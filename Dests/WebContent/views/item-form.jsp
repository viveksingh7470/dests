<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/css/mdb.min.css" rel="stylesheet">
</head>
<body>
<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark ">

 
            <!-- Brand -->
            <a class="navbar-brand"  target="_blank">
                <img src="image/destination-logo.jpeg" class="img-fluid text-white" style="width: 183px; height: 60px;">
               
            </a>

  <!-- Collapse button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#basicExampleNav"
    aria-controls="basicExampleNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Collapsible content -->
  <div class="collapse navbar-collapse" id="basicExampleNav">

     <!-- Links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" onclick="window.location.href = 'views/item-form.jsp'">Add Item</a>
      </li>
       <li class="nav-item">
        <a class="nav-link text-dark" href = "${pageContext.request.contextPath}/ItemController?action=LIST">Back to List</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
      </li>
    </ul>
  </div>
  <!-- Collapsible content -->

</nav>
 
<!--/.Navbar-->
	<%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
        	response.sendRedirect("index.jsp");
        }
    %>
	<div class = "container mt-5">
	
		
		<div class = "row mt-3">
			<div class = "col-md-6 mx-auto">
				<!-- Material form login -->
<div class="card">

  <h5 class="card-header  dark-text text-center py-4">
    <strong>Insert Item</strong>
  </h5>

  <!--Card content-->
  <div class="card-body px-lg-5 pt-0">

    <!-- Form -->
    <form class="text-center" style="color: #757575;" action = "${pageContext.request.contextPath}/ItemController" method="POST">

      <!-- Room -->
      <div class="md-form">
        <input type="text" id="materialLoginFormRoom" name="room" class="form-control" required value = "${item.room}"/>
        <label for="materialLoginFormRoom">Enter your Room Name</label>
      </div>

      <!-- itemName -->
      <div class="md-form">
        <input type="text" id="materialLoginFormItemName" name="itemName" class="form-control" required value = "${item.itemName}"/>
        <label for="materialLoginFormItemName">Enter your itemName</label>
      </div>
       <!-- SerialNo -->
      <div class="md-form">
        <input type="text" id="materialLoginFormSerialNo" name="serialNo" class="form-control" required value = "${item.serialNo}"/>
        <label for="materialLoginFormSerialNo">Enter your SerialNo</label>
      </div>
		<input type = "hidden" name = "id" value = "${item.id}"/>
      <div class="d-flex justify-content-around">
      </div>

      <!-- Sign in button -->
      <button onclick="mass()" class="btn btn-default badge-pill btn-block my-4 waves-effect z-depth-0" type="submit">Insert</button>
      
    </form>
    <!-- Form -->

  </div>

</div>
<!-- Material form login -->
			</div>
	</div>
	</div>	
	<img src="image/destination-logo.jpeg">
    <!-- Navbar -->
   <footer class="card mt-5">
        
    
            <p class="pt-5 text-dark text-center mt-4">Copyright ©2020 All rights reserved | Develop & Design By:- by Mohan Singh</p>
 
    
    </footer>
	<!-- JQuery -->
	
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>

	

</script>
</body>
</html>