package com.fa.demomvc.repository;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.Product;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.entity.notificationAccount;
@Repository
public class AccountRepositoryImpl implements AccountRepository{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Account checkpass(int AccountID) {
		try {

			Session session = sessionFactory.getCurrentSession();
//		Account acc= null;
			Account acc = session
					.createQuery("select a from Account a where a.AccountID = ? ", Account.class)
					.setParameter(0, AccountID).getSingleResult();
			
			
			return acc;
		} catch (Exception e) {
			return null;
		}
	}
	@Override
	public Account findAccById(int AccountID) {
		Session session = sessionFactory.getCurrentSession();
		return session.find(Account.class, AccountID);
	}
	
	@Override
	public List<notificationAccount> findnoti(int AccountID) {
		Session session = sessionFactory.getCurrentSession();
		List<notificationAccount> notilist = session
				.createQuery("SELECT n FROM notificationAccount n WHERE n.AccountID = ? ORDER BY n.notiID DESC ", notificationAccount.class)
				.setParameter(0,AccountID).getResultList();
		return notilist;
	}
	
	
	@Override
	public List<buy> findbuy(int SelerID) {
		Session session = sessionFactory.getCurrentSession();
		List<buy> buylist = session
				.createQuery("SELECT b FROM buy b WHERE b.SelerID = ?",buy.class)
				.setParameter(0,SelerID).getResultList();
		return buylist;
	}
	
	@Override
	public buy findcart(int buyID) {
		Session session = sessionFactory.getCurrentSession();
		return  session
				.createQuery("SELECT b FROM buy b WHERE b.buyID = ?",buy.class)
				.setParameter(0,buyID).getSingleResult();
		
	}
	
	@Override
	public List<buy> findcus(int CusID) {
		Session session = sessionFactory.getCurrentSession();
		List<buy> buylist = session
				.createQuery("SELECT b FROM buy b WHERE b.CusID = ?",buy.class)
				.setParameter(0,CusID).getResultList();
		return buylist;
	}
	
	@Override
	public Account Login(String Username) {
		try {

			Session session = sessionFactory.getCurrentSession();
//		Account acc= null;
			Account acc = session
					.createQuery("select a from Account a where a.Username = ?", Account.class)
					.setParameter(0, Username).getSingleResult();
			

			return acc;
		} catch (Exception e) {
			return null;
		}

	}
	
	@Override
	public void saveOrUpdateAccount(Account account) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(account);
	}
	@Override
	public void saveOrUpdatenoti(notificationAccount notificationAccount) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(notificationAccount);
	}
	@Override
	public List<Account> findAll() {
		Session session = sessionFactory.getCurrentSession();
		List<Account> acccc = session.createQuery("SELECT a FROM Account a", Account.class).getResultList();
		return acccc;
	}
	@Override
	public void deleteAccount(int[] id) {
		Session session =sessionFactory.getCurrentSession();
        for(int i=0;i< id.length;i++){
           Account com = session.byId(Account.class).load(id[i]);
            session.delete(com);
        }
	}
}
