package com.board.domain;

import java.util.Date;

public class MembersVO {

	private String userId;
	private String userPass;
	private String userName;
	private Date regDate;
	// 11.18 ver2 add start
	private String email;
	private String userImg;
	// 11.18 ver2 add End
	// 12.10 ver3 add start
	private String memType;
	// 12.10 ver3 add End
	
	
	// 12.10 ver3 add start
	public String getMemType() {
		return memType;
	}

	public void setMemType(String memType) {
		this.memType = memType;
	}
	// 12.10 ver3 add End
	
	// 11.18 ver2 add start
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserImg() {
		return userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	// 11.18 ver2 add End
	
	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	
	// 12.10 ver2 add start
	@Override
	public String toString() {
		return "MembersVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", regDate="
				+ regDate + ", email=" + email + ", userImg=" + userImg + ", memType=" + memType + "]";
	}

	// 12.10 ver2 add End
	
	
	
	
	

}
