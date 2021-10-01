<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

String sid=request.getParameter("sid");
String name=request.getParameter("name");
String dep=request.getParameter("dep");
String date=request.getParameter("date");
String intime=request.getParameter("intime");
String outtime=request.getParameter("outtime");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff_attendance", "root", "jami1998");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into attendance(sid,name,dep,date,intime,outtime) values('"+sid+"','"+name+"','"+dep+"','"+date+"','"+intime+"','"+outtime+"')");
RequestDispatcher dis3 = request.getRequestDispatcher("attendance.jsp");
dis3.forward(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
