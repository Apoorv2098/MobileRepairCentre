<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
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
  <a class="navbar-brand" href="#"> <i class="fas fa-mobile-alt"></i>Validation Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    </ul>
  </div>
</nav>

	<div class="container animated fadeIn">
		<h1 class="text-center animated pulse ">User Login</h1>
                <form action="validate.jsp" method="get">

		


  <div class="form-group">
    <label for="formGroupExampleInput">Phone number</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Phone number" name="phno">
  </div>
  

+



                    <button type="submit" class="btn btn-secondary" name="submit" value="submit">Submit</button>
</form>

	</div>
    
    <div>
    <% 
    if(request.getParameter("submit")!=null)
            {
                int number=Integer.parseInt(request.getParameter("phno"));
                
                try{
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/mrsc","root","123456");
                       String sql="select * from customer where  Mobile=?";
                       PreparedStatement ps=con.prepareStatement(sql);
                        
                        ps.setInt(1,number);
                       ResultSet rs=ps.executeQuery();
                      
                       if(rs.next()!=false)
                       {
                           response.sendRedirect("servicemenu.html");
                       }
                       else response.sendRedirect("customerdata.jsp");
                       con.close();
                       

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