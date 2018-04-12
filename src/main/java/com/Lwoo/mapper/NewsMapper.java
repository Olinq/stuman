package com.Lwoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.News;

public interface NewsMapper{
	public int add(News t);
	public void delete(int id);
	public News get(int id);
	public void update(News t);
	public List<News>  listNewer(@Param("total")int total,@Param("isannou")int isannou);
	public List<News> list(int isannou);
	public List<News> search(@Param("findData")String findData,@Param("isannou")int isannou);
	public List<News> listByAid(@Param("id")int id,@Param("isannou")int isannou);
	public List<News> searchByAid(@Param("findData")String findData,@Param("aid")int aid,@Param("isannou")int isannou);
}
