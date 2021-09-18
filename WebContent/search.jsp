<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "staff_managment";
String userid = "root";
String password = "jami1998";
String sid = request.getParameter("sid");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<table border="1"  style="background-color:#8C98C1; color:white;" >
<tr>
<td>Staff ID</td>
<td>First name</td>
<td><tab><tab>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from staff_details where sid='"+sid+"' ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("sid") %></td>
<td><%=resultSet.getString("fname") %></td>
<td ><a  href="view.jsp?sid=<%=resultSet.getString("sid") %>"><button class="but" type="button" style="background-color:#3057D3;"><b>View</b></button>                   
<a  href="update.jsp?sid=<%=resultSet.getString("sid") %>"><button class="but" type="button" style="background-color:#1AAB1A;"><b>Edit</b></button></a>
<a  href="delete.jsp?sid=<%=resultSet.getString("sid") %>"><button class="but" type="button" style="background-color:#ED4C39;"><b>Delete</b></button></a></td>
</tr>
<%

}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>