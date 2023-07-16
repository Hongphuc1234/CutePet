package com.fa.demomvc.entity;



import java.sql.Date;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "comment")
@Entity
public class Comment {
     @Id
     @GeneratedValue(strategy = GenerationType.IDENTITY)
     private Long commentID;
     @Column(name = "[content]", columnDefinition = "ntext",unique = false, nullable = false)
     private String content;     
     @Column(name = "AccountID", columnDefinition = "int",unique = false, nullable = false)
     private int AccountID;    
     @Column(name = "customername", columnDefinition = "nvarchar(50)",unique = false, nullable = false)
     private String customername;    
     @Column(name = "ProductID", columnDefinition = "int",unique = false, nullable = false)
     private int ProductID;     
     @Column(name = "parentID", columnDefinition = "int",unique = false, nullable = false)
     private int parentID;  
     @DateTimeFormat(pattern = "yyyy-MM-dd")
     @Column(name = "create_Date", columnDefinition = "date",unique = false, nullable = false)
     private Date create_Date;
     
     public Comment() {
        // TODO Auto-generated constructor stub
    }



   public Long getCommentID() {
        return commentID;
    }



   public void setCommentID(Long commentID) {
        this.commentID = commentID;
    }



   public String getContent() {
        return content;
    }



   public void setContent(String content) {
        this.content = content;
    }



   public int getAccountID() {
        return AccountID;
    }



   public void setAccountID(int accoutID) {
        AccountID = accoutID;
    }



   public String getCustomername() {
        return customername;
    }



   public void setCustomername(String customername) {
        this.customername = customername;
    }



   public int getProductID() {
        return ProductID;
    }



   public void setProductID(int productID) {
        ProductID = productID;
    }



   public int getParentID() {
        return parentID;
    }



   public void setParentID(int parentID) {
        this.parentID = parentID;
    }



   public Date getCreate_Date() {
        return create_Date;
    }



   public void setCreate_Date(Date create_Date) {
        this.create_Date = create_Date;
    }
     
}