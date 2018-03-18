package com.Lwoo.mapper;

import java.util.List;

import com.Lwoo.pojo.Admin;

public interface AdminMapper {
	public void add(Admin admin);
	public void delete(int id);
	public Admin get(int id);
	public void update(Admin admin);
	public List<Admin> list();
	public int count();
}
