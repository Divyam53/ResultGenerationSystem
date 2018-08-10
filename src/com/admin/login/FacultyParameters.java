package com.admin.login;

public class FacultyParameters{ 
	private String fac_name; 
	private String fac_id;
	private String fac_pwd;
	private String fac_email;
	private String fac_mobile;
	private String fac_file;
	public boolean valid; 


	public void setFacId(String newId) { 
		fac_id=newId; 
	}
	public void setFacName(String newName) { 
		fac_name = newName; 
	} 

	public void setFacPassword(String newPassword) { 
		fac_pwd = newPassword; 
	} 
	public void setFacEmail(String newEmail) { 
		fac_email = newEmail; 
	}
	public void setFacMobile(String newMobile) { 
		fac_mobile = newMobile; 
	}
	public void setFileName(String newFileName) { 
		fac_file = newFileName; 
	}
	
	public String getFacId() { 
		return fac_id; 
	} 
	public String getFacName(){ 
		return fac_name; 
	} 

	public String getFacPassword() { 
		return fac_pwd; 
	} 

	public String getFacEmail() { 
		return fac_email; 
	} 
	public String getFacMobile() { 
		return fac_mobile; 
	} 
	public String getFileName() { 
		return fac_file; 
	} 


	public boolean isValid() { 
		return valid; 
	} 

	public void setValid(boolean newValid){
		valid = newValid; 
	} 
	public void removeName() {
		fac_name = null;
	}
	public void removeId() {
		fac_id= null;
	}
}  
