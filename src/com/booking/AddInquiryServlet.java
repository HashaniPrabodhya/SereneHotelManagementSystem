package com.booking;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/AddInquiryServlet")
public class AddInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String fName=request.getParameter("fName");
		String lName=request.getParameter("lName");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String nationality=request.getParameter("nationality");
		String message=request.getParameter("message");
		
		boolean isTrue;
		
		isTrue=BookingDBUtil.insertInquiry(fName, lName, email, mobile, nationality, message);
		
		if(isTrue == true) {
			
			RequestDispatcher dis=request.getRequestDispatcher("InquirySuccess.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1=request.getRequestDispatcher("InquiryUnsuccess.jsp");
			dis1.forward(request, response);
		}
	}

}
