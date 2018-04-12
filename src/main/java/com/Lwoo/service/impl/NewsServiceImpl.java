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
	public int add(News t) {
		// TODO Auto-generated method stub
		return newsMapper.add(t);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		newsMapper.delete(id);
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
	public List<News> list(int isannou) {
		// TODO Auto-generated method stub
		return newsMapper.list(isannou);
	}

	@Override
	public List<News> search(String findData, int isannou) {
		// TODO Auto-generated method stub
		return newsMapper.search(findData, isannou);
	}

	@Override
	public List<News> listByAid(int id, int isannou) {
		// TODO Auto-generated method stub
		return newsMapper.listByAid(id, isannou);
	}

	@Override
	public List<News> searchByAid(String findData, int aid, int isannou) {
		// TODO Auto-generated method stub
		return newsMapper.searchByAid(findData, aid, isannou);
	}

	@Override
	public List<News> listNewer(int total, int isannou) {
		// TODO Auto-generated method stub
		return newsMapper.listNewer(total, isannou);
	}

}
