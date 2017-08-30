package com.shop.dto;

import java.io.Serializable;

@SuppressWarnings("serial")

public class MemberDto implements Serializable {
	private String username;//用户名
	private String password;//密码
	private String rePassword;//再次输入
	private String email;//邮箱
	private String name;//姓名
	private Integer gender;//性别
	private String mobile;//电话
	private String phone;//手机号
	private String verifyCode; // 图片验证码

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	private String phoneVerifyCode; // 短信验证码

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getPhoneVerifyCode() {
		return phoneVerifyCode;
	}

	public void setPhoneVerifyCode(String phoneVerifyCode) {
		this.phoneVerifyCode = phoneVerifyCode;
	}
}
