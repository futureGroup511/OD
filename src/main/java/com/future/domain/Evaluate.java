package com.future.domain;

public class Evaluate {
    private Integer evalId;

    private Integer evalEvalby;

    private Integer evalEvalto;

    private Integer evalRank;

    private Integer evalCate;

    private String evalDesc;

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