package com.bikemap.home.regist;

public class RegistVO {

	private String userid;
	private String userpwd;
	private String username;

	private String email;
	private String email1;
	private String email2;

	private String gender;
	private String birth;
	private String regdate;
	private int heart;
	private int tourcnt;
	private String active;
	private String code;

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		email = email1 +"@"+ email2;
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail1() {
		email1= email.substring(0, email.indexOf("@"));
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		email2= email.substring(email.indexOf("@")+1);
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHeart() {
		return heart;
	}
	public void setHeart(int heart) {
		this.heart = heart;
	}
	public int getTourcnt() {
		return tourcnt;
	}
	public void setTourcnt(int tourcnt) {
		this.tourcnt = tourcnt;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}