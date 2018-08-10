package com.student.login;
public class UserBean{ 
	private String username; 
	private String password; 
	private String name; 
	private String id;
	private String fname;
	private String dob;
	private String program;
	public boolean valid; 


	public void setId(String newId) { 
		id=newId; 
	}
	public void setName(String newName) { 
		name = newName; 
	} 
	public void setUserName(String newUsername) { 
		username = newUsername; 
	} 

	public void setPassword(String newPassword) { 
		password = newPassword; 
	} 
	public void setFname(String newFname) { 
		fname = newFname; 
	}
	public void setDob(String newDob) { 
		dob = newDob; 
	}
	public void setProgram(String newProgram) { 
		program = newProgram; 
	}
	
	public String getId() { 
		return id; 
	} 
	public String getName(){ 
		return name; 
	} 

	public String getPassword() { 
		return password; 
	} 


	public String getUsername() { 
		return username; 
	} 
	
	public String getFname() { 
		return fname; 
	}
	public String getDob() { 
		return dob; 
	}
	public String getProgram() { 
		return program; 
	}



	public boolean isValid() { 
		return valid; 
	} 

	public void setValid(boolean newValid){
		valid = newValid; 
	} 
	public void removeName() {
		name = null;
	}
	public void removeId() {
		id= null;
	}
} 