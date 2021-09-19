<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Room </title>
<style>

<!--
input[type=text],input[type=number]{
	width:75%;
	padding:5px;
	
	}
	
select{
	width:80%;
	padding:5px;
}

textarea{
	width:75%;
	padding:5px;
}

input[type=submit]{
	width:80%;
	padding:5px;
	align:center;
}

button{
	width:80%;
	padding:5px;
	align:center;
}


.container{
	width:30%;
	padding: 100px 100px;
	border: 10px solid black;
	margin: 30px 300px 30px 30px;
}

-->



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

body{
border: 5px sloid darkBlue;
background-color:#34495E; /*#5D6D7E*/
}

</style>
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


<!-- Add room view -->	
			 
<center>
<center><h1 style="color:#AEB6BF;"><b/>Add Room</h1></center>
<div>
		
		
			<table  style= "background-color:#EAEDED; width:50%; height:300px;  padding: 20px;">
				<form  action="Insert-Process.jsp" method="post" >
					<tr>
						<td>Room No:<br/><input type="text" name="roomNo" required></td>
						<td>Max No Of Adults:<br/><input type="number" name="maxAdults"  title="enter only numbers" required></td>
					</tr>
					
					<tr>
						<td><br/>Floor No:<br/><input type="number" name="floorNo"  title="enter only numbers"  required></td>
						<td><br/>Max No Of Children:<br/><input type="number" name="maxChild"   title="enter only numbers"   required></td>
					</tr>
					
					<tr>
						<td><br/>Room Type:<br/><select name="roomType" required>
												<option value="">Select Room Type</option>
												<option value="Luxury Room">Luxury Room</option>
												<option value="Single Room">Single Room</option>
												<option value="Family Room">Family Room</option>
												<option value="Duluxe Room">Duluxe Room</option>
												</select></td>
						<td><br/>Price:<br/><input type="text" name="price"  pattern="^[0-9]+\.?[0-9]{0,2}$" required></td>
					</tr>
					
					<tr>
						<td><br/>No of Beds:<br/><input type="number" name="beds"  title="enter only numbers"  required></td>
						<td><br/>Room Status:<br/><select name="roomStatus"  required>
												<option value="">Select Room Status</option>
												<option value="Available">Available</option>
												<option value="Booked">Booked</option>
												<option value="Under Maintenance">Under Maintenance</option>
												</select></td>
					</tr>
					<tr>
						<td><br/><a href="ListRoom.jsp"><button type="button" style="background-color:#C0392B; font-weight: bold;">Cancel</button></a></td>
						<td><br/><input type="submit" value="Add Room" style="background-color:#85C1E9; font-weight: bold;"></td>
					</tr>
				</form>
			</table>
			
			</div>

</center>

</body>
</html>