package com.Lwoo.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.Admin;
import com.Lwoo.pojo.User;

public interface UserService extends BaseService<User> {

	public User findByEmail(String email);
	public List<User> getListByAssoId(int assoId);
	public User checkLogin(String username,String password);
	public List<User> getListNostatu(int assoId,int statu);
	public List<Map<String, String>> exportExcelInfo(int tid);
}
