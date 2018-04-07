package com.Lwoo.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class News {
    private Integer id;

    private Integer aid;

    private String title;

    private String author;

    private Date time;

    private Integer click;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
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

    public Integer getClick() {
        return click;
    }

    public void setClick(Integer click) {
        this.click = click;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

	@Override
	public String toString() {
		return "News [id=" + id + ", aid=" + aid + ", title=" + title + ", author=" + author + ", time=" + time
				+ ", click=" + click + ", content=" + content + "]";
	}
    
}