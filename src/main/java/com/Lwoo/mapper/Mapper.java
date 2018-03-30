package com.Lwoo.mapper;

import java.util.List;

import com.Lwoo.pojo.Admin;

public interface Mapper<T> {
	public void add(T t);
	public void delete(int id);
	public T get(int id);
	public void update(T t);
	public List<T> list();
	public int count();
	public T findByUsername(String username);
	public T checkLogin(String username,String password);
}
