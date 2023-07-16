package com.fa.demomvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.entity.notificationAccount;
import com.fa.demomvc.repository.AccountRepository;
import com.fa.demomvc.repository.ProductRepository;
@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountRepository productRepository;
	
	@Override
	@Transactional
	public Account checkpass(int AccountID) {
		return productRepository.checkpass(AccountID);
		
	}
	@Override
	@Transactional
	public void saveOrUpdateAccount(Account account) {
		productRepository.saveOrUpdateAccount(account);
	}
	
	@Override
	@Transactional
	public void saveOrUpdatenoti(notificationAccount notificationAccount) {
		productRepository.saveOrUpdatenoti(notificationAccount);
	}
	
	@Override
	@Transactional
	public Account findAccById(int AccountID) {
		return productRepository.findAccById(AccountID);
	}
	
	@Override
	@Transactional
	public List<notificationAccount> findnoti(int AccountID) {
		return productRepository.findnoti(AccountID);
	}
	
	@Override
	@Transactional
	public Account Login(String Username) {
		return productRepository.Login(Username);
		
	}
	@Override
	@Transactional
	public List<buy> findbuy(int SelerID) {
		return productRepository.findbuy(SelerID);
	}
	
	@Override
	@Transactional
	public buy findcart(int buyID) {
		return productRepository.findcart(buyID);
	}
	
	@Override
	@Transactional
	public List<Account> findAll() {
		return productRepository.findAll();
	}
	@Override
	@Transactional
	public void deleteAccount(int[] id) {
		productRepository.deleteAccount(id);
		
	}
	@Override
	@Transactional
	public List<buy> findcus(int CusID) {
		return productRepository.findcus(CusID);
	}
}
