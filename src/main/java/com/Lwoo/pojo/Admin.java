package com.Lwoo.pojo;

import java.util.List;

public class Admin {
	private int id;
	private String username;
	private String password;
	private String email;
	private int assoId;
	private int lock;
	public int getLock() {
		return lock;
	}
	public void setLock(int lock) {
		this.lock = lock;
	}
	public int getAssoId() {
		return assoId;
	}
	public void setAssoId(int assoId) {
		this.assoId = assoId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", assoId=" + assoId + ", lock=" + lock + "]";
	}
	
}
