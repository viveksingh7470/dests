<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>The inventory System</title>
    
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css"/>
<!-- Material Design Bootstrap -->
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/css/mdb.min.css" rel="stylesheet">
<link href="css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="css/style.css" rel="stylesheet">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
 <style>
    body,
    html {
        height: 100%;
        margin: 0;
    }  
    .tab
    {
    	
    	margin-top: 10%;
    }
</style>
</head>
<body>
<div class="container-fluid bg" >
    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg">
        
    
            <!-- Brand -->
            <a class="navbar-brand" href="index.html" target="_blank">
                <img src="image/destination-logo.jpg" class="img-fluid text-white" style="width: 183px; height: 60px;">
               
            </a>
    
          <!-- Collapsible content -->
  <div class="collapse navbar-collapse" id="basicExampleNav">

    <!-- Links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" onclick="window.location.href = 'views/item-form.jsp'">Add Item</a>
      </li>
      <li class="nav-item">
        <a class="nav-link text-dark" href="${pageContext.request.contextPath}/logout.jsp">Logout</a>
      </li>
    </ul>
    <!-- Links -->
          
          
    
        </div>
    </nav>
    
    <!-- Navbar -->



<%
        String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
        	response.sendRedirect("index.jsp");
        }
    %>

<div class="container tab">
<p>${NOTIFICATION}</p>
<div class="card">
 <div class="card-header text-center h2">Items Details</div>
  <div class="card-body">
	<table class="table table-striped" id="datatable">
		<thead>
			<tr>
			
			<th>Room</th>
			<th>ItemName</th>
			<th>Serial No</th>
			<th>Action</th>
		</tr>
		</thead>
			<tbody>
				<c:forEach items="${list}" var="item">
			
				<tr>
					<td>${item.room}</td>
					<td>${item.itemName}</td>
					<td>${item.serialNo}</td>
					<td> 
						<a class="btn btn-default badge-pill pl-5 pr-5 waves-effect z-depth-0" href = "${pageContext.request.contextPath}/ItemController?action=EDIT&id=${item.id}">Edit</a> 
						 
						<a  class="btn btn-unique badge-pill pl-5 pr-5 waves-effect z-depth-0" href = "${pageContext.request.contextPath}/ItemController?action=DELETE&id=${item.id}">Delete</a> 
					</td>
					
				</tr>
				
			</c:forEach>
			</tbody>
	</table>
	</div><!-- -----------------body card---------------- -->
	</div><!-- ----------------main card-------------- -->
	</div>
	</div>
	 <footer class="card mt-5 fixed-bottom">
            <p class="pt-5 text-dark text-center mt-4">Copyright ©2020 All rights reserved | Develop & Design By:- by Mohan Singh</p>
    </footer>
	<!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.0/js/mdb.min.js"></script>

<script type="text/javascript" src="js/mdb.min.js"></script>

	

<script>
	$(document).ready(function(){
		$("#datatable").DataTable();
	})
</script>

</body>
</html>