package com.Lwoo.service;

import java.util.List;

import com.Lwoo.pojo.Comment;
import com.Lwoo.pojo.News;

public interface CommentService extends BaseService<Comment> {
	public List<Comment> listNewer(int limit);
}
