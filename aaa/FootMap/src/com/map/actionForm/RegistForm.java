package com.map.actionForm;

import org.apache.struts.action.ActionForm;

public class RegistForm extends ActionForm{
	
	private String firstname;
	private String password;
	private String email;
	
	
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		
		return (this.getFirstname()+"-"+this.getPassword()+"-"+this.getEmail());
	}
	
	
}
