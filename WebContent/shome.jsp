<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "staff_managment";
String userid = "root";
String password = "jami1998";
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">


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


/*background image*/
body, html {
  height: 100%;
  margin: 0;
}

.bg {
  /* The image used */
  background-image: url("images/admin_home_image.jpg");

  /* Full height */
  height: 100%; 

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}


</style>

<script src="https://kit.fontawesome.com/85c9cbf9ed.js" crossorigin="anonymous"></script>
<style>

.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #2196F3;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 450px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 900px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 50px;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}
</style>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

table, th, td{
  border:1px solid white;
  background-color : #8C98C1;
}

table{
  width:50%;
  margin:0% 25%;
}
 form{
  
  margin:0% 35%;
}

th, td{
  padding:5px;
  text-align:center;
}

.but {
  position: relative;
  background-color: #4CAF50;
  border: none;
  font-size: 15px;
  color: #FFFFFF;
  padding: 20px;
  width: 100px;
  text-align: center;
  transition-duration: 0.4s;
  text-decoration: none;
  overflow: hidden;
  cursor: pointer;
}

.but:after {
  content: "";
  background: #f1f1f1;
  display: block;
  position: absolute;
  padding-top: 300%;
  padding-left: 350%;
  margin-left: -20px !important;
  margin-top: -120%;
  opacity: 0;
  transition: all 0.8s
}

.but:active:after {
  padding: 0;
  margin: 0;
  opacity: 1;
  transition: 0s
}
</style>
</head>
<body style="background-color:#0D1E52;">

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
  <a href="#"><b/>Rooms</a>
  <a href="#hall"><b/>Banquet Hall</a>
  <a href="shome.jsp"><b/>Staff</a>
  
  
</div>

<center><h1 style="color:white;"><b>Staff Managment</b></h1></center>
<br/><br/><br/>

<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <a href="register.jsp"> +  Add Staff</a>
  <a href="attendance.jsp">View Attendance</a>
  <a href="staffReport.jsp">Staff Report</a>
  <a href="attendanceReport.jsp">Attendance Report</a>
</div>

<span style="font-size:30px;cursor:pointer;color:white;" onclick="openNav()">&#9776;  Staff Managment</span>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

  <div class="search-container">
    <form method="post" action="search.jsp">
      <input type="text" size="30px" placeholder="Search.." name="search" style="margin-left:40%;">
      <button type="submit"><i class="fa fa-search" ></i></button>
    </form>
  </div>

<br/><br/><br/><br/>

<center>
<table border="1"  style="background-color:#8C98C1; color:white;" >
<tr>
<td>Staff ID</td>
<td>First name</td>
<td><tab><tab>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from staff_details";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("sid") %></td>
<td><%=resultSet.getString("fname") %></td>
<td ><a  href="view.jsp?sid=<%=resultSet.getString("sid") %>"><button class="but" type="button" style="background-color:#3057D3;"><b>View</b></button>                   
<a  href="update.jsp?sid=<%=resultSet.getString("sid") %>"><button class="but" type="button" style="background-color:#1AAB1A;"><b>Edit</b></button></a>
<a  href="delete.jsp?sid=<%=resultSet.getString("sid") %>"><button class="but" type="button" style="background-color:#ED4C39;"><b>Delete</b></button></a></td>
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
<button><a href="staffReport.jsp">Downld</a></button>
</body>
</html>