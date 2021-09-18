package staffManagment;

import java.io.IOException;
import java.util.List;

 import java.sql.DriverManager;
 import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 int sid = Integer.parseInt(request.getParameter("sid"));	
		 String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
	   
	    int phone = Integer.parseInt(request.getParameter("phone"));
	    String nic = request.getParameter("nic");
	    String address = request.getParameter("address");
	    double salary = Double.parseDouble(request.getParameter("salary"));
	    String job = request.getParameter("job");
	    String dep = request.getParameter("dep");
		
		boolean isTrue;
		
        isTrue = StaffDBUtil.insertstaff (sid, fname, lname, dob, gender, email, phone, nic, address, salary, job, dep);
 
          if(isTrue == true) {
        	  
        	  RequestDispatcher dis1 = request.getRequestDispatcher("success.jsp");
        	  dis1.forward(request, response);
          }else {
        	          	  RequestDispatcher dis2 = request.getRequestDispatcher("unsuccess.jsp");
        	  dis2.forward(request, response);

	}

	}
}
