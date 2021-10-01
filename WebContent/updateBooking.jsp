<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager" %>
   <%@page import="java.sql.ResultSet" %>
   <%@page import="java.sql.Statement" %>
   <%@page import="java.sql.Connection" %>
   
   <%
  	String bookingId=request.getParameter("bookingId");
   String driver="com.mysql.jdbc.Driver";
   String Connectionurl="jdbc:mysql://localhost:3306/";
   String database="hotel";
   String userN="root";
   String passw="root123";
   
   try{
   	Class.forName(driver);
   }catch(ClassNotFoundException e){
   	e.printStackTrace();
   }
   
   Connection connection=null;
   Statement statement=null;
   ResultSet resultSet=null;
   %>
   <%
   try{
	   connection =DriverManager.getConnection(Connectionurl+database,userN,passw);
	   statement=connection.createStatement();
	   String sql="select * from booking where bookingId="+bookingId;
	   resultSet=statement.executeQuery(sql);
	   while(resultSet.next()){
		   %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style >
body{
	background-color:#32315c;
}
* {
  box-sizing: border-box;
}

input[type=text], select, textarea,input[type=date] {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
.container {
  border-radius: 5px;
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;

  padding: 20px;
}
label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;

  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}

/* Add media queries for smaller screens */
@media screen and (max-width:720px) {
  .weekdays li, .days li {width: 13.1%;}
}

@media screen and (max-width: 420px) {
  .weekdays li, .days li {width: 12.5%;}
  .days li .active {padding: 2px;}
}

@media screen and (max-width: 290px) {
  .weekdays li, .days li {width: 12.2%;}
}
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
	<script src="https://kit.fontawesome.com/85c9cbf9ed.js" crossorigin="anonymous"></script>
</style>
</head>
<body >

	<header>
<div class="header">
<a href="home.jsp">
  <img src="Images/imgLogo.jpg" class="logo" height="180px" width="200px">
</a><br>
	<font size="16" style="font-family:century gothic;:" color="white" align="center"> Serene<b> Hotels </b> </font>
  <div class="header__right">
    
    <a href="#signin">Sign in</a>
    <a href="#login">Login</a>
  </div>
</div>
</header>
<div class="topnav">
  <a href="home.jsp">Home</a>
  <a href="AddBooking.jsp">Rooms</a>
  <a href="#hall">Banquet Hall</a>
  <a href="contactUs.jsp">Contact Us</a>

</div>

<center><h1 style="color:white;">Edit Your Booking</h1>	</center>
	<table width="500" height="300">
	
	<form method ="post" action="UpdateProcess.jsp" >
	<div class="container">
	
		
	<div class="row">
	 <div class="col-25">
	 <label for="bookingId">Booking Id</label>
	 </div>
	 <div class="col-75">
	<input type="hidden" name="bookingId" value="<%=resultSet.getString("bookingId") %>"readOnly>
	<input type="text" name="bookingId" value="<%=resultSet.getString("bookingId") %>"readOnly>
	  </div>
  </div>
	<div class="row">
    <div class="col-25">
    <label for="userName">User Name</label>
    </div>
     <div class="col-75">
	<input type="text" name="userName" value="<%=resultSet.getString("userName") %>"readOnly>
	  </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="customerName">Customer Name</label>
       </div>
    <div class="col-75">
		<input type="text" name="customerName" value="<%=resultSet.getString("customerName") %>" >
		 </div>
  </div>
  <div class="row">
    <div class="col-25">
		<label for="from">Check-In Date</label>
    </div>
    <div class="col-75">
						<input type="date" name="fromDate" value="<%=resultSet.getString("fromDate") %>" >
						</div>
  </div>
   <div class="row">
    <div class="col-25">
      <label for="to">Check-Out Date</label>
      </div>
      <div class="col-75">
						<input type="date" name="toDate" value="<%=resultSet.getString("toDate") %>">
					  </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="accomodationType">Accommodation Type</label>
    </div>
    <div class="col-75">
												<select name="accomodationType"  readonly>
												<option value=""><%=resultSet.getString("accomodationType") %></option>
												<option value="Luxury Room">Luxury Room</option>
												<option value="Single Room">Single Room</option>
												<option value="Family Room">Family Room</option>
												<option value="Duluxe Room">Deluxe Room</option>
												</select>
												   </div>
  </div>
  
     <div class="row">
    <div class="col-25">
      <label for="noNights">Number Of Nights</label>
    </div>
    <div class="col-75">
						<input type="text" name="noNights" value="<%=resultSet.getString("noNights") %>" >
					 </div>
  </div>
   <div class="row">
    <div class="col-25">
      <label for="noAdults">Number Of Adults</label>
    </div>
    <div class="col-75">
						<input type="text" name="noAdults" value="<%=resultSet.getString("noAdults") %>" >
						 </div>
  </div>
   
    <div class="row">
    <div class="col-25">
      <label for="noChildren">Number Of Children</label>
    </div>
    <div class="col-75">
						<input type="text" name="noChildren" value="<%=resultSet.getString("noChildren") %>" >
					  </div>
  </div>
  
    <div class="row">
    <div class="col-25">
      <label for="phone">Contact Number</label>
    </div>
    <div class="col-75">
						<input type="text" name="phone" value="<%=resultSet.getString("phone") %>" >
					  </div>
  </div>
  						<div class="row">	
  						<input type="submit" name="submit" value="submit">
						<a href="Bookings.jsp"><input type="submit" value="Cancel"></a>
						
					</div>
				
	</form>
	</table>
	
	<%
	   }
		connection.close();
	}catch(Exception e){
	e.printStackTrace();
	}
	%>
	
	</body>
	</html>