package com.online.shop.domain;

import java.util.Date;

public class BuyVO {

	private int buy_no;//주문번호
	private String b_id;//구매자아이디
	private int p_no;//제품번호
	private String p_name;//제품명
	private int p_price;//제품가격
	private int buy_cnt;//선택한수량
	private String o_cont;//선택한옵션내용
	private Date buy_date;//주문일자
	private String delivery_zip;//우편번호
	private String delivery_addr;//주소
	private int buy_status;//주문상태
	
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