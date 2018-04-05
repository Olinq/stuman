package com.Lwoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.News;

public interface NewsMapper extends Mapper<News> {
	public List<News> listByAid(int id);
	public List<News> searchByAid(@Param("findData")String findData,@Param("aid")int aid);
}
