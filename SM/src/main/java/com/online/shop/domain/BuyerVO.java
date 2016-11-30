package com.online.shop.domain;

import java.util.Date;

public class BuyerVO{

	// 멤버 변수
	private int b_no;
	private String b_id;
	private String b_pw;
	private String b_name;
	private int b_gender;
	private String b_birth;
	private String b_phone;
	private String b_email;
	private String b_zip;
	private String b_addr;
	private Date b_reg;
	private int b_mile;
	
	// 생성자
	public BuyerVO() {
		
	}

	// getter/setter 메소드
	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_pw() {
		return b_pw;
	}

	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public int getB_gender() {
		return b_gender;
	}

	public void setB_gender(int b_gender) {
		this.b_gender = b_gender;
	}

	public String getB_birth() {
		return b_birth;
	}

	public void setB_birth(String b_birth) {
		this.b_birth = b_birth;
	}

	public String getB_phone() {
		return b_phone;
	}

	public void setB_phone(String b_phone) {
		this.b_phone = b_phone;
	}

	public String getB_email() {
		return b_email;
	}

	public void setB_email(String b_email) {
		this.b_email = b_email;
	}

	public String getB_zip() {
		return b_zip;
	}

	public void setB_zip(String b_zip) {
		this.b_zip = b_zip;
	}

	public String getB_addr() {
		return b_addr;
	}

	public void setB_addr(String b_addr) {
		this.b_addr = b_addr;
	}

	public Date getB_reg() {
		return b_reg;
	}

	public void setB_reg(Date b_reg) {
		this.b_reg = b_reg;
	}

	public int getB_mile() {
		return b_mile;
	}

	public void setB_mile(int b_mile) {
		this.b_mile = b_mile;
	}
	
} // end class BuyerVO
