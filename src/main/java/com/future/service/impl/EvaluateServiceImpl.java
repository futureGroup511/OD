package com.future.service.impl;

import com.future.domain.Evaluate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.EvaluateMapper;
import com.future.service.EvaluateServiceI;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class EvaluateServiceImpl implements EvaluateServiceI {

	@Autowired
	private EvaluateMapper evaluateMapper;




	public List<Evaluate> findEvalByUser(Map<String, Object> hashMap) {
		return evaluateMapper.findEvalByUser(hashMap);
	}
}
