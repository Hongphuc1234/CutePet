package com.fa.demomvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.Addproduct;
import com.fa.demomvc.entity.Product;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.page.PageAble;

public interface ProductService {


	public List<Product> findByName(PageAble pageAble);
	public List<Product> findNew(PageAble pageAble);
	public List<Product> SearchByName(String keyword,PageAble pageAble) ;
		public void saveOrUpdate(Product product);
		public Product findById(int ProductID);
		public void delete(int ProductID);
	
		
		
		public List<Product> SearchByCateogory(int categoryID,PageAble pageAble) ;
		public Addproduct findaddpro(Long ProductIDA);
		public void saveOrUpdateAddproduct(Addproduct addproduct);
		public int totalPages(PageAble pageAble);
		public int totalPagesearch( String keyword ,PageAble pageAble);
		public int totalPagescateo(int categoryID,PageAble pageAble);
		public List<Addproduct> findAllAdd();
		public long countproduct(int accountID);
		public void deleteProduct(int [] id);
        public void deleteAddProduct(Long id);
        public List<Product> SearchByAccountID(int AccountID) ;
        public Product findIDByName(String Productname);
        public void saveOrUpdateBuy(buy buy);
        public int isAdmin(int id);
        public String saveImg(MultipartFile image);
       
}
