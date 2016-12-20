package com.future.service.impl;

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

	public List<User> getAllValuatedBy(PageBean pageBean) {

		return evaluateMapper.getAllValuatedByInfo(pageBean);
	}

	public List<User> getAllValuatedTo(PageBean pageBean) {
		return evaluateMapper.getAllValuatedToInfo(pageBean);
	}

	public Integer getValuatedByCount() {
		return evaluateMapper.getValuatedByCount();
	}

	public Integer getValuatedToCount() {
		return evaluateMapper.getValuatedToCount();
	}

	public List<Evaluate> getValuatedMe(Integer meId) {
		return evaluateMapper.getValuatedMe(meId);
	}





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
