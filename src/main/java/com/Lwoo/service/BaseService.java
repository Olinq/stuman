package com.Lwoo.service;

import java.util.List;

public interface BaseService<T> {
	List<T> list();
	public T get(int id);
	public void update(T t);
    public void delete(T t);
    public void add(T t);
    public T findByUsername(String username);
}
