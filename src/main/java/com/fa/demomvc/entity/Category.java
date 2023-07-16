package com.fa.demomvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int CategoryID;
	@Column(name = "Categoryname", columnDefinition = "nvarchar(50)",unique = false, nullable = false)
	private String Categoryname;
	public Category() {
		super();
	}
	public Category(int categoryID, String categoryname) {
		super();
		CategoryID = categoryID;
		Categoryname = categoryname;
	}
	public int getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(int categoryID) {
		CategoryID = categoryID;
	}
	public String getCategoryname() {
		return Categoryname;
	}
	public void setCategoryname(String categoryname) {
		Categoryname = categoryname;
	}
	@Override
	public String toString() {
		return "Category [CategoryID=" + CategoryID + ", Categoryname=" + Categoryname + "]";
	}
	
}
