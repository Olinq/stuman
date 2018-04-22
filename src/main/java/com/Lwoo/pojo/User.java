package com.Lwoo.pojo;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String sex;

    private String email;
    private String uclass;
    public String getUclass() {
		return uclass;
	}

	public void setUclass(String uclass) {
		this.uclass = uclass;
	}

	private Integer statu;
    private String realname;
    private Integer assoId;
    private Asso asso;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }


    public Integer getStatu() {
        return statu;
    }

    public void setStatu(Integer statu) {
        this.statu = statu;
    }

    public Integer getAssoId() {
        return assoId;
    }

    public void setAssoId(Integer assoId) {
        this.assoId = assoId;
    }

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", sex=" + sex + ", email="
				+ email + ", uclass=" + uclass + ", statu=" + statu + ", realname=" + realname + ", assoId=" + assoId
				+ ", asso=" + asso + "]";
	}

	public Asso getAsso() {
		return asso;
	}

	public void setAsso(Asso asso) {
		this.asso = asso;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
	
}