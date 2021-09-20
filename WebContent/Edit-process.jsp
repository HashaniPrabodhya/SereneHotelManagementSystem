<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <!-- Edit process execution happen in here -->
   
  <%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/serene_beach_hotel";%>
<%!String user = "root";%>
<%!String psw = "dbHash96";%>
<%
String roomNo=request.getParameter("roomNo");
int floorNo=Integer.parseInt(request.getParameter("floorNo"));
String roomType=request.getParameter("roomType");
int beds=Integer.parseInt(request.getParameter("beds"));
int maxAdults=Integer.parseInt(request.getParameter("maxAdults"));
int maxChild=Integer.parseInt(request.getParameter("maxChild"));
double price=Double.parseDouble(request.getParameter("price"));
String roomStatus=request.getParameter("roomStatus");
if(roomNo != null)
{
Connection con = null;
PreparedStatement ps = null;
/*int roomNo = Integer.parseInt("roomNo")*/; 
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update rooms set roomNo=?,floorNo=?,roomType=?,beds=?,maxAdults=?,maxChild=?,price=?,roomStatus=? where roomNo='"+roomNo+"' and roomStatus!='Booked' ";
ps = con.prepareStatement(sql);
ps.setString(1,roomNo);
ps.setInt(2, floorNo);
ps.setString(3, roomType);
ps.setInt(4, beds);
ps.setInt(5, maxAdults);
ps.setInt(6, maxChild);
ps.setDouble(7, price);
ps.setString(8, roomStatus);

int i = ps.executeUpdate();
if(i > 0)
{

request.setAttribute("alertMsg", "Updation successfull");
RequestDispatcher dis=request.getRequestDispatcher("ListRoom.jsp");
dis.forward(request, response);
}
else
{
	request.setAttribute("alertMsg", "There is a problem in updating Record.");
RequestDispatcher dis=request.getRequestDispatcher("ListRoom.jsp");
dis.forward(request, response);
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
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