<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/staff_managment";%>
<%!String user = "root";%>
<%!String psw = "jami1998";%>
<%
String sid = request.getParameter("sid");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String dob=request.getParameter("dob");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
int phone=Integer.parseInt(request.getParameter("phone"));
String nic=request.getParameter("nic");
String address=request.getParameter("address");
double salary=Double.parseDouble(request.getParameter("salary"));
String job=request.getParameter("job");
String dep=request.getParameter("dep");
if(sid != null)
{
Connection con = null;
PreparedStatement ps = null;
int staffId = Integer.parseInt(sid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update staff_details set sid=?,fname=?,lname=?,dob=?,gender=?,email=?,phone=?,nic=?,address=?,salary=?,job=?,dep=? where sid="+sid;
ps = con.prepareStatement(sql);
ps.setString(1,sid);
ps.setString(2, fname);
ps.setString(3, lname);
ps.setString(4, dob);
ps.setString(5, gender);
ps.setString(6, email);
ps.setInt(7, phone);
ps.setString(8, nic);
ps.setString(9, address);
ps.setDouble(10, salary);
ps.setString(11, job);
ps.setString(12, dep);
int i = ps.executeUpdate();
if(i > 0)
{
	
	
	RequestDispatcher dis3 = request.getRequestDispatcher("shome.jsp");
	  dis3.forward(request, response);
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>