package com.Lwoo.pojo;

import java.util.List;

public class Category {
    private Integer id;

    private String category;
    List<Asso> assos;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

	public List<Asso> getAssos() {
		return assos;
	}

	public void setAssos(List<Asso> assos) {
		this.assos = assos;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", category=" + category + ", assos=" + assos + "]";
	}

}