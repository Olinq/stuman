package com.Lwoo.pojo;

import java.util.Date;

public class Cmment {
	private int id;
	private int uid;
	private String comment;
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
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "comment [id=" + id + ", uid=" + uid + ", comment=" + comment + ", time=" + time + "]";
	}
	
}
