<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	
	<title>Mobile data</title>
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
			margin: 1% auto;
			border-top-left-radius: 20px;
			border-bottom-right-radius: 20px;
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
		<h1 class="text-center" >Mobile data</h1>

                <form method="post" action="servicemobile.jsp" onsubmit="return validatForm()" name="myForm">
  

	
          <div class="form-group">
      <label for="validationCustom03">Email</label>
      <input type="text"  class="form-control"  name="cusname" id="validationCustom03" required>
    </div>
	<div class="form-group">
      <label for="validationCustom02">Mobile Brand</label>
      <input type="text" name="mmake" placeholder="e.g. Samsung, Apple" class="form-control"   required>
    </div>


  <div class="form-group">
      <label for="validationCustom03">Mobile Model</label>
      <input type="text"  class="form-control"  name="mmodel" id="validationCustom03" required>
    </div>

    <div class="form-group">
      <label for="validationCustom04">Problem Statement</label>
      <input type="text" class="form-control"  name="pstatement" id="validationCustom04"  required>
    </div>

    <div class="form-group">
    	<label for="validationCustom05">Submission Date</label>
    	<input required class="form-control" name="subm"  type="date" name="">
    </div>
    <div class="form-group">
      <label for="validationCustom05">Receiving Date</label>
      <input type="number" class="form-control" name="receive" id="validationCustom05"  required>
    </div>

    <div class="form-group">
      <label for="validationCustom05">Charges</label>
      <input type="number" class="form-control" name="charge" id="validationCustom05"  required>
    </div>
     <br>
  <button class="btn btn-secondary" name="service" type="submit">Submit form</button>
  </div>

</form>

        </div>
    <div>
        <%!String paid="no";%>
    <% 
    if(request.getParameter("service")!=null)
            {
                String custid=request.getParameter("custid");
                String mmake=request.getParameter("mmake");
                String mmodel=request.getParameter("mmodel");
                String statement=request.getParameter("pstatement");
                String submission=request.getParameter("subm");
                String rec=request.getParameter("receive");
                String charge=request.getParameter("charge");
                String cusname=request.getParameter("cusname");
                
                try{
               DriverManager.registerDriver(new com.mysql.jdbc.Driver());
               Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3309/mrsc","root","123456");
                       String sql="insert into service (customerID,MobileMake,MobileModel,ProblemStatement,SubmissionDateTime,ReceivingDate,Charges,Returned) values((select customerID from customer where Email=?),?,?,?,?,?,?,?)";
                       
                       PreparedStatement ps=con.prepareStatement(sql);
                        
                       ps.setString(1,cusname);
                       ps.setString(2,mmake);
                       ps.setString(3,mmodel);
                       ps.setString(4,statement);
                       ps.setString(5,submission);
                       ps.setString(6,rec);
                       ps.setString(7,charge);
                       ps.setString(8,paid);
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
    <script type="text/javascript">
        function validateForm() {
            var x = document.getElementById("name").value;
           
            if (x === "") 
    {
               alert("Customer Name must be filled out");
                return false;
          }
        
            var x = document.getElementById("mmob").value;
            if(x=== "")
            { alert("Mobile name must be filled out");
        return false;
    }
    var x = document.getElementById("mmod").value;
            if(x=== "")
            { alert("Mobile model  must be filled out");
        return false;
    }
    var x = document.getElementById("psta").value;
            if(x=== "")
            { alert("Problem Statement  must be filled out");
        return false;
    }
    var x = document.getElementById("pay").value;
            if(x=== "")
            { alert("Enter amount to be paid");
        return false;
    }

        }
       </script>
</body>
</html>