package roomManagement;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RoomUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	
	
	//validate  admin login
	
public static boolean validate(String admin_un, String admin_pw) {
		
		try {
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			String sql = "select * from admin where admin_un='"+admin_un+"' and admin_pw='"+admin_pw+"'";
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	/*
		
	//insert room to the database
	
	public static boolean insertRoom(String roomNo, int floorNo, String roomType, int beds, int maxAdults, int maxChild, double price, String roomStatus) {
		
		boolean isSuccess = false;
		
		
		
			
			try {
				
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "insert into rooms values ('"+roomNo+"', "+floorNo+", '"+roomType+"', "+beds+", "+maxAdults+", "+maxChild+", "+price+", '"+roomStatus+"')";
				int rs = stmt.executeUpdate(sql);
				
				
				//check data insertion is Success 
				if(rs > 0) {
					isSuccess = true;
				}
				
				else {
					isSuccess = false;
				}
				
			}
			
			
			catch(Exception e) {
				e.printStackTrace();
			}
		
		return isSuccess;
	}
	
		
	
	//get selected room  details
	
	private static final String ROOM_DETAILS =  "select * from rooms where roomNo = ?";
	
	
		public static List<Room> selectRoom(String roomNo){
			
			
			//int pId = Integer.parseInt(roomNo);
			
			ArrayList<Room> room= new ArrayList<>();
			
		
			try(Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(ROOM_DETAILS)) {
				
				
				ps.setString(1, roomNo);
				System.out.println(ps);
				ResultSet rs = ps.executeQuery();
			
			
			
				while(rs.next()) {
					
					int floorNo = rs.getInt(2);
					String roomType = rs.getString(3);
					int beds = rs.getInt(4);
					int maxAdults = rs.getInt(5);
					int maxChild = rs.getInt(6);
					double price = rs.getDouble(7);
					String roomStatus = rs.getString(8);
					
					
					Room r = new Room(roomNo, floorNo, roomType, beds, maxAdults, maxChild,price, roomStatus);
					
					room.add(r);
				}
				
				
				
			}
			catch(Exception e) {
				e.printStackTrace();
			
			}
			
			return room;
			
		}
		
	
	
	
	//update room details
	
	public static boolean updateBooking(String roomNo, int floorNo, String roomType, int beds, int maxAdults, int maxChild, double price, String roomStatus) {
		
		boolean isSuccess = false;
		
		
			
			try {

				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "update booking set floorNo="+floorNo+",roomType='"+roomType+"',beds="+beds+",maxAdults="+maxAdults+", maxChild="+maxChild+ ",price="+price+",roomStatus='"+roomStatus+"'"
	    				+ "where roomNo='"+roomNo+"'";
	    		int rs = stmt.executeUpdate(sql);
	    		
	    		if(rs > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
	    	}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	}
	
	
	
	//delete room
public static boolean deleteRoom(String roomNo) {
		
	boolean isSuccess=false;
	
	//int convtId= Integer.parseInt(bookingId);
		
		
			
			try {

				con = DBConnection.getConnection();
				stmt = con.createStatement();
				
				String sql = "delete from rooms  where roomNo='"+roomNo+"' and roomStatus!='Booked'";
	    		int r = stmt.executeUpdate(sql);
	    		
	    		if(r > 0) {
	    			isSuccess = true;
	    		}
	    		else {
	    			isSuccess = false;
	    		}
	    		
			}
	    	catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return isSuccess;
	}




		//get all room details

		private static final String ALL_ROOMS= "select * from rooms";

		
      public static List<Room> bookingDetailList(){
	
			List<Room> room= new ArrayList<>();
	
			try (Connection con = DBConnection.getConnection();
					PreparedStatement ps = con.prepareStatement(ALL_ROOMS)){
				
				
				System.out.println(ps);
				ResultSet re = ps.executeQuery();
				
				
				while(re.next()) {
					
					String roomNo= re.getString(1);
					int floorNo = re.getInt(2);
					String roomType = re.getString(3);
					int beds = re.getInt(4);
					int maxAdults = re.getInt(5);
					int maxChild = re.getInt(6);
					double price = re.getDouble(7);
					String roomstatus = re.getString(8);
					
					room.add(new Room(roomNo, floorNo, roomType, beds, maxAdults, maxChild, price, roomstatus));
					
				}
				
			}
			
			catch(Exception e){
				e.printStackTrace();
			}
			
			return room;
			
}

	*/
	
}
