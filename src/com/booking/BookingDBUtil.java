package com.booking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookingDBUtil {

	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	
	
	public static List<Booking>getBookings(String userName){
		ArrayList<Booking>booking=new ArrayList();
		
		String url = "jdbc:mysql://localhost:3306/hotel?autoReconnect=true&useSSL=false";
		String user = "root";
		String password = "root123";
		
		try {
			
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="select * from booking where userName='"+userName+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int bookingId=rs.getInt(1);
				String customerName=rs.getString(2);
				String accommodationType=rs.getString(3);
				String fromDate=rs.getString(4);
				String toDate=rs.getString(5);
				String noNights=rs.getString(6);
				String noAdults=rs.getString(7);
				String noChildren=rs.getString(8);
				String phone=rs.getString(9);
				String uName=rs.getString(10);
				
				Booking bookings =new Booking(bookingId,customerName,accommodationType,fromDate,toDate,noNights,noAdults,noChildren,phone,uName);
				booking.add(bookings);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return booking;
		

		
	}
	
	public static boolean insertBooking(String customerName, String accomodationType, String fromDate, String toDate,String noNights, String noAdults,
			String noChildren, String phone, String userName) {
		
		boolean isSuccess=false;

		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="insert into booking values (0,'" +customerName+"', '" +accomodationType+"', '" + fromDate+"', '" + toDate+"', '" + noNights+"','" + noAdults+"','" + noChildren+"', '" + phone+"', '" + userName+"')";
			
			
			
			int rs=stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	/*public boolean updateBooking(Booking booking)throws SQLException{
		

		
		String sql="UPDATE booking SET customerName=?,accomodationType=?,from=?,to=?,noNights=?,noAdults=?,noChildren=?,phone=?";
		sql+="WHERE bookingId=?";
		
		
		
		
	}
/*public  boolean updateBooking(String bookingId,String customerName, String accomodationType, String from, String to, String noNights, String noAdults,
			String noChildren, String phone, String userName) {
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="update booking set customerName='" +customerName+"', accomodationType='" +accomodationType+"', from='" + from+"', to='" + to+"', noNights='" + noNights+"',noAdults='" + noAdults+"',noChildren='" + noChildren+"', phone='" + phone+"', userName='" + userName+"'"+
			"where bookingId='"+bookingId;
			int rs=stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess=true;
				
			}else {
				isSuccess=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}*/
	
	public static List<Booking>getBookingDetails(String bookingId){
		
		int converId=Integer.parseInt(bookingId);
		
		ArrayList<Booking>bookings=new ArrayList<>();
		
		try {
			
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="select * from booking where bookingId='"+bookingId+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int bookingsId=rs.getInt(1);
				String customerName=rs.getString(2);
				String accommodationType=rs.getString(3);
				String fromDate=rs.getString(4);
				String toDate=rs.getString(5);
				String noNights=rs.getString(6);
				String noAdults=rs.getString(7);
				String noChildren=rs.getString(8);
				String phone=rs.getString(9);
				String uName=rs.getString(10);
				
				Booking Bookings =new Booking(bookingsId,customerName,accommodationType,fromDate,toDate,noNights,noAdults,noChildren,phone,uName);
				bookings.add(Bookings);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bookings;
	}
	
	public static boolean deleteBooking(String  bookingId) {
		
		int convId=Integer.parseInt(bookingId);
		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="delete from booking where bookingId='"+bookingId+"'";
			int r=stmt.executeUpdate(sql);
			
			if(r > 0) {
				isSuccess=true;
				
			}
			else {
				isSuccess=false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	
	public static List<inquiry>getInquiry(String fullName){
		ArrayList<inquiry>Inquiry=new ArrayList();
		
		String url = "jdbc:mysql://localhost:3306/hotel?autoReconnect=true&useSSL=false";
		String user = "root";
		String password = "root123";
		
		try {
			
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="select * from inquiry where fName='"+fullName;
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int inquiryId=rs.getInt(1);
				String fName=rs.getString(2);
				String lName=rs.getString(3);
				String email=rs.getString(4);
				String mobile=rs.getString(5);
				String nationality=rs.getString(6);
				String message=rs.getString(7);
				
				inquiry Message=new inquiry(inquiryId,fName,lName,email,mobile,nationality,message);
				Inquiry.add(Message);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return Inquiry;
		

		
	}
	
	
	public static boolean insertInquiry(String fName,String lName,String email,String mobile,String nationality,String message) {
		
		boolean isSuccess=false;
		
		try {
			con=DBConnect.getConnection();
			stmt=con.createStatement();
			String sql="insert into inquiry values(0,'"+fName+"','"+lName+"','"+email+"','"+mobile+"','"+nationality+"','"+message+"')";
			int rs=stmt.executeUpdate(sql);
			
			if(rs > 0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	
	
	
}
