package com.future.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.EvaluateMapper;
import com.future.service.EvaluateServiceI;

@Service
@Transactional
public class EvaluateServiceImpl implements EvaluateServiceI {

	@Autowired
	private EvaluateMapper evaluateMapper;
}
