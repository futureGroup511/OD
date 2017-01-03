package com.future.service.impl;

import com.future.commonUtils.MyPageBean;
import com.future.domain.Evaluate;
import com.future.domain.User;
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

	public List<User> getAllValuatedBy(MyPageBean pageBean) {

		return evaluateMapper.getAllValuatedByInfo(pageBean);
	}

	public List<User> getAllValuatedTo(MyPageBean pageBean) {
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

	public List<Evaluate> getValuateByPeople(Integer meId) {
		return evaluateMapper.getValuateByPeople(meId);
	}

	public List<Evaluate> getValuateByPeople(Map<String, Object> hashMap) {
		return evaluateMapper.getValuateByPeople(hashMap);
	}

	/**
     * 根据姓名模糊查询评价人
     * 
     * @author 刘阳阳
     */
	public List<User> getUserByNameLY(String nameLYY) {
		return evaluateMapper.getUserByNameLY(nameLYY);
	}

	public List<String> getAllDepartment() {
		return evaluateMapper.getAllDepartment();
	}

	/**
     * 条件查询以评信息
     * 
     * @author 刘阳阳
     */
	public List<Evaluate> contanueFindByUser(Integer userId, String fenlei) {
		return evaluateMapper.contanueFindByUser(userId,fenlei);
	}

	
	/**
	 * 删除某人评价的信息
	 * 
	 * @author 刘阳阳
	 */
	public void deleteByEvalTo(Integer evalTo) {
		evaluateMapper.deleteByEvalTo(evalTo);
	}
}
