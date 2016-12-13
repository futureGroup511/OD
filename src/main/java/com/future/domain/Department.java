package com.future.domain;

public class Department {
    private Integer depId;

    private String depName;

    private String depDesc;

    private Integer depRole;

    private String depManager;

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName == null ? null : depName.trim();
    }

    public String getDepDesc() {
        return depDesc;
    }

    public void setDepDesc(String depDesc) {
        this.depDesc = depDesc == null ? null : depDesc.trim();
    }

    public Integer getDepRole() {
        return depRole;
    }

    public void setDepRole(Integer depRole) {
        this.depRole = depRole;
    }

    public String getDepManager() {
        return depManager;
    }

    public void setDepManager(String depManager) {
        this.depManager = depManager == null ? null : depManager.trim();
    }
}