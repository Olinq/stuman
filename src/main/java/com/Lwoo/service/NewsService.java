package com.Lwoo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.News;

public interface NewsService extends BaseService<News> {
	public List<News> listByAid(int id);
	public List<News> searchByAid(String findData,int aid);
	public List<News> listNewer(int limit,int isannou);
}
