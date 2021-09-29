<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
   
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
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
width:590px; 
height:600px; 
 margin:20px; 
padding: 20px; 
color:black;
}

table, th, td {
  border: 3px solid #AEB6BF;
  border-collapse: collapse;
}

th, td {
  padding: 10px;
}



body{
border: 5px sloid darkblue;
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








<div style="float: right; margin-right: 350px;" ><br/><br/>
	<a href="#"><button type="button" onclick="print()" style="background-color:#85C1E9; width:150px; height:40px; font-size: 20px;"><b/>Download</button></a>
	
	</div>
	
	<br/><br/><br/>


<div id="list">
<img style="margin-left:50%;"src="images/logo.jpg" class="logo" height="70px" width="70px">
<h1 style="color:black; margin-left:40%;"><b/>Room Details Report</h1>
<p style="margin-left:20%;">Date&Time:<%=new Date().toString() %></p>
<center>
<table>
<tr>
<th>Room<br/>No</th>
<th>Floor<br/>No</th>
<th>Room<br/>Type</th>
<th>Beds<br/></th>
<th>Max<br/>Adults</th>
<th>Max<br/>Child</th>
<th>Price<br/></th>
<th>Room<br/>Status</th>

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

<script>
function print(){
	var element = document.getElementById("list");
	var opt = {
	  margin:       1,
	  filename:     'RoomListReport.pdf',
	  image:        { type: 'jpeg', quality: 0.98 },
	  html2canvas:  { scale: 2 },
	  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
	};
	 
	// New Promise-based usage:
	html2pdf().from(element).set(opt).save();

	}
</script>

</body>
</html>