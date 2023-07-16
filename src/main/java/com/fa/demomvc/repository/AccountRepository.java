package com.fa.demomvc.repository;

import java.util.List;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.entity.notificationAccount;

public interface AccountRepository {
	public Account checkpass(int  AccountID);
	public Account findAccById(int AccountID);
	public void saveOrUpdateAccount(Account account);
	public void saveOrUpdatenoti(notificationAccount notificationAccount);
	public Account Login(String Username);
	public List<notificationAccount> findnoti(int AccountID);
	public List<Account> findAll();
	public List<buy> findbuy(int SelerID);
	public buy findcart(int buyID);
	public List<buy> findcus(int CusID);
	public void deleteAccount( int[] id);
	
}
