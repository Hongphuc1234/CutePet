package com.fa.demomvc.repository;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.Addproduct;
import com.fa.demomvc.entity.Product;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.page.PageAble;

public interface ProductRepository {

	public List<Product> findByName(PageAble pageAble);
	public List<Product> findNew(PageAble pageAble);
	public List<Product> SearchByName(String keyword,PageAble pageAble) ;
	public List<Product> SearchByCateogory(int categoryID,PageAble pageAble) ;
	public void saveOrUpdate(Product product);
	public Product findById(int ProductID);
	public Addproduct findaddpro(Long ProductIDA);
	public void delete(Product product);
	public Product findIDByName(String Productname);

	public List<Addproduct> findAllAdd();
	
	public void saveOrUpdateAddproduct(Addproduct addproduct);
	public long count();
	public List<Product> SearchByAccountID(int AccountID) ;
	public long countproduct(int accountID);
	public long countcateo(int categoryID);
	public long countsearch(String keyword);
	  public void deleteProduct(int [] id);
      public void deleteAddProduct(Long id);
      
      public void saveOrUpdateBuy(buy buy);
      public int isAdmin(int id);
      public String saveImg(MultipartFile image);
}
