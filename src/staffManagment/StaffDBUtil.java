package staffManagment;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager;

public class StaffDBUtil {
	

	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;	
    
  /*  
  public static boolean validate(String username, String password){
		
		
		 try {
			con = DBConnect.getConnection();
			stmt = con.createStatement();
			String sql = "select * from staff_details where username='"+username+"' and password='"+password+"'";
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
		

	public static List<Staff> getStaff() {	
	
		ArrayList<Staff> staff = new ArrayList<>();
		
		//validate
		try {
             
			 con = DBConnect.getConnection();
			 stmt = con.createStatement();
			 String sql = "select * from staff_details";
			 rs = stmt.executeQuery(sql);
		
			 while (rs.next()) {
					int sid = rs.getInt(1);
					String fname = rs.getString(2);
					String job =rs.getString(11);
					String dep = rs.getString(12);
					double salary = rs.getString(10);
										
					Staff s = new Staff(sid,fname,job,dep,salary);
					staff.add(s);
				}
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return user;
	}
 

	*/
    public static boolean insertstaff(int sid, String fname,String lname, String dob, String gender,String email, int phone, String nic, 
    		String address, double salary, String job, String dep) {
    	
    	boolean isSuccess = false;
    	
    	String url = "jdbc:mysql://localhost:3306/staff_managment";
    	String user = "root";
    	String pass = "jami1998";
    	try {
          
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    	    String sql = "insert into staff_managment.staff_details values (0,'"+fname+"','"+lname+"','"+dob+"','"+gender+"','"+email+"',+phone+,'"+nic+"','"+address+"',+salary+ ,'"+job+"''"+dep+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
    
 /*   public static boolean updateuser(String id,String name, String nic, String email, String phone, String username, String password, String vehicleType, String registerNo) {
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "update user set name='"+name+"',email='"+email+"',phone='"+phone+"',username='"+username+"',password='"+password+"',vehicleType='"+vehicleType+"',registerNo='"+registerNo+"'"
    				+ "where id='"+id+"'";
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

    public static List<Staff> getStaffDetails(String sid) {
    	
    	int convertedID = Integer.parseInt(sid);//String value convert to integer
    	
    	ArrayList<Staff> stf = new ArrayList<>();
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from staff_details ";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			
    			int sid = rs.getInt(1);
    			String fname = rs.getString(2);
    			String job = rs.getString(3);
    			String dep = rs.getString(4);
    			String salary = rs.getString(5);
    			
    			Staff s = new Staff(id,name,job,dep,salary);
    			stf.add(s);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return stf;	
    }
    
   
    public static boolean deleteStaff(String sid) {
    	
    	int convSId = Integer.parseInt(sid);
    	
    	try {
    		
    		con = DBConnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "delete from staff_details where sid='"+convSId+"'";
    		int r = stmt.executeUpdate(sql);
    		
    		if (r > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
      */ 
    
}
