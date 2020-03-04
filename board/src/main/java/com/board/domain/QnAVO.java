package com.board.domain;

import java.util.Date;

public class QnAVO {
	
	private int bno;
	private String category;
	private String title;
	private String content;
	private String writer;
	private String writerId;
	private String img;
	private Date regDate;
	private String result;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	@Override
	public String toString() {
		return "QnAVO [bno=" + bno + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", writerId=" + writerId + ", img=" + img + ", regDate=" + regDate
				+ ", result=" + result + "]";
	}
	
	

}
