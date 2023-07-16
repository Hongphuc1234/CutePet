package com.fa.demomvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Range;

@Entity
public class Product {
	 @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
     private int ProductID;
	  @Column(name = "Productname", columnDefinition = "nvarchar(500)",unique = false, nullable = false)
     private String Productname;
	  @Column(name = "CategoryID", columnDefinition = "int",unique = false, nullable = false)
     private int CategoryID;
	  @Column(name = "Description", columnDefinition = "ntext",unique = false, nullable = false)
     private String Description;
	  @Column(name = "status", columnDefinition = "int",unique = false, nullable = false)
     private int status;
	  @Column(name = "img", columnDefinition = "nvarchar(1000)",unique = false, nullable = false)
     private String img;
	  @Column(name = "price", columnDefinition = "int",unique = false, nullable = false)
     private int price;
	  @Column(name = "AccountID", columnDefinition = "int",unique = false, nullable = false)
     private int AccountID;
	  @Column(name = "datatime", columnDefinition = "nvarchar(500)",unique = false, nullable = false)
	     private String datatime;
	  public Product() {
         super();
     }
	public Product(int productID, String productname, int categoryID, String description, int status, String img,
			int price, int accountID, String datatime) {
		super();
		ProductID = productID;
		Productname = productname;
		CategoryID = categoryID;
		Description = description;
		this.status = status;
		this.img = img;
		this.price = price;
		AccountID = accountID;
		this.datatime = datatime;
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
	public int getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAccountID() {
		return AccountID;
	}
	public void setAccountID(int accountID) {
		AccountID = accountID;
	}
	public String getDatatime() {
		return datatime;
	}
	public void setDatatime(String datatime) {
		this.datatime = datatime;
	}
	@Override
	public String toString() {
		return "Product [ProductID=" + ProductID + ", Productname=" + Productname + ", CategoryID=" + CategoryID
				+ ", Description=" + Description + ", status=" + status + ", img=" + img + ", price=" + price
				+ ", AccountID=" + AccountID + ", datatime=" + datatime + "]";
	}
	
	 

}
