<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
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

/* Style inputs with type="text", select elements and textareas */
input[type=text],input[type=number], select, textarea {
  width: 100%; /* Full width */
  padding: 12px; /* Some padding */ 
  border: 1px solid #ccc; /* Gray border */
  border-radius: 4px; /* Rounded borders */
  box-sizing: border-box; /* Make sure that padding and width stays in place */
  margin-top: 6px; /* Add a top margin */
  margin-bottom: 16px; /* Bottom margin */
  resize: vertical /* Allow the user to vertically resize the textarea (not horizontally) */
}

/* Style the submit button with a specific background color etc */
input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

/* When moving the mouse over the submit button, add a darker green color */
input[type=submit]:hover {
  background-color: #45a049;
}

/* Add a background color and some padding around the form */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
/*new */
.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 50%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}
input[type=number] {
  width: 50%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}
label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}
h1{
	font-family:century gothic;
}
p{
	font-family:century gothic;
	font-style:italic;
}

</style>
</head>
<body>
	<header>
<div class="header">
<a href="#home">
  <img src="Images/imgLogo.jpg" class="logo" height="180px" width="200px">
</a><br>
	<font size="16" style="font-family:century gothic;:" color="white" align="center"> Serene<b> Hotels </b> </font>
  <div class="header__right">
    
    <a href="#signin">Sign in</a>
    <a href="#login">Login</a>
  </div>
</div>
</header>
<script language = "Javascript">
/* This is code to check valid email using java script. */
function emailCheck(str) {
      		var at="@"
		var dot="."
		var lat=str.indexOf(at)
		var lstr=str.length
		var ldot=str.indexOf(dot)
        // check if '@' is at the first position or 
            at last position or absent in given email 
		if (str.indexOf(at)==-1 || str.indexOf(at)==0 ||
                str.indexOf(at)==lstr){
		   alert("Invalid E-mail ID")
		   return false
		}
		        // check if '.' is at the first position or at last 
        position or absent in given email
		if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 ||
                str.indexOf(dot)==lstr){
		    alert("Invalid E-mail ID")
		    return false
		}
		        // check if '@' is used more than one times in given email
		if (str.indexOf(at,(lat+1))!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }
           // check for the position of '.'
		 if (str.substring(lat-1,lat)==dot || 
                 str.substring(lat+1,lat+2)==dot){
		    alert("Invalid E-mail ID")
		    return false
		 }
		         // check if '.' is present after two characters 
         from location of '@'
		 if (str.indexOf(dot,(lat+2))==-1){
		    alert("Invalid E-mail ID")
		    return false
		 }
		
				 // check for blank spaces in given email
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid E-mail ID")
		    return false
		 }
		  		 return true					
	}
	function ValidateForm(){
	var emailID=document.form.txtEmail
	
	       //check if email is not entered or only spaces 
       are entereds in appropriate textbox
	if ((emailID.value==null)||(emailID.value=="")){
		alert("Please Enter your Email ID")
	
	// set cursor to the textbox provided for email entry
		emailID.focus()
		return false
    }
	if (emailCheck(emailID.value)==false){
		emailID.value=""
		emailID.focus()
		return false
	}
		return true
 }
</script>
<div class="topnav">
  <a href="home.jsp">Home</a>
  <a href="AddBooking.jsp">Rooms</a>
  <a href="#hall">Banquet Hall</a>
  <a href="contactUs.jsp">Contact Us</a>
  
</div>
<br><br><br>
<!--Contact us texts-->
<h1 >CONTACT US </h1>
<br>
<p>We hope you have chosen your Serene destination in Sri Lanka. Hotel reservations can be made either online or you may contact us directly, particularly if you have special requirements or specific plans. If you are already in Sri Lanka, hotel bookings can also be made at Serene House. For further details do not hesitate to contact us, we are at your service anytime, any day.</p>

<p>Serene Hotel
<br>46/26,Hikkaduwa,Sri Lanka
<br>	Telephone +94 112 345 543
<br>	E-mail reservations@gmail.com</P>

<br><br>
<!--Contact us form-->
 <div class="row">
  <div class="col-75">
    <div class="container">
      <form action="AddInquiryServlet" method="post" onSubmit="return ValidateForm()">

        <div class="row">
          <div class="col-50">
			<label for="fName"><i class="fa fa-user"></i> First Name</label>
            <input type="text" id="fName" name="fName" placeholder="Enter your first name"required >
			
			<label for="lname"><i class="fa fa-user-o"></i>Last Name</label>
            <input type="text" id="lName" name="lName" placeholder="Enter your last name"required >
			
			
			<label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="Enter your E-mail"required >
			
			<label for="mobile"><i class="fa fa-phone"></i>Mobile</label>
            <input type="text" id="mobile" name="mobile" placeholder="Enter your mobile"required minlength="10" maxlength="10">
			
			<label for="nationality"><i class="fa fa-address-card-o"></i> Nationality</label>
            <input type="text" id="nationality" name="nationality" placeholder="Enter your Nationality"required >
			
			
			<label for="fname"><i class="fa fa-comment"></i>Inquiry</label>
	<textarea name="message"  id="message" placeholder="Tell us about your inquiry" row="4" required style="height:200px"></textarea>
	<input type="submit" name="submit" value="Send">
	
			</form>
			
			</div>
		</div>
</body>
</html>