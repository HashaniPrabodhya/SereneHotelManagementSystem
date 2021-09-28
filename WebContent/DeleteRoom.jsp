<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>
<%
String rNo=request.getParameter("roomNo");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/serene_beach_hotel", "root", "dbHash96");
Statement st=conn.createStatement();
int i=st.executeUpdate("delete from rooms  where roomNo='"+rNo+"' and roomStatus!='Booked' ");
RequestDispatcher rd2 = request.getRequestDispatcher("ListRoom.jsp");
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
<title>Insert title here</title>
</head>
<body>

</body>
</html>