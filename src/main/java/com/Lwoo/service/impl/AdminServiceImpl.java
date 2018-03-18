package com.Lwoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Lwoo.mapper.AdminMapper;
import com.Lwoo.pojo.Admin;
import com.Lwoo.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	AdminMapper adminMapper;

	@Override
	public List<Admin> list() {
		// TODO Auto-generated method stub
		return adminMapper.list();
	}

	@Override
	public void update(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.update(admin);
	}

	@Override
	public void delete(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.delete(admin.getId());
	}

	@Override
	public void add(Admin admin) {
		// TODO Auto-generated method stub
		adminMapper.add(admin);
	}

	@Override
	public Admin get(int id) {
		// TODO Auto-generated method stub
		return adminMapper.get(id);
	}
}
