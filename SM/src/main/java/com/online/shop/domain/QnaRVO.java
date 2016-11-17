package com.online.shop.domain;

import java.util.Date;

public class QnaRVO {
	private int qrno;
	private String sid;
	private String qrtitle;
	private String qrcontent;
	private Date qrregdate;
	private int qno;
	
	public QnaRVO() {}

	public int getQrno() {
		return qrno;
	}

	public void setQrno(int qrno) {
		this.qrno = qrno;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getQrtitle() {
		return qrtitle;
	}

	public void setQrtitle(String qrtitle) {
		this.qrtitle = qrtitle;
	}

	public String getQrcontent() {
		return qrcontent;
	}

	public void setQrcontent(String qrcontent) {
		this.qrcontent = qrcontent;
	}

	public Date getQrregdate() {
		return qrregdate;
	}

	public void setQrregdate(Date qrregdate) {
		this.qrregdate = qrregdate;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}
	

}
