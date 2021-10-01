<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
<%
String bookingId=request.getParameter("bookingId");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "root123");
Statement st=conn.createStatement();
int i=st.executeUpdate("delete from booking where bookingId='"+bookingId+"'");
RequestDispatcher rd2 = request.getRequestDispatcher("Bookings.jsp");
rd2.forward(request, response);

out.println("Room Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Booking</title>
</head>
<!-- int bookingId,String customerName, String accomodationType, String from, String to, String noNights, String noAdults,
			String noChildren, String phone, String userName -->
<body>
	<h2>Deleted Successfully </h2>
	
</body>
</html>