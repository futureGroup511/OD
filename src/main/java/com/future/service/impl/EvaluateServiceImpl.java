package com.future.service.impl;

import com.future.domain.Evaluate;
import com.future.utils.PageBean;
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

 


	public PageBean findEvalByUser(Map<String, Object> hashMap) {
		int count=evaluateMapper.findEvalByUserCount(hashMap);
		List<Evaluate> evaluates=evaluateMapper.findEvalByUser(hashMap);
		PageBean pageBean= (PageBean) hashMap.get("page");
		pageBean.setRecordCount(count);
		pageBean.setRecordlist(evaluates);
		pageBean.calbeginAndEnd();
		return pageBean;

	}
}
