package com.booking;

public class Booking {

	private int bookingId;
	private String customerName;
	private String accomodationType;
	private String fromDate;
	private String toDate;
	private String noNights;
	private String noAdults;
	private String noChildren;
	private String phone;
	private String userName;
	
	public Booking(int bookingId,String customerName, String accomodationType, String fromDate, String toDate, String noNights, String noAdults,
			String noChildren, String phone, String userName) {
		super();
		this.bookingId=bookingId;
		this.customerName = customerName;
		this.accomodationType = accomodationType;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.noNights = noNights;
		this.noAdults = noAdults;
		this.noChildren = noChildren;
		this.phone = phone;
		this.userName = userName;
	}
	public int getBookingId() {
		return bookingId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public String getAccomodationType() {
		return accomodationType;
	}
	public String getFromDate() {
		return fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public String getNoNights() {
		return noNights;
	}
	public String getNoAdults() {
		return noAdults;
	}
	public String getNoChildren() {
		return noChildren;
	}
	public String getPhone() {
		return phone;
	}
	public String getUserName() {
		return userName;
	}
	
	
}
