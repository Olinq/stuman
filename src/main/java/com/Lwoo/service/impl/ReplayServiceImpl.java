package com.Lwoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Lwoo.mapper.ReplayMapper;
import com.Lwoo.pojo.Replay;
import com.Lwoo.service.ReplayService;
@Service
public class ReplayServiceImpl implements ReplayService {
	
	@Autowired
	ReplayMapper replayMapper;
	
	@Override
	public List<Replay> list() {
		// TODO Auto-generated method stub
		return replayMapper.list();
	}

	@Override
	public Replay get(int id) {
		// TODO Auto-generated method stub
		return replayMapper.get(id);
	}

	@Override
	public void update(Replay t) {
		// TODO Auto-generated method stub
		replayMapper.update(t);
	}

	@Override
	public void delete(Replay t) {
		// TODO Auto-generated method stub
		replayMapper.delete(t.getId());
	}

	@Override
	public void add(Replay t) {
		// TODO Auto-generated method stub
		replayMapper.add(t);
	}

	@Override
	public Replay findByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Replay> search(String findData) {
		// TODO Auto-generated method stub
		return replayMapper.search(findData);
	}

}
