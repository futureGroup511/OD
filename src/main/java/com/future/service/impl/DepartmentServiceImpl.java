package com.future.service.impl;

import com.future.dao.DepartmentMapper;
import com.future.domain.Department;
import com.future.service.DepartmentServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentServiceI {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> getAllDep(){
		return departmentMapper.getAllDep();
	}
 
	public int insert(Department record) {
		return departmentMapper.insert(record);
	}

	public Department selectByPrimaryKey(Integer depId) {
		return departmentMapper.selectByPrimaryKey(depId);
	}

	public int updateByPrimaryKey(Department record) {
		return departmentMapper.updateByPrimaryKey(record);
	}
}
