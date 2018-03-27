package com.Lwoo.mapper;

import java.util.List;

import com.Lwoo.pojo.Category;

public interface CategoryMapper extends Mapper<Category> {
	public List<Category> getCatagoryList();
	
}
