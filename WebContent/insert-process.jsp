<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

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

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/staff_managment", "root", "jami1998");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into staff_details(fname,lname,dob,gender,email,phone,nic,address,salary,job,dep,) values('"+fname+"','"+lname+"','"+dob+"','"+gender+"','"+email+"',+phone+,'"+nic+"','"+address+"',+salary+,'"+job+"','"+dep+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>