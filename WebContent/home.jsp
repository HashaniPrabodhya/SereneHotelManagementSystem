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

<title>Home</title>

	<script src="https://kit.fontawesome.com/85c9cbf9ed.js" crossorigin="anonymous"></script>
<style>
/*header*/
.header {
  overflow: hidden;
  background-color: #32315c;
  padding: 30px 10px;
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
<!--styles for login button-->
.btn {
  background-color: #2196F3;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  outline: none;
}

.dropdown {
  position: absolute;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content a:hover {background-color: #ddd}

.dropdown:hover .dropdown-content {
  display: block;
}

.btn:hover, .dropdown:hover .btn {
  background-color: #0b7dda;
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

<!-- Card Styles-->

</style>
</head>
	<body style="background-color:#32315c;">
	<header>
<div class="header">
<a href="#home">
  <img src="Images/imgLogo.jpg" class="logo" height="180px" width="200px">
</a><br>
	<font size="16" style="font-family:century gothic;:" color="white" align="center"> Serene<b> Hotels </b> </font>
  <div class="header__right">
    
    <a href="#signin">Sign in</a>
    <a href="#login">Login</a>
    <a href="#login">Admin Login</a>
    <div>
 
     </div>
     
  </div>
  
</div>
 
</header>

<div class="topnav">
  <a href="home.jsp">Home</a>
  <a href="AddBooking.jsp">Rooms</a>
  <a href="#hall">Banquet Hall</a>
  <a href="contactUs.jsp">Contact Us</a>
  
  
</div>
<!--Slideshow-->
	</div class="slideshow-container">
	
	<div class="container">
	<div class="mySlides fade">
	 <img src="Images\img1SLD.jpg" style="width:100%">
	 <div class="centered">Accomadations</div>
	 <div class="bottom-left">Deluxe Rooms</div>
	 <div class="bottom-center">Super Deluxe Rooms</div>
	 <div class="bottom-right">Deluxe Ocean View</div>
	 </div>
	 </div>
	 
	 <div class="container">
	<div class="mySlides fade">
	 <img src="Images\img2SLD.jpg" style="width:100%">
	 <div class="centered">Serene Hotel</div>
	 <div class="bottom-center">Spread across the length and 
	 breadth of our tropical island</div>
	 
	 </div>
	 </div>
	 
	  <div class="container">
	<div class="mySlides fade">
	 <img src="Images\img4SLD.jpg" style="width:100%">
	 <div class="centered">Weddings & Celebrations</div>
	 
	 <div class="bottom-center">Plan an exotic Wedding</div>
	 
	 </div>
	 </div>
	 
	 
	 <div class="container">
	 <div class="mySlides fade">
	 <img src="Images\img3SLD.jpg" style="width:100%">
	 <div class="centered">Unique privileges and enhanced luxury</div>
	  
	 <div class="bottom-left"></div>
	 </div>
	 <br>
	  <div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span>  
</div>


	<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 6000); // Change image every  seconds
}
</script>


	


<br><br><br>
<!--About texts-->
<h1  styles="font-color:black">About US </h1>
<br>

<p>Serene Hotel is a family owned Boutique Hotel that desires to cater and provide guests with personalized hospitality based on what they prefer and not what is customary. Whether the guest is looking for quiet time and lots of privacy or seeking energetic, friendly environment in the most delightful place away from home, Main Hotel and Suites can accommodate. Our goal is to engage our guests and provide them with the best experience through harmonious, zealous and personable service in the most convenient, comfortable, intimate and welcoming setting.

Regardless of the reason for your visit in Hikkaduwa (business or pleasure), Serene Hotel caters to your preferred lifestyle that demands high-tech in hotel accommodations, or lifestyle that seeks simplicity. To our business or leisure guests, hotel rooms and suites are furnished in stylish manners and fitted with telephone, air-conditioning and modern amenities including complimentary WiFi and flat screen television with cable.
Some hotel rooms and suites may also have honesty bars for guest convenience. Serene Hotel provides luxury amenities with above-average Guest services attended to by 24-hour hotel staff.
Our mission as a company is to provide peace of mind, consistency and build loyalty based on our value of our relationships with the guests. We strive to be unique and the place you would want to go back to on your next visit to Cebu.  Our vision is to stay ahead with the competition by evolving to and meeting the changing preference of our guests through continued innovation. With this in mind, we constantly gather and appreciate guest and employee feedback and test new concepts and ideas.

A key element to our success is our effort to engage our staff in becoming a real team member with the same goals. We also value and mold them to be vibrant, welcoming, passionate and respectful of hotel guests. Inspired service is what we expect and hope for from our staff.  They are prepared to know our guests and their preference that allows them, the staff, to create a personalized service that can bring the hotel closer to the mission of building guest loyalty.

Serene Hotel is located in a prime location at Hikkaduwa. You will never go wrong if convenience is a factor since the hotel is within walking distance to fast foods or fine dining including Ginza Japanese Restaurant. The hotel is also just minutes away from the exciting coral beach, and from the shopping, theatres and restaurants.For hotel guest convenience, Serene Hotel also have on-site dining facility, Caffe Alba, that is also open to the general public. An intimate gift shop, Looking Around Shop, is also found on-site at the hotel lobby for novelty or miscellaneous items.</p>
	

</body>
</html>