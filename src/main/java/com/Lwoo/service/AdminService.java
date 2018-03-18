package com.Lwoo.service;

import java.util.List;

import com.Lwoo.pojo.Admin;

public interface AdminService {
	List<Admin> list();
	public Admin get(int id);
	public void update(Admin admin);
    public void delete(Admin admin);
    public void add(Admin admin);
}
