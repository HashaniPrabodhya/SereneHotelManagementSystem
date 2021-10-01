package com.booking;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("bookingId");
		
		boolean isTrue;
		
		isTrue=BookingDBUtil.deleteBooking(id);
		
		if(isTrue==true) {
			RequestDispatcher dispatcher=request.getRequestDispatcher("AddBooking.jsp");
			dispatcher.forward(request, response);
		}
		else {
			List<Booking>bookingDetails=BookingDBUtil.getBookingDetails(id);
			request.setAttribute("bookingDetails", bookingDetails);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("Bookings.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}
