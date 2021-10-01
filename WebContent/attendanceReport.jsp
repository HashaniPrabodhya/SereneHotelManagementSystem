<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String sid = request.getParameter("sid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/staff_attendance";
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
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
  width:70%;
  margin:0% %px;
}
 form{
  
  margin:0% 35%;
}
th, td{
  padding:5px;
  text-align:center;
}
 .sub {
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
.sub:hover {background-color: #3e8e41}
.sub:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}
.but {
  display: inline-block;
  border-radius: 4px;
  background-color: #f4511e;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 14px;
  padding: 10px;
  width: 150px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}
.but span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}
.but span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}
.but span {
  padding-right: 25px;
}
.but span:after {
  opacity: 1;
  right: 0;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
      <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>  
 
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

<div class="topnav">
  <a href="AdminHome.jsp"><b/>Home</a>
  <a href="ListRoom.jsp"><b/>Rooms</a>
  <a href="NewBanq.jsp"><b/>Banquet Hall</a>
  <a href="shome.jsp"><b/>Staff</a>
  
  
</div>

<center><h1 style="color:white;"> <b>Hotel Managment</b></h1></center>
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="shome.jsp">Staff Home</a>
    <a href="register.jsp"> +  Add Staff</a>
  <a href="attendance.jsp">Mark Attendance</a>
  <a href="staffReport.jsp">Staff Report</a>
  <a href="#">Attendance Report</a>
</div>

<span style="font-size:30px;cursor:pointer; color:white;" onclick="openNav()">&#9776; Staff Managment</span>
    <!-- Javascript -->  
      <script>  
         $(function() {  
            $( "#datepick" ).datepicker();  
         }); 

      </script>
<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}
function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>

<br/>
<br/>
 <div> 
  <center>
    <form >
      <input type="text"   id="datepick" name="search" value= "Choose Date" required  style="background-color:#99ff99">
      <select name="search2" id="dep" align="middle"  style="background-color:#99ff99">
 
        <option >Select Department</option>
 
        <option >Front Office Department</option>
 
        <option >Housekeeping Department</option>
 
        <option >Food and Beverage Service Department</option>
 
        <option >Kitchen or Food Production Department</option>
 
        <option >Accounts and Credits Department</option>
 
        <option >Engineering and Maintenance Department</option>
 
        <option >Human Resource Department</option>
    
        <option >Security Department</option>
    
        <option >Purchase Department</option>
    
        <option >IT Department</option>
    </select>
     <br><br> 
    <button class="but" type="submit" name="search" style="background-color:#00ff00;"  >Get Attendance</button>
   </form>
  </center>
</div>
<br/><br/> <br/>
<div id="list1">
<center><img src="images/logo.jpg" class="logo" height="100px" width="100px"> </center>
<Center><h2 style="color:blue;"><b>Daily Attendance</b></h2></Center>
  <center>   
     <table border="1">
<tr>
<td style="color:#41E6CE;"><b>Staff ID</b></td>
<td style="color:#41E6CE;"><b>Name</b></td>
<td style="color:#41E6CE;"><b>Date</b></td>
<td style="color:#41E6CE;"><b>Department</b></td>
<td style="color:#41E6CE;"><b>In Time</b></td>
<td style="color:#41E6CE;"><b>Out Time</b></td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl, userid, password);
statement=connection.createStatement();
String query = request.getParameter("search");
String query2 = request.getParameter("search2");
String sql;
if(query != null){
	sql ="select * from attendance where date like '%"+query+"%' AND dep like '%"+query2+"%'";
}
else{
	sql ="select * from attendance";
}
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("sid") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("dep") %></td>
<td><%=resultSet.getString("intime") %></td>
<td><%=resultSet.getString("outtime") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</center>
</div>
<br/><br/><br/>
<center><button onclick="print1()" class="sub" type="submit"  name="down" style="background-color:#66e0ff;"  ><b>Download</b></button></center>
<script>
function print1(){
var element = document.getElementById("list1");
var opt = {
  margin:       1,
  filename:     'Staff.pdf',
  image:        { type: 'jpeg', quality: 0.98 },
  html2canvas:  { scale: 2 },
  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
};
 
// New Promise-based usage:
html2pdf().from(element).set(opt).save();
}
</script>
<br><br><br>
</body>
</html>