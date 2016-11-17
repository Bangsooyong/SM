package com.online.shop.domain;

import java.util.Date;

public class QnaVO {
	private int qno;
	private String bid;
	private String qtitle;
	private String qcontent;
	private Date qregdate;
	private int pno;
	public QnaVO() {}
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public Date getQregdate() {
		return qregdate;
	}
	public void setQregdate(Date qregdate) {
		this.qregdate = qregdate;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	
	
	
	
	
}
