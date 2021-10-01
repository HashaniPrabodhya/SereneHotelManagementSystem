<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/hotel?autoReconnect=true&useSSL=false";

String userid = "root";
String password = "root123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >

/*header*/
.header {
  overflow: hidden;
  background-color: #32315c;
  padding: 10px 10px; <!--30px 10px; -->
}
/*hyperlinks of the header*/
.header a {
  float: left;
  color: white;
  text-align: center;
  padding: 15px;
  text-decoration: none;
  font-size: 18px; 
  line-height: 30px;
  border-radius: 6px;
}
/*hovering effects in header*/
.header a:hover {
  background-color: #847979;
  color: white;
}
/*2 options on the right side of the header*/
.header__right {
  float: right;
  font-family:helvetica;
  background-color:#018383;
  border-radius:6px;
  border:2px;
}
/*current page detecting from header right*/
.header__right a.active {
	background-color: black;
	color: white;
}
/*top navigation bar*/
.topnav {
  overflow:hidden;
  background-color: #018383;
}
/*top navigation bar options(links)*/
.topnav a {
  float: left;
  display: block;
  color: white;
  text-align: center;
  padding: 20px 30px;
  text-decoration: none;
  font-size: 16px;
  font-family:century gothic;
}
/*top navigation bar hovering effect*/
.topnav a:hover {
  background-color:  529B7B;
  color: white;
}
/*current page detecting from navigation bar*/
.topnav a.active {
  background-color: black;
  color: white;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}
/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}
.active {
  background-color: #717171;
}
/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

.container {
	position: relative;
	text-align: center;
	color: white;
	
}

.centered{
		position:absolute;
		top:50%;
		left:50%;
		color:white;
		font-size:60px;	
		transform: translate(-50%, -50%);
	
	}
	
.bottom-left{
	position:absolute;
	bottom:100px;
	left:16px;
	font-size:20px;
	
}
.bottom-center{
	position:absolute;
	bottom:100px;
	left:650px;
	font-size:20px;
}
.bottom-right{
	position:absolute;
	bottom:100px;
	right:16px;
	font-size:20px;
}
h1{
	font-family:century gothic;
	
}
p{
	font-family:century gothic;
	font-style:italic;
	text-align:left;
}

<!--styles for table-->
h1{
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:300px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 12px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}


</style>
	<script src="https://kit.fontawesome.com/85c9cbf9ed.js" crossorigin="anonymous"></script>
</style>
</head>
<body>
	<header>
<div class="header">
<a href="#home">
  <img src="Images/imgLogo.jpg" class="logo" height="180px" width="200px">
</a><br>
	<font size="16" style="font-family:century gothic;:" color="white" align="center"> Serene<b> Hotels </b> </font>
  <div class="header__right">
    
    <a href="#signin">Sign in</a>
    <a href="#login">Login</a>
  </div>
</div>
</header>
<div class="topnav">
  <a href="home.jsp">Home</a>
  <a href="AddBooking.jsp">Rooms</a>
  <a href="#hall">Banquet Hall</a>
  <a href="contactUs.jsp">Contact Us</a>



<!-- 

     <form name="report" action="generatePDF" method="post">
	<input type="submit" value="generatePDF" name="pdf">
	 </form>   
 -->




<div>
	
</div>

<br/><br/><br/>
<h1>Your Bookings</h1>
<form name="report" action="generatePDF" method="post">
	<input type="submit" value="Download PDF" name="pdf">
	 </form>  
 <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Booking Number</th>
          <th>Customer Name</th>
          <th>Accommodation<br/>Type</th>
          <th>Check-In Date</th>
          <th>Check-Out Date</th>
          <th>Number Of<br/>Nights</th>
          <th>Number Of<br/>Adults</th>
          <th>Number Of<br/>Children</th>
          <th>Contact Number</th>
          <th>User Name</th>
          <th>Actions</th>
        </tr>
      </thead>
    </table>
  </div>
<!-- 
<table border="1"  style="background-color:#8C98C1; color:white;" >
<tr>
<td>Booking<br/>Number</td>
<td>Customer<br/>Name</td>
<td>Accommodation<br/>Type</td>
<td>From</td>
<td>To</td>
<td>Number Of<br/>Nights</td>
<td>Number Of<br/>Adults</td>
<td>Number Of<br/>Children</td>
<td>phone</td>
<td>User Name</td>
<td><tab><tab>Actions</td>
</tr>
 -->
 <div class="tbl-content">
<table cellpadding="0" cellspacing="0" border="0">
  <tbody>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String sql =" select * from booking ";
resultSet = statement.executeQuery(sql);
int i=0;

while(resultSet.next()){
%>

<tr>
 <td><%=resultSet.getInt("bookingId") %></td>
<td><%=resultSet.getString("customerName") %></td>
<td><%=resultSet.getString("accomodationType") %></td>
<td><%=resultSet.getString("fromDate") %></td>
<td><%=resultSet.getString("toDate") %></td>
<td><%=resultSet.getString("noNights") %>
<td><%=resultSet.getString("noAdults") %>
<td><%=resultSet.getString("noChildren") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("userName") %></td>
<td><a href="updateBooking.jsp?bookingId=<%=resultSet.getInt("bookingId") %>"><button type="button" class="update" style="background-color:#1AAB1A;"><b>Edit</b></button></a>&nbsp;&nbsp;
<a href="DeleteBooking.jsp?bookingId=<%=resultSet.getInt("bookingId") %>"><button type="button" class="delete" style="background-color:#ED4C39;"><b>Delete</b></button></a></td>
</tr>

     
<%
i++;
}
connection.close();
}catch(Exception e){
	e.printStackTrace();

}
%>
</tbody>
 
</table>

</body>
</html>