package com.fa.demomvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Account {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int AccountID;
	
	@Column(name = "Username", columnDefinition = "nvarchar(50)",unique = false, nullable = false)
    private String Username;  
	
	@Column(name = "Pass", columnDefinition = "nvarchar(max)",unique = false, nullable = false)
    private String Pass;
	
	@Column(name = "Customername", columnDefinition = "nvarchar(50)",unique = false, nullable = false)
    private String Customername;
	
	@Column(name = "Phone", columnDefinition = "nvarchar(10)",unique = false, nullable = false)
    private String Phone;
	
	
	@Column(name = "isAdmin", columnDefinition = "int",unique = false, nullable = false)
    private int isAdmin;
	public Account() {
		super();
		
	}
	public Account(int accountID, String username, String pass, String customername, String phone, int isAdmin) {
		super();
		AccountID = accountID;
		Username = username;
		Pass = pass;
		Customername = customername;
		Phone = phone;
		this.isAdmin = isAdmin;
	}
	public int getAccountID() {
		return AccountID;
	}
	public void setAccountID(int accountID) {
		AccountID = accountID;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getPass() {
		return Pass;
	}
	public void setPass(String pass) {
		Pass = pass;
	}
	public String getCustomername() {
		return Customername;
	}
	public void setCustomername(String customername) {
		Customername = customername;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	@Override
	public String toString() {
		return "Account [AccountID=" + AccountID + ", Username=" + Username + ", Pass=" + Pass + ", Customername="
				+ Customername + ", Phone=" + Phone + ", isAdmin=" + isAdmin + "]";
	}
	
}
