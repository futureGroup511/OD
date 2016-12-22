package com.future.service;

import java.util.List;

import com.future.domain.Department;

public interface DepartmentServiceI {

	List<Department> getAllDep();
	
	int insert(Department record);
	
	Department selectByPrimaryKey(Integer depId);
	
	int updateByPrimaryKey(Department record);
} 
