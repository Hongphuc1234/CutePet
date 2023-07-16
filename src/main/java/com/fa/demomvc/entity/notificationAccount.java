package com.fa.demomvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class notificationAccount {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int notiID;
	 @Column(name = "AccountID", columnDefinition = "int",unique = false, nullable = false)
     private int AccountID;
	 @Column(name = "content", columnDefinition = "Ntext",unique = false, nullable = false)
     private String content;
	 @Column(name = "ProductID", columnDefinition = "int",unique = false, nullable = false)
	     private int ProductID; 
	  @Column(name = "Productname", columnDefinition = "nvarchar(1000)",unique = false, nullable = false)
	     private String Productname;
	  @Column(name = "stt", columnDefinition = "int",unique = false, nullable = false)
	     private int stt;
	public notificationAccount() {
		super();
	}
	public notificationAccount(int notiID, int accountID, String content, int productID, String productname, int stt) {
		super();
		this.notiID = notiID;
		AccountID = accountID;
		this.content = content;
		ProductID = productID;
		Productname = productname;
		this.stt = stt;
	}
	public int getNotiID() {
		return notiID;
	}
	public void setNotiID(int notiID) {
		this.notiID = notiID;
	}
	public int getAccountID() {
		return AccountID;
	}
	public void setAccountID(int accountID) {
		AccountID = accountID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductname() {
		return Productname;
	}
	public void setProductname(String productname) {
		Productname = productname;
	}
	public int getStt() {
		return stt;
	}
	public void setStt(int stt) {
		this.stt = stt;
	}
	@Override
	public String toString() {
		return "notificationAccount [notiID=" + notiID + ", AccountID=" + AccountID + ", content=" + content
				+ ", ProductID=" + ProductID + ", Productname=" + Productname + ", stt=" + stt + "]";
	}
	
}
