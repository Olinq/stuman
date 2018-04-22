package com.Lwoo.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Lwoo.mapper.UserMapper;
import com.Lwoo.pojo.User;
import com.Lwoo.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	
	@Override
	public List<User> list() {
		// TODO Auto-generated method stub
		return userMapper.list();
	}

	@Override
	public User get(int id) {
		// TODO Auto-generated method stub
		return userMapper.get(id);
	}

	@Override
	public void update(User t) {
		// TODO Auto-generated method stub
		userMapper.update(t);
	}

	@Override
	public void delete(User t) {
		// TODO Auto-generated method stub
		userMapper.delete(t.getId());
	}

	@Override
	public int add(User t) {
		// TODO Auto-generated method stub
		return userMapper.add(t);
	}

	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.findByUsername(username);
	}

	@Override
	public List<User> search(String fingData) {
		// TODO Auto-generated method stub
		return userMapper.search(fingData);
	}

	@Override
	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return userMapper.findByEmail(email);
	}

	@Override
	public List<User> getListByAssoId(int assoId) {
		// TODO Auto-generated method stub
		return userMapper.getListByAssoId(assoId);
	}

	@Override
	public User checkLogin(String username, String password) {
		// TODO Auto-generated method stub
		return userMapper.checkLogin(username, password);
	}

	@Override
	public List<User> getListNostatu(int assoId, int statu) {
		// TODO Auto-generated method stub
		return userMapper.getListNostatu(assoId, statu);
	}

	@Override
	public List<Map<String, String>> exportExcelInfo(int tid) {
		// TODO Auto-generated method stub
		List<User> list=null;
		if(tid==0){
			list = userMapper.list(); 
		}else{
			list = userMapper.getListByAssoId(tid);
		}
        List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();  
        for (User user : list) {  
        	 System.out.println("----------------"+user);
            Map<String, String> map = new HashMap<String, String>();  
            map.put("ID", user.getId()+"");  
            map.put("学号", user.getUsername());  
            map.put("姓名", user.getRealname());  
            map.put("性别", user.getSex());  
            map.put("Email", user.getEmail());  
            map.put("所属社团", user.getAsso().getTname()+"");  
            map.put("会员状态", user.getStatu()+"");  
            mapList.add(map);  
        }  
        return mapList;  
	}

}
