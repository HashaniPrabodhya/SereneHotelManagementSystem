<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<!-- Insert processed page -->

<%
String roomNo=request.getParameter("roomNo");
int floorNo=Integer.parseInt(request.getParameter("floorNo"));
String roomType=request.getParameter("roomType");
int beds=Integer.parseInt(request.getParameter("beds"));
int maxAdults=Integer.parseInt(request.getParameter("maxAdults"));
int maxChild=Integer.parseInt(request.getParameter("maxChild"));
double price=Double.parseDouble(request.getParameter("price"));
String roomStatus=request.getParameter("roomStatus");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/serene_beach_hotel", "root", "dbHash96");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into rooms values ('"+roomNo+"', "+floorNo+", '"+roomType+"', "+beds+", "+maxAdults+", "+maxChild+", "+price+", '"+roomStatus+"')"
);

RequestDispatcher rd1 = request.getRequestDispatcher("ListRoom.jsp");
rd1.forward(request, response);

out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>