package com.board.vo;

import java.util.Date;

public class ReplyVo {
	
	private int rno;
	private int bno;
	private String content;
	private String writer;
	private Date regDate;
	private int countReply;
	
	public ReplyVo() {}	
		
	public int getCountReply() {
		return countReply;
	}

	public void setCountReply(int countReply) {
		this.countReply = countReply;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegDate() {
		return regDate;
	}


	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}


	@Override
	public String toString() {
		return "ReplyVo [rno=" + rno + ", bno=" + bno + ", content=" + content + ", writer=" + writer + ", regDate="
				+ regDate + ", countReply=" + countReply + "]";
	}


	
	

}
