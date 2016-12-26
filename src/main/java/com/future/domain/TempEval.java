package com.future.domain;

public class TempEval {
	// 评价id
	private Integer evalId;
	// 被评价人
	private Integer evalEvalby;
	// 评价人
	private Integer evalEvalto;
	// 评价 等级 优良中差
	private Integer evalRank;
	// 评价类别 厅级评价
	private Integer evalCate;
	// 评价描述
	private String evalDesc;
	// 暂存用户
	private User user;
	// 单位
	private Department department;

	public Integer getEvalId() {
		return evalId;
	}

	public void setEvalId(Integer evalId) {
		this.evalId = evalId;
	}

	public Integer getEvalEvalby() {
		return evalEvalby;
	}

	public void setEvalEvalby(Integer evalEvalby) {
		this.evalEvalby = evalEvalby;
	}

	public Integer getEvalEvalto() {
		return evalEvalto;
	}

	public void setEvalEvalto(Integer evalEvalto) {
		this.evalEvalto = evalEvalto;
	}

	public Integer getEvalRank() {
		return evalRank;
	}

	public void setEvalRank(Integer evalRank) {
		this.evalRank = evalRank;
	}

	public Integer getEvalCate() {
		return evalCate;
	}

	public void setEvalCate(Integer evalCate) {
		this.evalCate = evalCate;
	}

	public String getEvalDesc() {
		return evalDesc;
	}

	public void setEvalDesc(String evalDesc) {
		this.evalDesc = evalDesc;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Override
	public String toString() {
		return "TempEval [evalId=" + evalId + ", evalEvalby=" + evalEvalby + ", evalEvalto=" + evalEvalto
				+ ", evalRank=" + evalRank + ", evalCate=" + evalCate + ", evalDesc=" + evalDesc + ", user=" + user
				+ ", department=" + department + "]";
	}

}
