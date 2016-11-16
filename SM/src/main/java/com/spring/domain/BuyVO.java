package com.spring.domain;

import java.util.Date;

public class BuyVO {

	private int buy_no;
	private String b_id;
	private int p_no;
	private String p_name;
	private int p_price;
	private int buy_cnt;
	private String o_cont;
	private Date buy_date;
	private String delivery_zip;
	private String delivery_addr;
	private int buy_status;
	
	public BuyVO() {}

	public int getBuy_no() {
		return buy_no;
	}

	public void setBuy_no(int buy_no) {
		this.buy_no = buy_no;
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public int getP_no() {
		return p_no;
	}

	public void setP_no(int p_no) {
		this.p_no = p_no;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getBuy_cnt() {
		return buy_cnt;
	}

	public void setBuy_cnt(int buy_cnt) {
		this.buy_cnt = buy_cnt;
	}

	public String getO_cont() {
		return o_cont;
	}

	public void setO_cont(String o_cont) {
		this.o_cont = o_cont;
	}

	public Date getBuy_date() {
		return buy_date;
	}

	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}

	public String getDelivery_zip() {
		return delivery_zip;
	}

	public void setDelivery_zip(String delivery_zip) {
		this.delivery_zip = delivery_zip;
	}

	public String getDelivery_addr() {
		return delivery_addr;
	}

	public void setDelivery_addr(String delivery_addr) {
		this.delivery_addr = delivery_addr;
	}

	public int getBuy_status() {
		return buy_status;
	}

	public void setBuy_status(int buy_status) {
		this.buy_status = buy_status;
	}
	
	
	
	
}
