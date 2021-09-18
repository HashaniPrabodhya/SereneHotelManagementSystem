<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String sid=request.getParameter("sid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff_managment", "root", "jami1998");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM staff_details WHERE sid="+sid);

RequestDispatcher dis3 = request.getRequestDispatcher("shome.jsp");
dis3.forward(request, response);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>