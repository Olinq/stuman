package com.Lwoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Lwoo.mapper.NewsMapper;
import com.Lwoo.pojo.News;
import com.Lwoo.service.NewsService;
@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	NewsMapper newsMapper;
	@Override
	public List<News> list() {
		// TODO Auto-generated method stub
		return newsMapper.list();
	}

	@Override
	public News get(int id) {
		// TODO Auto-generated method stub
		return newsMapper.get(id);
	}

	@Override
	public void update(News t) {
		// TODO Auto-generated method stub
		newsMapper.update(t);
	}

	@Override
	public void delete(News t) {
		// TODO Auto-generated method stub
		newsMapper.delete(t.getId());
	}

	@Override
	public void add(News t) {
		// TODO Auto-generated method stub
		newsMapper.add(t);
	}

	@Override
	public News findByUsername(String username) {
		// TODO Auto-generated method stub
		return newsMapper.findByUsername(username);
	}

	@Override
	public List<News> search(String fingData) {
		// TODO Auto-generated method stub
		return null;
	}

}
