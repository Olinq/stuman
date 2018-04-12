package com.Lwoo.mapper;

import java.util.List;

import com.Lwoo.pojo.Comment;

public interface CommentMapper extends Mapper<Comment>{
	public List<Comment> listNewer(int limit);
}
