package com.online.shop.domain;

import java.util.Date;

public class helpVO {
	private int h_no;
	private String h_title;
	private String h_content;
	private String h_userid;
	private Date h_reg;
	
	public int getH_no() {
		return h_no;
	}
	public String getH_title() {
		return h_title;
	}
	public void setH_title(String h_title) {
		this.h_title = h_title;
	}
	public String getH_content() {
		return h_content;
	}
	public void setH_content(String h_content) {
		this.h_content = h_content;
	}
	public String getH_userid() {
		return h_userid;
	}
	public void setH_userid(String h_userid) {
		this.h_userid = h_userid;
	}
	public Date getH_reg() {
		return h_reg;
	}
	public void setH_reg(Date h_reg) {
		this.h_reg = h_reg;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
		
}
