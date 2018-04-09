package com.Lwoo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Lwoo.pojo.User;

public interface UserMapper extends Mapper<User> {
	public User findByEmail(String email);
	public List<User> getListByAssoId(int assoId);
	public List<User> getListNostatu(@Param("assoId")int assoId,@Param("statu")int statu);
}
