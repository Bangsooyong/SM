package com.spring.domain;

import java.util.Date;

public class ReviewRVO {

	private int rev_r_no;
	private String s_id;
	private String rev_r_title;
	private String rev_r_cont;
	private Date rev_r_reg;
	private int rev_no;
	
	public ReviewRVO() {}

	public int getRev_r_no() {
		return rev_r_no;
	}

	public void setRev_r_no(int rev_r_no) {
		this.rev_r_no = rev_r_no;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getRev_r_title() {
		return rev_r_title;
	}

	public void setRev_r_title(String rev_r_title) {
		this.rev_r_title = rev_r_title;
	}

	public String getRev_r_cont() {
		return rev_r_cont;
	}

	public void setRev_r_cont(String rev_r_cont) {
		this.rev_r_cont = rev_r_cont;
	}

	public Date getRev_r_reg() {
		return rev_r_reg;
	}

	public void setRev_r_reg(Date rev_r_reg) {
		this.rev_r_reg = rev_r_reg;
	}

	public int getRev_no() {
		return rev_no;
	}

	public void setRev_no(int rev_no) {
		this.rev_no = rev_no;
	}
	
	
	
	
}
