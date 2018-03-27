package com.Lwoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Lwoo.mapper.CategoryMapper;
import com.Lwoo.pojo.Category;
import com.Lwoo.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	@Autowired
	CategoryMapper categoryMapper;

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
//		System.out.println(categoryMapper.list());
		return categoryMapper.list();
	}

	@Override
	public Category get(int id) {
		// TODO Auto-generated method stub
		return categoryMapper.get(id);
	}

	@Override
	public void update(Category t) {
		// TODO Auto-generated method stub
		categoryMapper.update(t);
	}

	@Override
	public void delete(Category t) {
		// TODO Auto-generated method stub
		categoryMapper.delete(t.getId());
	}

	@Override
	public void add(Category t) {
		// TODO Auto-generated method stub
		categoryMapper.add(t);
	}

	@Override
	public Category findByUsername(String username) {
		// TODO Auto-generated method stub
		return categoryMapper.findByUsername(username);
	}

	@Override
	public List<Category> getCatagoryList() {
		// TODO Auto-generated method stub
		return categoryMapper.getCatagoryList();
	}
}
