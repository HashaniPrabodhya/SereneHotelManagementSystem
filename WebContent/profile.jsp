<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Profile</title>
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
</head>
<body style="background-color:#0D1E52;">

<div class="header">
<a href="#home">
  <img src="images/logo.jpg" class="logo" height="100px" width="100px">
</a><br>
	<font size="16" style="font-family:century gothic;:" color="#B7950B " align="center"><b> Serene Hotels </b> </font>
  <div class="header__right">
    
   <a href="#logout"><text style= "color:#B7950B;
  size:24px;"><b/>Logout</a></text>
  </div>
</div>
</header>
<div class="topnav">
  <a href="#home"><b/>Home</a>
  <a href="#"><b/>Rooms</a>
  <a href="#hall"><b/>Villas</a>
  <a href="#hall"><b/>Banquet Hall</a>
  <a href="shome.jsp"><b/>Contact Us</a>
  <a href="#hall"><b/>About Us</a>
  
</div>




<center><h1 style="color:white;">PROFILE</h1>
<br/><br/>
<div style="color:white; " >
 <img src="images/log1.png" hspace="500" style="margin-left:0%;">
<form method="POST" action="">
	 
	 <br/>
	 
	 <br/>
	 <table>
	 <tr>
	  <td><label >Name:</label></td>
      <td><input type="text" size="75px" name="fname"  required autocomplete="off"></td>
	  
	</tr>
	<tr></tr><tr></tr>
	<tr>
	
	  <form action="/action_page.php">
	  <td><label >Date of Birth:</label></td>
      <td><input type="date" size="75px" name="dob" id="birthday" required autocomplete="off"></td>
	  <td><span class="text-danger font-weight-bold"></span></td>
	  </form>
      
	  <td><span class="text-danger font-weight-bold"></span></td>
	</tr>
	<tr></tr><tr></tr>
	<tr> 
	  <td><label >Gender:</label></td>
      <td><select name="gen" id="gen">
 
    <option value="s">Select </option>
 
    <option value="m">Male</option>
 
    <option value="f">Female</option>
    </select></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr> 
	<tr></tr><tr></tr>
    <tr> 
	  <td><label >Email:</label></td>
      <td><input type="text" size="75px"  name="email" required></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr>
	<tr></tr><tr></tr>
	<tr> 
	  <td><label >Phone:</label></td>
      <td><input type="text" size="75px"  name="phone" required></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr>
	<tr></tr><tr></tr>
	<tr> 
	  <td><label >NIC:</label></td>
      <td><input type="text" size="75px"  name="nic" required></td>
	  <td><span  class="text-danger font-weight-bold"> </span></td>
	</tr>
	<tr></tr>
	<tr></tr>
	<tr> 
	  <td><label >Address:</label></td>
      <td><input type="text" size="75px"  name="address" required></td>
	  <td><span  class="text-danger font-weight-bold"></span></td>
	</tr>
	</table>
	</div></form>
	<br/><br/><button class="edit" type="submit"  name="edit" style="background-color:#00ff00;" >Edit Profile</button>
	<button class="his" type="submit"  name="his" style="background-color:orange;" >Booking History</button>
	<button class="del" type="submit"  name="del" style="background-color:red;" height="45" >Delete Account</button>
	</center>
</body>
</html>