package com.booking;

public class inquiry {
	private int inquiryId;
	private String fName;
	private String lName;
	private String email;
	private String mobile;
	private String nationality;
	private String message;
	
	public inquiry(int inquiryId, String fName, String lName, String email, String mobile, String nationality,
			String message) {
		super();
		this.inquiryId = inquiryId;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.mobile = mobile;
		this.nationality = nationality;
		this.message = message;
	}

	public int getInquiryId() {
		return inquiryId;
	}

	public String getfName() {
		return fName;
	}

	public String getlName() {
		return lName;
	}

	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}

	public String getNationality() {
		return nationality;
	}

	public String getMessage() {
		return message;
	}

	
	
	
}
