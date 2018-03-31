package com.Lwoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Lwoo.mapper.AssoMapper;
import com.Lwoo.pojo.Asso;
import com.Lwoo.service.AssoService;

@Service
public class AssoServiceImpl implements AssoService {
	@Autowired
	AssoMapper assoMapper;
	@Override
	public List<Asso> list() {
		// TODO Auto-generated method stub
		System.out.println("----AssoServiceImpl");
		return assoMapper.list();
	}

	@Override
	public Asso get(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Asso t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Asso t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void add(Asso t) {
		// TODO Auto-generated method stub

	}

	@Override
	public Asso findByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Asso> getListByCid(int cid) {
		// TODO Auto-generated method stub
		return assoMapper.getListByCid(cid);
	}

	@Override
	public List<Asso> search(String fingData) {
		// TODO Auto-generated method stub
		return null;
	}

}
