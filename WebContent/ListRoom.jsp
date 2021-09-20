<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "serene_beach_hotel";
String userid = "root";
String password = "dbHash96";
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
<title>RoomList</title>

<style>



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
  background-color: #529B7B;
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
  color: #B7950B;
  text-align: center;
  padding: 20px 30px;
  text-decoration: none;
  font-size: 24px;
  font-family:century gothic;
}
/*top navigation bar hovering effect*/
.topnav a:hover {
  background-color:  #529B7B;
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

table{

background-color:#EAEDED; 
text-align:center; 
width:1000px; 
height:300px; 
 margin:20px; 
padding: 20px; 
color:black;
}


input[type=submit]{
	width:75%;
	padding:5px;
	align: center;
	font-weight: bold;
}


table, th, td {
  border: 3px solid #AEB6BF;
  border-collapse: collapse;
}

th, td {
  padding: 10px;
}


body{
border: 5px sloid darkBlue;
background-color:#34495E; /*#5D6D7E*/
}

</style>
	<script src="https://kit.fontawesome.com/85c9cbf9ed.js" crossorigin="anonymous"></script>
</head>
<body>

<header>
<div class="header">
<a href="#home">
  <img src="images/logo.jpg" class="logo" height="100px" width="100px">
</a><br>
	<font size="16" style="font-family:century gothic;:" color="#B7950B " align="center"><b> Serene Hotels Admin</b> </font>
  <div class="header__right">
    
   <a href="#logout"><text style= "color:#B7950B;
  size:24px;"><b/>Logout</a></text>
  </div>
</div>
</header>

<div class="topnav">
  <a href="#home"><b/>Home</a>
  <a href="ListRoom.jsp"><b/>Rooms</a>
  <a href="#hall"><b/>Banquet Hall</a>
  <a href="#staff"><b/>Staff</a>
  
  
</div>










<center>
<div>
<h1 style="color:#AEB6BF;"><b/>Room Management</h1><br/>
<div>
<div style="float: left; margin-left:260px;">
	<a href="AddRoom.jsp"><button type="button" style="background-color:#85C1E9; width:150px; height:40px; font-size: 20px;"><b/>Add Room</button></a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="RoomReport.jsp"><button type="button" style="background-color:#85C1E9; width:150px; height:40px; font-size: 20px;"><b/>Get Report</button></a>
</div>&nbsp;&nbsp;&nbsp;
<div style="float: right; margin-right:260px;">
	<form>
		<input type="text" name="roomNo" placeholder="Enter Room No" style="width:150px; height:35px; font-size: 20px;"/>&nbsp;&nbsp;&nbsp;<input type="submit" value="Search" style="background-color:#85C1E9; width:150px; height:40px; font-size: 20px;"/>
	</form>
</div>
</div>
<br/><br/>
<table>
<tr>
<th><b/>Room<br/><b/>No</th>
<th><b/>Floor<br/>No</th>
<th>Room<br/>Type<b/></th>
<th><b/>Beds<br/><b/></th>
<th><b/>Max<br/><b/>Adults</th>
<th><b/>Max<br/><b/>Child</th>
<th><b/>Price<br/><b/></th>
<th><b/>Room<br/><b/>Status</th>
<th><tab><tab><b/>Actions</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from rooms";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("roomNo") %></td>
<td><%=resultSet.getInt("floorNo") %></td>
<td><%=resultSet.getString("roomType") %></td>
<td><%=resultSet.getInt("beds") %></td>
<td><%=resultSet.getInt("maxAdults") %></td>
<td><%=resultSet.getInt("maxChild") %></td>
<td><%=resultSet.getDouble("price") %></td>
<td><%=resultSet.getString("roomStatus") %></td>
<td><a href="EditRoom.jsp?roomNo=<%=resultSet.getString("roomNo") %>"><button type="button" class="update" style="background-color:#1AAB1A; width:60px;"><b>Edit</b></button></a>&nbsp;&nbsp;
<a href="DeleteRoom.jsp?roomNo=<%=resultSet.getString("roomNo") %>"><button type="button" class="delete" style="background-color:#ED4C39;  width:60px;"><b>Delete</b></button></a></td>
</tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</div>
</body>
</html>