package com.Lwoo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.News;

public interface NewsService {
	public int add(News t);
	public void delete(int id);
	public News get(int id);
	public void update(News t);
	
	public List<News> list(int isannou);
	public List<News>  listNewer(int total,int isannou);
	public List<News> search(String findData,int isannou);
	public List<News> listByAid(int id,int isannou);
	public List<News> searchByAid(String findData,int aid,@Param("isannou")int isannou);
}
