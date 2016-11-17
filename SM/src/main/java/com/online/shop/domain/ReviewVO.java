package com.online.shop.domain;

import java.util.Date;

public class ReviewVO {

	private int rev_no;
	private String b_id;
	private String rev_title;
	private String rev_content;
	private Date rev_regdate;
	private int p_no;
	
	public ReviewVO() {}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getRev_title() {
		return rev_title;
	}

	public void setRev_title(String rev_title) {
		this.rev_title = rev_title;
	}

	public String getRev_content() {
		return rev_content;
	}

	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}

	public Date getRev_regdate() {
		return rev_regdate;
	}

	public void setRev_regdate(Date rev_regdate) {
		this.rev_regdate = rev_regdate;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	
	
}
