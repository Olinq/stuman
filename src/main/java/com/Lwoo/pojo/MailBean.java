package com.Lwoo.pojo;

import java.util.Arrays;

public class MailBean {
	private String from; //发件人   
    private String fromName;    
    private String[] toEmails; //收件人   
    private String subject;  //主题
    private String context;//内容
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public String[] getToEmails() {
		return toEmails;
	}
	public void setToEmails(String[] toEmails) {
		this.toEmails = toEmails;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	@Override
	public String toString() {
		return "MailBean [from=" + from + ", fromName=" + fromName + ", toEmails=" + Arrays.toString(toEmails)
				+ ", subject=" + subject + ", context=" + context + "]";
	} 
    
}
