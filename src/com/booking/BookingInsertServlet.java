package com.booking;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BookingInsertServlet")
public class BookingInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String customerName=request.getParameter("customerName");
		String accomodationType=request.getParameter("accomodationType");
		String fromDate=request.getParameter("fromDate");
		String toDate	=request.getParameter("toDate");	
		String noNights=request.getParameter("noNights");
		String noAdults=request.getParameter("noAdults");
		String noChildren=request.getParameter("noChildren");
		String phone=request.getParameter("phone");
		String userName=request.getParameter("userName");

		boolean isTrue;
		
		isTrue=BookingDBUtil.insertBooking(customerName, accomodationType, fromDate, toDate, noNights, noAdults, noChildren, phone, userName);
		
		if(isTrue == true) {
			RequestDispatcher dis=request.getRequestDispatcher("Bookings.jsp");
			dis.forward(request, response);
		}else {
			RequestDispatcher dis1=request.getRequestDispatcher("bookingUnsuccess.jsp");
			dis1.forward(request, response);
		}
	}

}
