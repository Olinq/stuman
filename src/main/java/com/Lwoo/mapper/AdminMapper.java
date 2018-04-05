package com.Lwoo.mapper;

import com.Lwoo.pojo.Admin;

public interface AdminMapper extends Mapper<Admin>{
	public Admin findByEmail(String email);
	public Admin Lock(int lock);
}
