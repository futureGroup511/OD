package com.future.base;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.future.service.DepartmentServiceI;
import com.future.service.EvaluateServiceI;
import com.future.service.RoleServiceI;
import com.future.service.UserServiceI;

@Controller
@Scope("prototype")
public abstract class BaseAction {

	//=========所有service实例声明==============
	@Autowired
	protected UserServiceI userService;
	@Autowired
	protected RoleServiceI roleService;
	@Autowired
	protected EvaluateServiceI evaluateService;
	@Autowired
	protected DepartmentServiceI departmentService;
	
}
