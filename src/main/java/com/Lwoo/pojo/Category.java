package com.Lwoo.pojo;

import java.util.List;

public class Category {
    private Integer id;

    private String category;
    List<Asso> list;
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

	public List<Asso> getList() {
		return list;
	}

	public void setList(List<Asso> list) {
		this.list = list;
	}
}