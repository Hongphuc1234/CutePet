package com.fa.demomvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.Addproduct;
import com.fa.demomvc.entity.Product;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.page.PageAble;
import com.fa.demomvc.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductRepository productRepository;
	
	@Override
	@Transactional
	public List<Product> findNew(PageAble pageAble) {
		return productRepository.findNew(pageAble);
	}
	@Override
	@Transactional
	public List<Product> findByName(PageAble pageAble) {
		return productRepository.findByName(pageAble);
	}
	
	@Override
	@Transactional
    public void deleteProduct(int[] id) {
        productRepository.deleteProduct(id);
        
    }




    @Override
    @Transactional
    public void deleteAddProduct(Long id) {
        
        productRepository.deleteAddProduct(id);
    }
	
	
	
	@Override
	@Transactional
	public List<Product> SearchByName(String keyword ,PageAble pageAble) {
	    return productRepository.SearchByName(keyword,pageAble);
	}
	@Override
	@Transactional
	public void saveOrUpdate(Product product) {
		productRepository.saveOrUpdate(product);
	}
	
	
	//save account
	
	@Override
	@Transactional
	public Product findById(int ProductID) {
		return productRepository.findById(ProductID);
	}
	@Override
	@Transactional
	public void delete(int ProductID) {
		Product product = productRepository.findById(ProductID);
		if (product != null) {
			productRepository.delete(product);
		}
	}
	
	


	@Override
	@Transactional
	public List<Product> SearchByCateogory(int categoryID,PageAble pageAble) {
		
		return productRepository.SearchByCateogory(categoryID,pageAble);
	}


	@Override
	@Transactional
	public List<Product> SearchByAccountID(int AccountID) {
		
		return productRepository.SearchByAccountID(AccountID);
	}



	@Override
	@Transactional
	public void saveOrUpdateAddproduct(Addproduct addproduct) {
		productRepository.saveOrUpdateAddproduct(addproduct);
		
	}
	@Override
	@Transactional
	public int totalPages(PageAble pageAble) {
		long totalRecord = productRepository.count();
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	@Override
	@Transactional
	public int totalPagesearch(String keyword,PageAble pageAble) {
		long totalRecord = productRepository.countsearch(keyword);
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	@Override
	@Transactional
	public int totalPagescateo(int categoryID,PageAble pageAble) {
		long totalRecord = productRepository.countcateo(categoryID);
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}

	@Override
	@Transactional
	public List<Addproduct> findAllAdd() {
		return productRepository.findAllAdd();
	}


	@Override
	@Transactional
	public long countproduct(int accountID) {
		
		return productRepository.countproduct(accountID);
	}
	@Override
	@Transactional
	public Addproduct findaddpro(Long ProductIDA) {
		return productRepository.findaddpro(ProductIDA);
	}
	@Override
	@Transactional
	public Product findIDByName(String Productname) {
		return productRepository.findIDByName(Productname);
	}
	@Override
	@Transactional
	public void saveOrUpdateBuy(buy buy) {
		productRepository.saveOrUpdateBuy(buy);
		
	}
	@Override
	@Transactional
    public int isAdmin(int id) {
        // TODO Auto-generated method stub
        return productRepository.isAdmin(id);
    }
	@Override
	public String saveImg(MultipartFile image) {
		return productRepository.saveImg(image);
	}
	
}
