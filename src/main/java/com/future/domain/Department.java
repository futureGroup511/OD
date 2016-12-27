package com.future.domain;

public class Department {

    // 部门
    private Integer depId;
    // 部门名称
    private String depName;
    // 部门描述
    private String depDesc;
    // 部门 对应角色（备用）
    private Integer depRole;
    // 部门 分管单位
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

	@Override
	public String toString() {
		return "Department [depId=" + depId + ", depName=" + depName + ", depDesc=" + depDesc + ", depRole=" + depRole
				+ ", depManager=" + depManager + "]";
	}
    
    
}