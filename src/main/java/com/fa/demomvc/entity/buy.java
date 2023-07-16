package com.fa.demomvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class buy {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int buyID;
	 @Column(name = "ProductID", columnDefinition = "int",unique = false, nullable = false)
     private int ProductID;
	 @Column(name = "Productname", columnDefinition = "nvarchar(1000)",unique = false, nullable = false)
     private String Productname;
	 @Column(name = "CusID", columnDefinition = "int",unique = false, nullable = false)
     private int CusID;
	 @Column(name = "SelerID", columnDefinition = "int",unique = false, nullable = false)
     private int SelerID;
	 @Column(name = "phone", columnDefinition = "nvarchar(10)",unique = false, nullable = false)
     private String phone;
	 @Column(name = "Productprice", columnDefinition = "int",unique = false, nullable = false)
     private int Productprice;
	 @Column(name = "diachi", columnDefinition = "nvarchar(2000)",unique = false, nullable = false)
     private String diachi;
	 @Column(name = "soluongmua", columnDefinition = "int",unique = false, nullable = false)
     private int soluongmua;
	 @Column(name = "cusname", columnDefinition = "nvarchar(500)",unique = false, nullable = false)
     private String cusname;
	
	public buy() {
		super();
		// TODO Auto-generated constructor stub
	}

	public buy(int buyID, int productID, String productname, int cusID, int selerID, String phone, int productprice,
			String diachi, int soluongmua, String cusname) {
		super();
		this.buyID = buyID;
		ProductID = productID;
		Productname = productname;
		CusID = cusID;
		SelerID = selerID;
		this.phone = phone;
		Productprice = productprice;
		this.diachi = diachi;
		this.soluongmua = soluongmua;
		this.cusname = cusname;
	}

	public int getBuyID() {
		return buyID;
	}

	public void setBuyID(int buyID) {
		this.buyID = buyID;
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

	public int getCusID() {
		return CusID;
	}

	public void setCusID(int cusID) {
		CusID = cusID;
	}

	public int getSelerID() {
		return SelerID;
	}

	public void setSelerID(int selerID) {
		SelerID = selerID;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getProductprice() {
		return Productprice;
	}

	public void setProductprice(int productprice) {
		Productprice = productprice;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public int getSoluongmua() {
		return soluongmua;
	}

	public void setSoluongmua(int soluongmua) {
		this.soluongmua = soluongmua;
	}

	public String getCusname() {
		return cusname;
	}

	public void setCusname(String cusname) {
		this.cusname = cusname;
	}

	@Override
	public String toString() {
		return "buy [buyID=" + buyID + ", ProductID=" + ProductID + ", Productname=" + Productname + ", CusID=" + CusID
				+ ", SelerID=" + SelerID + ", phone=" + phone + ", Productprice=" + Productprice + ", diachi=" + diachi
				+ ", soluongmua=" + soluongmua + ", cusname=" + cusname + "]";
	}
	
	
}
