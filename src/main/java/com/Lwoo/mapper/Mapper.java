package com.Lwoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface Mapper<T> {
	public int add(T t);
	public void delete(int id);
	public T get(int id);
	public void update(T t);
	public List<T> list();
	public int count();
	public T findByUsername(String username);
	public T checkLogin(@Param("username")String username,@Param("password")String password);
	public List<T> search(String findData);
}
