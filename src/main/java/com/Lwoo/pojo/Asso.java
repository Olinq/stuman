package com.Lwoo.pojo;

public class Asso {
    private Integer id;

    private String tname;

    private String description;

    private String logo;
    public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	private Category category;

    private Integer cid;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo == null ? null : logo.trim();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

	@Override
	public String toString() {
		return "Asso [id=" + id + ", tname=" + tname + ", description=" + description + ", logo=" + logo + ", category="
				+ category + ", cid=" + cid + "]";
	}
    
}