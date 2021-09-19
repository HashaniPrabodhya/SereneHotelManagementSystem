package roomManagement;


public class Room {
	private String roomNo;
	private int floorNo;
	private String roomType;
	private int beds;
	private int maxAdults;
	private int maxChild;
	private double price;
	private String roomStatus;
	


public Room(String roomNo, int floorNo, String roomType, int beds, int maxAdults, int maxChild, double price,
			 String roomStatus) {
		super();
		this.roomNo = roomNo;
		this.floorNo = floorNo;
		this.roomType = roomType;
		this.beds = beds;
		this.maxAdults = maxAdults;
		this.maxChild = maxChild;
		this.price = price;
		this.roomStatus = roomStatus;
	}



public Room(double price, String roomStatus) {
	super();
	this.price = price;
	this.roomStatus = roomStatus;
}



public String getRoomNo() {
	return roomNo;
}


public void setRoomNo(String roomNo) {
	this.roomNo = roomNo;
}


public int getFloorNo() {
	return floorNo;
}


public void setFloorNo(int floorNo) {
	this.floorNo = floorNo;
}


public String getRoomType() {
	return roomType;
}


public void setRoomType(String roomType) {
	this.roomType = roomType;
}


public int getMaxAdults() {
	return maxAdults;
}


public void setMaxAdults(int maxAdults) {
	this.maxAdults = maxAdults;
}


public int getMaxChild() {
	return maxChild;
}


public void setMaxChild(int maxChild) {
	this.maxChild = maxChild;
}


public double getPrice() {
	return price;
}


public void setPrice(double price) {
	this.price = price;
}



public String getRoomStatus() {
	return roomStatus;
}


public void setRoomStatus(String roomStatus) {
	this.roomStatus = roomStatus;
}



public int getBeds() {
	return beds;
}



public void setBeds(int beds) {
	this.beds = beds;
}

	
	

}
