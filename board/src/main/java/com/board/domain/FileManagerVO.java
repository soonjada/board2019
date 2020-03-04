package com.board.domain;

import java.util.Date;

public class FileManagerVO {
	
	private int no;
	private String originFileName;
	private String saveFileName;
	private String extensionFileName;
	private long fileSize;
	private String writer;
	private String writerId;
	private Date regDate;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getOriginFileName() {
		return originFileName;
	}
	public void setOriginFileName(String originFileName) {
		this.originFileName = originFileName;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getExtensionFileName() {
		return extensionFileName;
	}
	public void setExtensionFileName(String extensionFileName) {
		this.extensionFileName = extensionFileName;
	}
	
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
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
	@Override
	public String toString() {
		return "FileManagerVO [no=" + no + ", originFileName=" + originFileName + ", saveFileName=" + saveFileName
				+ ", extensionFileName=" + extensionFileName + ", fileSize=" + fileSize + ", writer=" + writer
				+ ", writerId=" + writerId + ", regDate=" + regDate + "]";
	}
	
	
	

	

}
