package com.fa.demomvc.controller;



import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.Iterator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



import com.fa.demomvc.entity.Addproduct;
import com.fa.demomvc.entity.Comment;
import com.fa.demomvc.entity.Product;
import com.fa.demomvc.entity.notificationAccount;
import com.fa.demomvc.service.AccountService;
import com.fa.demomvc.service.CommentService;
import com.fa.demomvc.service.ProductService;





@RestController
public class ApiController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CommentService commentService;
    @Autowired
    private AccountService accountService;
    



   
    @PostMapping("/addproduct")
    public void AddProduct(@RequestBody Addproduct addproduct) {
    	
        Product pro = new Product();
        notificationAccount notti = new notificationAccount();
        pro.setProductname(addproduct.getProductnameA());
        pro.setCategoryID(addproduct.getCategoryID());
        pro.setDescription(addproduct.getDescriptionA());
        String str = addproduct.getImgA();
        int length= str.length();
   
        pro.setImg(addproduct.getImgA());
    
        pro.setAccountID(addproduct.getAccountID());
        pro.setPrice(addproduct.getPriceA());
        pro.setStatus(addproduct.getSoluong());
        LocalDateTime current = LocalDateTime.now();
	    //sử dụng class DateTimeFormatter và class FormatStyle để định dạng ngày giờ hiện tại theo dạng localized
	    DateTimeFormatter formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM);
	    //gán ngày giờ sau khi format cho chuỗi formatted
	    String formatted = current.format(formatter);
	pro.setDatatime(formatted);
        productService.saveOrUpdate(pro);
        notti.setProductID(pro.getProductID());
        notti.setAccountID(pro.getAccountID());
        notti.setContent("Đã được phê duyệt");
        notti.setStt(1);
        notti.setProductname(pro.getProductname());
        accountService.saveOrUpdatenoti(notti);
		}
    
    @PostMapping("/api")
    public long  add (@RequestBody Comment com, HttpServletRequest request){
        Product produ = productService.findById(com.getProductID());
        HttpSession session = request.getSession();
        String b = com.getContent();
        String escapedHTML = StringEscapeUtils.escapeHtml4(b);
        com.setContent(escapedHTML);
        if (com.getContent() != "") {
            if (session.getAttribute("acc") == null && session.getAttribute("accA") == null) {
                return 0;
            } else {
                Cookie cookie = null;
                Cookie[] cookies = null;
                cookies = request.getCookies();
                cookie = cookies[1];
                String a = cookie.getValue();
                int accId = Integer.parseInt(a);
                if (accId == com.getAccountID()) {
                	notificationAccount notti = new notificationAccount();
                    notti.setProductID(produ.getProductID());
                    notti.setAccountID(produ.getAccountID());
                    notti.setContent("Đã bình luận về");
                    notti.setStt(1);
                    notti.setProductname(produ.getProductname());
                    accountService.saveOrUpdatenoti(notti);
                    return commentService.insertComment(com);
                }
                return 0;
            }
        } else {
            return 0;
        }
        
    }
   @DeleteMapping("/api/{id}")
    public ResponseEntity<?> delete(HttpServletRequest request, @PathVariable("id") Long id) {
        HttpSession session = request.getSession();



       if (session.getAttribute("acc") == null && session.getAttribute("accA") == null) {
            return ResponseEntity.ok().body("Vui long dang nhap");
        } else {
            Cookie cookie = null;
            Cookie[] cookies = null;
            cookies = request.getCookies();
            cookie = cookies[1];
            String a = cookie.getValue();
            int accId = Integer.parseInt(a);
            if ((accId == commentService.findIdUserComment(id)) || (productService.isAdmin(accId)) == 1) {
                commentService.deleteComment(id);
                return ResponseEntity.ok().body("Comment has been deleted successfully.");
            }
            return ResponseEntity.ok().body("Comment cann't deleted");
        }



   }



   @PutMapping("/api/{id}")
    public ResponseEntity<?> update(HttpServletRequest request, @RequestBody Comment com, @PathVariable("id") Long id) {
        HttpSession session = request.getSession();
        String b = com.getContent();
        String escapedHTML = StringEscapeUtils.escapeHtml4(b);
        com.setContent(escapedHTML);
        if(com.getContent() != "") {
        if (session.getAttribute("acc") == null && session.getAttribute("accA") == null) {
            return ResponseEntity.ok().body("Vui long dang nhap");
        } else {
            Cookie cookie = null;
            Cookie[] cookies = null;
            cookies = request.getCookies();
            cookie = cookies[1];
            String a = cookie.getValue();
            int accId = Integer.parseInt(a);
            if ((accId == commentService.findIdUserComment(id)) || (productService.isAdmin(accId)) == 1) {
                commentService.updateComment(com, id);
                return ResponseEntity.ok().body("Comment has been updated successfully.");
            }
            return ResponseEntity.ok().body("Comment cann't update");
        }
        }else {
            return ResponseEntity.ok().body("Comment is null");
        }
    }



   @DeleteMapping("/api/admin/topic")
    public ResponseEntity<?> deleteAdmin(@RequestBody int[] id) {
        productService.deleteProduct(id);
        return ResponseEntity.ok().body("has been deleted successfully.");
    }

   @DeleteMapping("/api/admin/user")
   public ResponseEntity<?> deleteUserAdmin(@RequestBody int[] id) {
      accountService.deleteAccount(id);
       return ResponseEntity.ok().body(" has been deleted successfully.");
   }

   @DeleteMapping("/deleteAddProduct/{id}")
    public ResponseEntity<?> deleteAddProduct(@PathVariable("id") Long id) {
        productService.deleteAddProduct(id);
        return ResponseEntity.ok().body("has been deleted successfully.");
    }
   @DeleteMapping("/delAddProduct/{id}")
   public ResponseEntity<?> delAddProduct(@PathVariable("id") Long id) {
   		
         productService.deleteAddProduct(id);
         return ResponseEntity.ok().body("has been deleted successfully.");
      }
}
