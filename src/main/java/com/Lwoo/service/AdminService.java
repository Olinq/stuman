package com.Lwoo.service;

import java.util.List;

import com.Lwoo.pojo.Admin;

public interface AdminService extends BaseService<Admin>{
	public Admin checkLogin(String username,String password);
	public Admin findByEmail(String email);
	public Admin getLock(int lock);
}
