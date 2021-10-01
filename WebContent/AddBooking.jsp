<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
//initializing variables
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
<style >
body{
	background-color:#32315c;
}
* {
  box-sizing: border-box;
}

input[type=text], select, textarea,input[type=date] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;

  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
<!-- ends form css-->
* {box-sizing: border-box;}
ul {list-style-type: none;}
body {font-family: Verdana, sans-serif;}

.month {
  padding: 70px 25px;
  width: 100%;
  background: #1abc9c;
  text-align: center;
}

.month ul {
  margin: 0;
  padding: 0;
}

.month ul li {
  color: white;
  font-size: 20px;
  text-transform: uppercase;
  letter-spacing: 3px;
}

.month .prev {
  float: left;
  padding-top: 10px;
}

.month .next {
  float: right;
  padding-top: 10px;
}

.weekdays {
  margin: 0;
  padding: 10px 0;
  background-color: #ddd;
}

.weekdays li {
  display: inline-block;
  width: 13.6%;
  color: #666;
  text-align: center;
}

.days {
  padding: 10px 0;
  background: #eee;
  margin: 0;
}

.days li {
  list-style-type: none;
  display: inline-block;
  width: 13.6%;
  text-align: center;
  margin-bottom: 5px;
  font-size:12px;
  color: #777;
}

.days li .active {
  padding: 5px;
  background: #1abc9c;
  color: white !important
}

/* Add media queries for smaller screens */
@media screen and (max-width:720px) {
  .weekdays li, .days li {width: 13.1%;}
}

@media screen and (max-width: 420px) {
  .weekdays li, .days li {width: 12.5%;}
  .days li .active {padding: 2px;}
}

@media screen and (max-width: 290px) {
  .weekdays li, .days li {width: 12.2%;}
}
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

</style>
	<script src="https://kit.fontawesome.com/85c9cbf9ed.js" crossorigin="anonymous"></script>
</style>
</head>
<body >

	<header>
<div class="header">
<a href="home.jsp">
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
  <a href="UserAddBanquet.jsp">Banquet Hall</a>
  <a href="contactUs.jsp">Contact Us</a>

</div>

<br><br><br>
<form action="" method="post">
	<input type ="text" name="q" placeholder="Search.."/>
</form>
<div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Room Name</th>
          <th>Room Type</th>
          <th>Availability</th>
          <th>Price</th>
         
        </tr>
      </thead>
    </table>
  </div>
 
<div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
	<tbody>

<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String searchQuery=request.getParameter("q");
String sql;//=" select * from rooms ";
if(searchQuery !=null){
	sql=" select * from rooms where roomType like '%"+searchQuery+"%'or price like'%"+searchQuery+"%' or availibilty like '%"+searchQuery+"%'";
}else{
	sql="  ";
}
resultSet = statement.executeQuery(sql);
int i=0;




while(resultSet.next()){
%>
      
    
<tr>
 <td><%=resultSet.getString("roomName") %></td>
<td><%=resultSet.getString("roomType") %></td>
<td><%=resultSet.getString("availibilty") %></td>
<td><%=resultSet.getString("price") %></td>

<%
i++;
}
connection.close();
}catch(Exception e){
	e.printStackTrace();

}
%>
</tr>
</tbody>
</table>

</div>
<br><br>

		<h1 style="color:white;">Add Your Booking</h1>	
			
			<div class="container">
  <form action="BookingInsertServlet" method="post" >
  <div class="row">
    <div class="col-25">
      <label for="customerName">Customer Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="customerName" name="customerName" placeholder="Your name.."required >
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="accomodationType">Accommodation Type</label>
    </div>
    <div class="col-75">
      <select id="accomodationType" name="accomodationType">
        <option value="">Select  Type</option>
												<option value="Luxury Room">Luxury Room</option>
												<option value="Single Room">Single Room</option>
												<option value="Family Room">Family Room</option>
												<option value="Duluxe Room">Deluxe Room</option>
      </select>
    </div>
  </div>
  
  <div class="row">
    <div class="col-25">
      <label for="from">Check-In Date</label>
    </div>
    <div class="col-75">
      <input type="date" id="fromDate" name="fromDate" placeholder="MM/DD/YYY"required >
    </div>
  </div>
   <div class="row">
    <div class="col-25">
      <label for="to">Check-Out Date</label>
    </div>
    <div class="col-75">
      <input type="date" id="toDate" name="toDate" placeholder="MM/DD/YYY"required >
    </div>
  </div>
  
     <div class="row">
    <div class="col-25">
      <label for="noNights">Number Of Nights</label>
    </div>
    <div class="col-75">
      <input type="text" id="noNights" name="noNights" placeholder="Enter Number Of nights"required maxlength="14" minlength="1">
    </div>
  </div>
  
    <div class="row">
    <div class="col-25">
      <label for="noAdults">Number Of Adults</label>
    </div>
    <div class="col-75">
      <input type="text" id="noAdults" name="noAdults" placeholder="Enter Number Of Adults"required minlength="1">
    </div>
  </div>
  
  
    <div class="row">
    <div class="col-25">
      <label for="noChildren">Number Of Children</label>
    </div>
    <div class="col-75">
      <input type="text" id="noChildren" name="noChildren" placeholder="Enter Number Of Children" required >
    </div>
  </div>
  
    <div class="row">
    <div class="col-25">
      <label for="phone">Contact Number</label>
    </div>
    <div class="col-75">
      <input type="text" id="phone" name="phone" placeholder="Enter Contact Number" required minlength="10" maxlength="10">
    </div>
  </div>
  
  
    <div class="row">
    <div class="col-25">
      <label for="userName">User Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="userName" name="userName" placeholder="Enter User Name" required minlength="6" >
    </div>
  </div>
  <div class="row">
    <input type="submit" name="submit" value="Create Booking">
  </div>
  </form>
</div>
				

	
</body>
</html>