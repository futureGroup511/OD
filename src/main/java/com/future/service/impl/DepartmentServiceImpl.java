package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.DepartmentMapper;
import com.future.service.DepartmentServiceI;

@Service
@Transactional
public class DepartmentServiceImpl implements DepartmentServiceI {

	@Autowired
	private DepartmentMapper departmentMapper;
}
