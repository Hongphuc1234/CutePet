package com.fa.demomvc.repository;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.management.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.Addproduct;
import com.fa.demomvc.entity.Product;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.page.PageAble;

@Repository
public class ProductRepositoryImpl implements ProductRepository {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Product> findNew(PageAble pageAble) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> products = session.createQuery("SELECT p FROM Product p where p.status != 0 ORDER BY p.ProductID DESC ", Product.class)
				.setMaxResults(4).getResultList();
		for (Product a : products) {
			System.out.println(a);
		}
		return products;
	}
	
	@Override
	public List<Product> findByName(PageAble pageAble) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> products = session.createQuery("SELECT p FROM Product p where p.status != 0", Product.class).setFirstResult(pageAble.getOffset())// Offset
				.setMaxResults(pageAble.getSize()).getResultList();
		for (Product a : products) {
			System.out.println(a);
		}
		return products;
	}



	@Override
	public List<Product> SearchByName(String keyword , PageAble pageAble) {
		Session session = sessionFactory.getCurrentSession();

		List<Product> products = session
				.createQuery("SELECT p FROM Product p WHERE  p.status != 0 and p.Productname LIKE '%' || :keyword || '%'")
				.setParameter("keyword", keyword).setFirstResult(pageAble.getOffset())// Offset
				.setMaxResults(pageAble.getSize()).getResultList(); // limit.getResultList();

		return products;

	}

	@Override
	public void saveOrUpdate(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(product);
	}

	//save account

	
	@Override
	public Product findById(int ProductID) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(Product.class,ProductID);
	}

	@Override
	public void delete(Product product) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(product);
	}

	

	@Override
	public List<Product> SearchByCateogory(int categoryID,PageAble pageAble) {
		Session session = sessionFactory.getCurrentSession();
		List<Product> products = session
				.createQuery("SELECT p FROM Product p WHERE p.status != 0 and p.CategoryID = ?", Product.class)
				.setParameter(0,categoryID).setFirstResult(pageAble.getOffset())// Offset
				.setMaxResults(pageAble.getSize()).getResultList();

		return products;
	}
	@Override
	public List<Product> SearchByAccountID(int AccountID ) {
		Session session = sessionFactory.getCurrentSession();

		List<Product> products = session
				.createQuery("SELECT p FROM Product p WHERE p.AccountID = ?", Product.class)
				.setParameter(0,AccountID).getResultList();

		return products;
	}
	

	@Override
	public void saveOrUpdateAddproduct(Addproduct addproduct) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(addproduct);
	}
		
		@Override
		public void saveOrUpdateBuy(buy buy) {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(buy);
		
	}
	@Override
	public long count() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT COUNT(*) FROM Product p", Long.class).getSingleResult();
	}

	@Override
	public List<Addproduct> findAllAdd() {
		Session session = sessionFactory.getCurrentSession();
		List<Addproduct> addp = session.createQuery("SELECT A FROM Addproduct A", Addproduct.class).getResultList();
		return addp;
	}
	@Override
	public long countproduct(int accountID) {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("SELECT COUNT(*) FROM Product p WHERE p.AccountID = ?",Long.class).setParameter(0,accountID).getSingleResult();
	}
	@Override
    public void deleteProduct(int[] id) {
        Session session =sessionFactory.getCurrentSession();
        for (int i = 0; i < id.length; i++) {
            Product com = session.byId(Product.class).load(id[i]);
            if (com == null) {
                break;
            } else {
                session.delete(com);
            }
        }
       
}



   @Override
    public void deleteAddProduct(Long id) {
        Session session =sessionFactory.getCurrentSession();
        Addproduct com = session.byId(Addproduct.class).load(id);
        session.delete(com);
    }

@Override
public Addproduct findaddpro(Long ProductIDA) {
	Session session = sessionFactory.getCurrentSession();
	return session.createQuery("SELECT a FROM Addproduct a WHERE a.ProductIDA = ?",Addproduct.class).setParameter(0,ProductIDA).getSingleResult();
}

@Override
public Product findIDByName(String Productname) {
	Session session = sessionFactory.getCurrentSession();
	return session.find(Product.class,Productname);
}
@Override

public int isAdmin(int id) {
    Session session = sessionFactory.getCurrentSession();
    String sql = "select * from Account where AccountID ="+id+"";
     NativeQuery<Account> nativequeryHql = session.createNativeQuery(sql, Account.class);
     Account acc= nativequeryHql.getSingleResult();
     int a = acc.getIsAdmin();
    return a;
}

@Override
public long countcateo(int categoryID) {
	Session session = sessionFactory.getCurrentSession();
	return session.createQuery("SELECT COUNT(*)FROM Product p WHERE p.status != 0 and p.CategoryID = ?", Long.class)
			.setParameter(0,categoryID).getSingleResult();
}

@Override
public long countsearch(String keyword) {
	Session session = sessionFactory.getCurrentSession();
	return session.createQuery("SELECT COUNT(*)FROM Product p WHERE p.status != 0 and p.Productname LIKE '%' || :keyword || '%'",Long.class).setParameter("keyword",keyword).getSingleResult();
}

@Override
public String saveImg(MultipartFile image)  {
    // TODO Auto-generated method stub
      if( image != null ) {
          try {
              byte[] bytes = image.getBytes();
              String rootPath = System.getProperty("catalina.home");
              File dir = new File(rootPath+File.separator+"user/img");
              if (!dir.exists()) {
                dir.mkdir();
            }
              
              String name = String.valueOf( new Date().getTime()+".jpg");
              File serverFile = new File(dir.getAbsoluteFile()+File.separator+name);
              System.out.println("Path of img on server: "+ serverFile.getParent());
              BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
              stream.write(bytes);
              stream.close();
              return name;
        } catch (IOException e) {
            // TODO: handle exception
            System.out.println("====error upload file: " +e.getMessage());
        }
          
      }else {
          System.out.println("file not exits");
      }
     return null;
}

}
