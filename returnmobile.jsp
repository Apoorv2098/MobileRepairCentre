<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Confirm Receive</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.min.css">
	<link rel="icon" href="https://cdn4.iconfinder.com/data/icons/simple-device/300/flat-iphone-512.png">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

	<style type="text/css">
	i{
			padding-right: 8px;
		}
		
		body{
			color: white;
			background-color: #6A6C7A;
		}
		.container{
			width: 40%;
			background-color: #8C8E9A;
			padding: 3%;
			margin: 10% auto;
			border-radius: 10px;
		}
	</style>
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

	<div class="container animated pulse">
		<h1 class="text-center" >Confirm Receive</h1>

		<form method="post" action="returnmobile.jsp">
			
			<div class="form-group" >
				<label>Email</label>
				<input type="text"  class="form-control" name="email">
			</div>

			<div class="form-group" >
				<label>Receiving Date</label>
				<input type="Date" class="form-control" name="receive">
			</div>

			<button class="btn btn-secondary" name="receive" type="submit">Confirm</button>


		</form>
		
	</div>
    <div>
        <%!String paid="yes";%>
    <% 
    if(request.getParameter("receive")!=null)
            {
                 String cusname=request.getParameter("email");
                 String rec=request.getParameter("receive");
                
                
                try{
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/mrsc","root","123456");
                       String sql="update service set Returned=? where ReceivingDate=? and customerID=(select customerID from customer where Email=?)";
                       PreparedStatement ps=con.prepareStatement(sql);
                       ps.setString(1,paid);
                       ps.setString(2,rec);
                       ps.setString(3,cusname);
                       ps.executeUpdate();
                       con.close();
                       response.sendRedirect("index.html");

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