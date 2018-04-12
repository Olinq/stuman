package com.Lwoo.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Comment {
	private int id;
	private int uid;
	private String comment;
	private Date time;
	private User user;
	private int totalReplay;
	private List<Replay> replays;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public List<Replay> getReplays() {
		return replays;
	}
	public void setReplays(List<Replay> replays) {
		this.replays = replays;
	}
	public int getTotalReplay() {
		totalReplay=replays.size();
		return totalReplay;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getTime() {
		//转换数据库时间格式
   	 	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
        String formatDate = df.format(time);  
        
       return formatDate;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", uid=" + uid + ", comment=" + comment + ", time=" + time + ", user=" + user
				+ "\n\t, replays=" + replays + "]";
	}
	
}
