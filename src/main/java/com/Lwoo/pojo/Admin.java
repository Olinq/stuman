package com.Lwoo.pojo;

import java.util.List;

public class Admin {
	private int id;
	private String username;
	private String password;
	private String email;
	List<Asso> assos;
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
	public List<Asso> getAssos() {
		return assos;
	}
	public void setAssos(List<Asso> assos) {
		this.assos = assos;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", username=" + username + ", password=" + password + ", assos=" + assos + "]";
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
