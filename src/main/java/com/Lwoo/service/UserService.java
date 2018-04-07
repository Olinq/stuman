package com.Lwoo.service;

import java.util.List;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.User;

public interface UserService extends BaseService<User> {

	public User findByEmail(String email);
	public List<User> getListByAssoId(int assoId);
	public User checkLogin(String username,String password);
}
