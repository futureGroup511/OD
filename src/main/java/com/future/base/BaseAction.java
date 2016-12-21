package com.future.base;

import com.future.domain.Statistics;
import com.future.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

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
	@Autowired
	protected StatisticsServiceI statisticsService;
}
