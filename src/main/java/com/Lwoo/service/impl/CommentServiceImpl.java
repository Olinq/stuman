package com.Lwoo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Lwoo.mapper.CommentMapper;
import com.Lwoo.pojo.Comment;
import com.Lwoo.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentMapper commentMapper;
	@Override
	public List<Comment> list() {
		// TODO Auto-generated method stub
		return commentMapper.list();
	}

	@Override
	public Comment get(int id) {
		// TODO Auto-generated method stub
		return commentMapper.get(id);
	}

	@Override
	public void update(Comment t) {
		// TODO Auto-generated method stub
		commentMapper.update(t);
	}

	@Override
	public void delete(Comment t) {
		// TODO Auto-generated method stub
		commentMapper.delete(t.getId());
	}

	@Override
	public void add(Comment t) {
		// TODO Auto-generated method stub
		commentMapper.add(t);
	}

	@Override
	public Comment findByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> search(String fingData) {
		// TODO Auto-generated method stub
		return commentMapper.search(fingData);
	}

}
