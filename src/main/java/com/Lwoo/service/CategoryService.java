package com.Lwoo.service;

import java.util.List;

import com.Lwoo.pojo.Category;

public interface CategoryService extends BaseService<Category> {
	public List<Category> getCatagoryList();
}
