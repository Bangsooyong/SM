package com.spring.domain;

public class ImageVO {
	
	private int i_no;
	private String i_img;
	private String i_cont;
	private int p_no;
	
	
	public ImageVO() {}


	public ImageVO(int i_no, String i_img, String i_cont, int p_no) {
		this.i_no = i_no;
		this.i_img = i_img;
		this.i_cont = i_cont;
		this.p_no = p_no;
	}


	public int getI_no() {
		return i_no;
	}


	public void setI_no(int i_no) {
		this.i_no = i_no;
	}


	public String getI_img() {
		return i_img;
	}


	public void setI_img(String i_img) {
		this.i_img = i_img;
	}


	public String getI_cont() {
		return i_cont;
	}


	public void setI_cont(String i_cont) {
		this.i_cont = i_cont;
	}


	public int getP_no() {
		return p_no;
	}


	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	
	
	
	
	
} // end class
