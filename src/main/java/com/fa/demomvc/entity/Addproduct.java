package com.fa.demomvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Addproduct {
	 @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
     private Long ProductIDA;
	  @Column(name = "ProductnameA", columnDefinition = "nvarchar(500)",unique = false, nullable = false)
     private String ProductnameA;
	  @Column(name = "CategoryID", columnDefinition = "int",unique = false, nullable = false)
     private int CategoryID;
	  @Column(name = "DescriptionA", columnDefinition = "ntext",unique = false, nullable = false)
     private String DescriptionA;
	  @Column(name = "imgA", columnDefinition = "nvarchar(1000)",unique = false, nullable = false)
     private String imgA;
	  @Column(name = "priceA", columnDefinition = "int",unique = false, nullable = false)
     private int priceA;
	  @Column(name = "AccountID", columnDefinition = "int",unique = false, nullable = false)
     private int AccountID;
	  @Column(name = "soluong", columnDefinition = "int",unique = false, nullable = false)
	     private int soluong;
	  public Addproduct() {
         super();
     }
	public Addproduct(Long productIDA, String productnameA, int categoryID, String descriptionA, String imgA,
			int priceA, int accountID, int soluong) {
		super();
		ProductIDA = productIDA;
		ProductnameA = productnameA;
		CategoryID = categoryID;
		DescriptionA = descriptionA;
		this.imgA = imgA;
		this.priceA = priceA;
		AccountID = accountID;
		this.soluong = soluong;
	}
	public Long getProductIDA() {
		return ProductIDA;
	}
	public void setProductIDA(Long productIDA) {
		ProductIDA = productIDA;
	}
	public String getProductnameA() {
		return ProductnameA;
	}
	public void setProductnameA(String productnameA) {
		ProductnameA = productnameA;
	}
	public int getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}
	public String getDescriptionA() {
		return DescriptionA;
	}
	public void setDescriptionA(String descriptionA) {
		DescriptionA = descriptionA;
	}
	public String getImgA() {
		return imgA;
	}
	public void setImgA(String imgA) {
		this.imgA = imgA;
	}
	public int getPriceA() {
		return priceA;
	}
	public void setPriceA(int priceA) {
		this.priceA = priceA;
	}
	public int getAccountID() {
		return AccountID;
	}
	public void setAccountID(int accountID) {
		AccountID = accountID;
	}
	public int getSoluong() {
		return soluong;
	}
	public void setSoluong(int soluong) {
		this.soluong = soluong;
	}
	@Override
	public String toString() {
		return "Addproduct [ProductIDA=" + ProductIDA + ", ProductnameA=" + ProductnameA + ", CategoryID=" + CategoryID
				+ ", DescriptionA=" + DescriptionA + ", imgA=" + imgA + ", priceA=" + priceA + ", AccountID="
				+ AccountID + ", soluong=" + soluong + "]";
	}
	
}
