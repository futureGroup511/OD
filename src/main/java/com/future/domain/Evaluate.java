package com.future.domain;

public class Evaluate {
    // 评价id
    private Integer evalId;
    // 评价 等级 优良中差
    private Integer evalRank;
    // 评价类别 厅级评价
    private Integer evalCate;
    // 评价描述 
    private String evalDesc;
    //评价类别
    private String evalsort;
    // 评价等级
    private String evalgrade;
    //单位
    private Department evalDep;
    
    
    
    public Department getEvalDep() {
		return evalDep;
	}

	public void setEvalDep(Department evalDep) {
		this.evalDep = evalDep;
	}

	private User evaluatedBy;
    private User evaluatedTo;

    public String getEvalgrade() {
        if(evalRank == 100) evalgrade="优秀";
        else if(evalRank == 80) evalgrade="称职";
        else if(evalRank == 60) evalgrade="基本称职";
        else if(evalRank == 40) evalgrade="不称职";
        return evalgrade;
    }

    public void setEvalgrade(String evalgrade) {
        this.evalgrade = evalgrade;
    }

    public String getEvalsort() {
        if(evalCate == 1) evalsort= "互评";
        else if(evalCate == 2 && evalDesc.equals("1")) evalsort= "分管评价";
        else if(evalCate == 3 || (evalCate == 2 && evalDesc.equals("0"))) evalsort= "厅级评价";
        else if(evalCate == 4) evalsort= "单位评价";
        return evalsort;
    }

    public void setEvalsort(String evalsort) {
        this.evalsort = evalsort;
    }

    public User getEvaluatedBy() {
        return evaluatedBy;
    }

    public void setEvaluatedBy(User evaluatedBy) {
        this.evaluatedBy = evaluatedBy;
    }

    public User getEvaluatedTo() {
        return evaluatedTo;
    }

    public void setEvaluatedTo(User evaluatedTo) {
        this.evaluatedTo = evaluatedTo;
    }

    //===============


//*******************************************
    // 不用
    // 被评价人
    private Integer evalEvalby;
    // 评价人
    private Integer evalEvalto;
//******************************************



    private User userBy;

    private User userTo;


    public User getUserTo() {
        return userTo;
    }

    public User getUserBy() {
        return userBy;
    }

    public void setUserBy(User userBy) {
        this.userBy = userBy;
    }

    public void setUserTo(User userTo) {
        this.userTo = userTo;
    }


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
      return  evalRank;
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
        this.evalDesc = evalDesc == null ? null : evalDesc.trim();
    }

    @Override
    public String toString() {
        return "Evaluate{" +
                "evalId=" + evalId +
                ", evalEvalby=" + evalEvalby +
                ", evalEvalto=" + evalEvalto +
                ", evalRank=" + evalRank +
                ", evalCate=" + evalCate +
                ", evalDesc='" + evalDesc + '\'' +
                '}';
    }
}