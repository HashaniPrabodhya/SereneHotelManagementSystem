<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/staff_managment";

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
<meta charset="ISO-8859-1">
<title>Add Staff Member details</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style >
 table{
  border-width : "15px";
 }
 
 button {
  display: inline-block;
  padding: 10px 25px;
  font-size: 20px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 7px #999;
}

button:hover {background-color: #3e8e41}

button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
</style>

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

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
      <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>  
 
</head>

<body style="background-color:#0D1E52;" >

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


<div class="topnav">
  <a href="#home"><b/>Home</a>
  <a href="#"><b/>Rooms</a>
  <a href="#hall"><b/>Banquet Hall</a>
  <a href="shome.jsp"><b/>Staff</a>
  
  
</div>

<center><h1 style="color:white;">Add Staff Member form</h1>
<br/><br/>

<form method="POST" action="insert-process.jsp">
	 <div style="border: 3px solid white; background-color:#382E83">
	 <br/>
	 <br/>
	 <table style="color:white;">
	 <tr>
	  <td><label >First Name:</label></td>
      <td><input type="text" size="75px" name="fname"  required ></td>
	  
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr>
	  <td><label >Last Name:</label></td>
      <td><input type="text" size="75px" name="lname"  required autocomplete="on"></td>
	  
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr>
	  <td><label >Date of Birth:</label></td>
      <td><input type="date" size="75px"  id="dob" name="dob" max="2021-01-01" autocomplete="off"></td>
	</tr>
	<tr>  </tr><tr>  </tr><tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>  
	<tr> 
	  <td><label >Gender:</label></td>
      <td><select name="gender" id="gender">
 
    <option value="s">Select Gender     </option>
 
    <option value="m">Male</option>
 
    <option value="f">Female</option>
    </select></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr> 
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
    <tr> 
	  <td><label >Email:</label></td>
      <td><input type="email" size="75px"  name="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr> 
	  <td><label >Phone:</label></td>
      <td><input type="text" size="75px"  name="phone" required></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr> 
	  <td><label >NIC:</label></td>
      <td><input type="text" size="75px"  name="nic" required></td>
	  <td><span  class="text-danger font-weight-bold"> </span></td>
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr> 
	  <td><label >Address:</label></td>
      <td><input type="text" size="75px"  name="address" required></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr> 
	  <td><label >Salary:</label></td>
      <td><input type="text" size="75px" pattern="^[0-9]+\.?[0-9]{0,2}$"  name="salary" autocomplete="off" required></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr> 
	  <td><label >Job Title:</label></td>
      <td><input type="text" size="75px"  name="job" required></td>
	  <td><span  class="text-danger font-weight-bold"> </span></td>
	</tr>
	<tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr><tr>  </tr>
	<tr> 
	  <td><label >Department:</label></td>
      <td><select name="dep" id="dep" >
 <option value="F">Select Department</option>
 
    <option value="F">Front Office Department</option>
 
    <option value="H">Housekeeping Department</option>
 
    <option value="FB">Food and Beverage Service Department</option>
 
    <option value="K">Kitchen or Food Production Department</option>
 
    <option value="A">Accounts and Credits Department</option>
 
    <option >Engineering and Maintenance Department</option>
 
    <option >Human Resource Department</option>
    
    <option >Security Department</option>
    
    <option >Purchase Department</option>
    
    <option >IT Department</option>
</select></td>
	  <td><span  class="text-danger font-weight-bold"> </span></td>
	</tr>
	
   </table>
	 <br/>
    </div>
	 <br/><br/><button  type="submit" size="145px" name="btnadd" style="background-color:#00ff00;"  >Add</button>
    	 </form>
	 </center>
	
</body>
</html>