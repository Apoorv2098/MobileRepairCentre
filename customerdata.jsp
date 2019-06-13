<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Customer Details</title>
        <script>
function validateForm() {
    
    var x = document.getElementById("customername").value;
    if (x == "") 
    {
        alert("Customer Name must be filled out");
        return false;
    }
     var x = document.getElementById("email").value;
    if (x == "") {
        alert("E-Mail must be filled out");
        return false;}   
     var x = document.getElementById("mobile").value;
        if (x == "") {
        alert("Mobile no. must be filled out");
        return false;}   
     var x = document.getElementById("gender").value;
        if (x == "") {
        alert("Gender must be filled out");
        return false;}      
        
    
}
</script>
<head>
    
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
	<link rel="icon"  href="https://cdn3.iconfinder.com/data/icons/user-icon-3-1/100/user_3_Artboard_1-512.png">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
	<title>User Login</title>

	<style type="text/css">
		.container{
			width: 40%;
			margin: 8% auto;
			background-color: #8C8E9A;
			border-radius: 10px;
			color: white;
			padding: 20px;
		}

		body{
			background-color: #6A6C7A;
		}
		i{
			padding-right: 8px;
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#"> <i class="fas fa-mobile-alt"></i>Mobile Repairing Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    </ul>
  </div>
</nav>

	<div class="container animated fadeIn">
		<h1 class="text-center animated pulse ">User details</h1>
                <form action="customerdata.jsp" method="get" onsubmit="return validatForm()" name="myForm">

		<div class="form-group">
		    <label for="formGroupExampleInput2">Name</label>
                    <input type="text" class="form-control" id="formGroupExampleInput2" placeholder="Name" name="customername">
	  	</div>

		  <div class="form-group">
		    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email">
		  </div>


  <div class="form-group">
    <label for="formGroupExampleInput">Phone number</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Phone number" name="phno">
  </div>
  

  	<div class="radio">
  		<label><input type="radio" name="Gender" value="Male" checked >Male</label>
	</div>
	<div class="radio">
	  	<label><input type="radio" name="Gender" value="Female">Female</label>
	</div>



                    <button type="submit" class="btn btn-secondary" name="submit" value="submit">Submit</button>
</form>

	</div>    <div>
    <% 
    if(request.getParameter("submit")!=null)
            {
                String name=request.getParameter("customername");
                String email=request.getParameter("email");
                int mobile=Integer.parseInt(request.getParameter("phno"));
                String gen=request.getParameter("Gender");
                
                
                
                try{
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/mrsc","root","123456");
                       String sql="insert into customer (CustomerName,Email,Mobile,Gender) values(?,?,?,?)";
                       PreparedStatement ps=con.prepareStatement(sql);
                       ps.setString(1,name);
                       ps.setString(2,email);
                       ps.setInt(3,mobile);
                       ps.setString(4,gen);
                       ps.executeUpdate();
                      
                     con.close();
                       response.sendRedirect("servicemenu.html");

                }
                catch(Exception ex)
                {
                out.println("Error :"+ ex.getMessage());
                }
                }
                %>
    </div>
</body>
</html>