<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>
     <%! String driver="com.mysql.jdbc.Driver";%>
     <%!  String Connectionurl="jdbc:mysql://localhost:3306/hotel?autoReconnect=true&useSSL=false";%>
     <%!   String userN="root";%>
     <%!   String passw="root123";%>
     <%
     String bookingId=request.getParameter("bookingId");
     String customerName=request.getParameter("customerName");
     String accomodationType=request.getParameter("accomodationType");
     String from=request.getParameter("fromDate");
     String to=request.getParameter("toDate");
     String noNights=request.getParameter("noNights");
     String noAdults=request.getParameter("noAdults");
     String noChildren=request.getParameter("noChildren");
     String phone=request.getParameter("phone");
     String username=request.getParameter("userName");
     
     if(bookingId != null){
    	 Connection con=null;
    	 PreparedStatement ps=null;
    	int bookingiD=Integer.parseInt(bookingId);
    	 try{
    		 Class.forName(driver);
    		 con=DriverManager.getConnection(Connectionurl,userN,passw);
    		 String sql="Update booking set bookingId=?,customerName=?,accomodationType=?,fromDate=?,toDate=?,noNights=?,noAdults=?,noChildren=?,phone=?,userName=? where bookingId="+bookingId;
    		 	ps=con.prepareStatement(sql);
    		 	ps.setString(1,bookingId);
    			ps.setString(2,customerName);
    			ps.setString(3,accomodationType);
    			ps.setString(4,from);
    			ps.setString(5,to);
    			ps.setString(6,noNights);
    			ps.setString(7,noAdults);
    			ps.setString(8,noChildren);
    			ps.setString(9,phone);
    			ps.setString(10,username);
    			
    			int i=ps.executeUpdate();
    			if(i > 0){
    				RequestDispatcher dis3 = request.getRequestDispatcher("updateSuccess.jsp");
    				  dis3.forward(request, response);
    			}else{
    				out.print("update failed");
    			}
    	 }catch(SQLException sql){
    		out.println(sql);
    	 }
     }
     %>
