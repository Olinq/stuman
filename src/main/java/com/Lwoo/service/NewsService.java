package com.Lwoo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.News;

public interface NewsService extends BaseService<News> {
	public List<News> listByAid(int id);
	public List<News> searchByAid(String findData,int aid);
	public List<News> listNewer(int limit,int isannou);
	public List<News> list(int isannou);
	public List<News> searchType(String findData,int isannou);
	public List<News> searchByAssoId(int assoId,int isannou);
}
