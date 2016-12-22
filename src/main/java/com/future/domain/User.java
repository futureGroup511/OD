package com.future.domain;

public class User {

	private Integer userId;
	//用户姓名
	private String userName;
	// 账号 
	private String userNum;
	// 密码
	private String userPassword;
	// 正负
	private Integer userNp;
	// 职称报告
	private String userReport;
	// 用户职务
	private String userDuty;
	// 用户描述
	private String userDesc;
	// 用户部门
	private Integer userDep;
	// 用户角色
	private Integer userRole;


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName == null ? null : userName.trim();
	}

	public String getUserNum() {
		return userNum;
	}

	public void setUserNum(String userNum) {
		this.userNum = userNum == null ? null : userNum.trim();
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword == null ? null : userPassword.trim();
	}

	public Integer getUserNp() {
		return userNp;
	}

	public void setUserNp(Integer userNp) {
		this.userNp = userNp;
	}

	public String getUserReport() {
		return userReport;
	}

	public void setUserReport(String userReport) {
		this.userReport = userReport == null ? null : userReport.trim();
	}

	public String getUserDuty() {
		return userDuty;
	}

	public void setUserDuty(String userDuty) {
		this.userDuty = userDuty == null ? null : userDuty.trim();
	}

	public String getUserDesc() {
		return userDesc;
	}

	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc == null ? null : userDesc.trim();
	}

	public Integer getUserDep() {
		return userDep;
	}

	public void setUserDep(Integer userDep) {
		this.userDep = userDep;
	}

	public Integer getUserRole() {
		return userRole;
	}

	public void setUserRole(Integer userRole) {
		this.userRole = userRole;
	}

	private Role role;
	private Department department;

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userNum=" + userNum + ", userPassword="
				+ userPassword + ", userNp=" + userNp + ", userReport=" + userReport + ", userDuty=" + userDuty
				+ ", userDesc=" + userDesc + ", userDep=" + userDep + ", userRole=" + userRole + ", role=" + role
				+ ", department=" + department + "]";
	}
	
}