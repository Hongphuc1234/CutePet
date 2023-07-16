package com.fa.demomvc.service;

import java.util.List;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.entity.notificationAccount;

public interface AccountService {
	public Account checkpass(int  AccountID);
	public Account findAccById(int AccountID);
	public void saveOrUpdateAccount(Account account);
	public Account Login(String Username);
	public List<notificationAccount> findnoti(int AccountID);
	public List<Account> findAll();
	public List<buy> findbuy(int SelerID);
	public void saveOrUpdatenoti(notificationAccount notificationAccount);
	public void deleteAccount(int[] id);
	public List<buy> findcus(int CusID);
	public buy findcart(int buyID);
}
