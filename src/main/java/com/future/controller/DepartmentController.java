package com.future.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.future.base.BaseAction;

@Controller
@Scope("prototype")
@RequestMapping("department")
public class DepartmentController extends BaseAction {

	
}
