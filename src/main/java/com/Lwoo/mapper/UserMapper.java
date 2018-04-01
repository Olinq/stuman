package com.Lwoo.mapper;

import java.util.List;

import com.Lwoo.pojo.User;

public interface UserMapper extends Mapper<User> {
	public User findByEmail(String email);
	public List<User> getListByAssoId(int assoId);
}
