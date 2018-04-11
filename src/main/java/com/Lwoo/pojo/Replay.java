package com.Lwoo.pojo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Replay {
	private int id;
	private int uid;
	private int commId;
	private String replay;
	private User user;
 	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	private Date time;
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
	public int getCommId() {
		return commId;
	}
	public void setCommId(int commId) {
		this.commId = commId;
	}
	public String getReplay() {
		return replay;
	}
	public void setReplay(String replay) {
		this.replay = replay;
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
		return "Replay [id=" + id + ", uid=" + uid + ", commId=" + commId + ", replay=" + replay + ", user=" + user
				+ ", time=" + time + "]";
	}
	
}
