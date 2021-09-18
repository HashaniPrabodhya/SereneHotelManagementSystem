package staffManagment;

import com.mysql.jdbc.StringUtils;

public class Staff {
    private int sid;
    private String fname;
    private String lname;
    private String dob;
    private String gen;
    private String email;
    private int phone;
    private String nic;
    private String address;
    private double salary;
    private String job;
    private String dep;
    
    public Staff (int sid, String fname,String lname,String dob, String gen,String email, int phone, String nic, 
    		String address, double salary, String job, String dep) {
    	
	this.sid = sid;
	this.fname = fname;
	this.lname = lname;
	this.dob = dob;
	this.gen = gen;
	this.email = email;
	this.phone = phone;
	this.nic = nic;
	this.address = address;
	this.salary = salary;
	this.job = job;
	this.dep = dep;
	
    }

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGen() {
		return gen;
	}

	public void setGen(String gen) {
		this.gen = gen;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getNic() {
		return nic;
	}

	public void setNic(String nic) {
		this.nic = nic;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getDep() {
		return dep;
	}

	public void setDep(String dep) {
		this.dep = dep;
	}

	
   
}
