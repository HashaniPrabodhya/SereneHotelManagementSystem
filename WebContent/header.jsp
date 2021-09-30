<html>
<head>
<title>Welcome To Admin Dashboard</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>

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
  background-color:#529B7B;
  color:white;
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
	background-color:black;
	color:white;
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
  background-color:#bbb;
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


<body>
<header>
<div class="header">
<a href="#home">
  <img src="images/admin_home_image.jpg" class="logo" height="100px" width="100px">
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
</body>
</html>