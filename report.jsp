<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3309/";
String dbName = "mrsc";
String userId = "root";
String password = "123456";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%> <head>
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
        </style></head>
 <body>
       
<%!String s="no";
String p="yes";%>
<h1 align="center"><font><strong>Company Report</strong></font></h1>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT count(*) FROM customer";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


Total Customers are :<%=resultSet.getString(1) %>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<br>
<%
  
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
String sql ="SELECT count(*) FROM service";
statement=connection.createStatement();

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


Total Mobiles for repair are :<%=resultSet.getString(1) %>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<br>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);

String sql ="SELECT count(*) FROM service where Returned='no'";
PreparedStatement ps=connection.prepareStatement(sql);
resultSet = ps.executeQuery(sql);
if(resultSet.next())
{
%>


Total Mobiles pending for repair are :<%=resultSet.getString(1)%>

<% 
}

} catch (Exception e) {
out.println("Error:"+e);
e.printStackTrace();
}
%>
<br>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);

String sql ="SELECT count(*) FROM service where Returned='yes'";
PreparedStatement ps=connection.prepareStatement(sql);
resultSet = ps.executeQuery(sql);
while(resultSet.next()){
%>


Total mobiles repaired and given to customers are :<%=resultSet.getString(1) %>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<br>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);

String sql ="SELECT sum(charge) FROM service where Returned='yes'";
PreparedStatement ps=connection.prepareStatement(sql);

resultSet = ps.executeQuery(sql);
while(resultSet.next()){
%>


Total amount collected till now :<%=resultSet.getString(1) %>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
<br>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);

String sql ="SELECT sum(charge) FROM service where Returned='no'";
PreparedStatement ps=connection.prepareStatement(sql);

resultSet = ps.executeQuery(sql);
while(resultSet.next()){
%>


Total amount to be collected from pending customers :<%=resultSet.getString(1) %>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>

<a href="index.html"><input type="button" value="return"></a></div></body>