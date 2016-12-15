package com.future.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.future.dao.EvaluateMapper;
import com.future.dao.UserMapper;
import com.future.domain.Evaluate;
import com.future.domain.User;
import com.future.service.UserServiceI;

@Service
@Transactional
public class UserServiceImpl implements UserServiceI {

	@Autowired
	private UserMapper userMapper;
	@Autowired
	private EvaluateMapper evaluateMapp;
	
	public int insert(User user) {
		return userMapper.insert(user);
	}

	public User selectByPrimaryKey(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	public List<User> getAllUser() {
		return userMapper.getAllUser();
	}

	public int updateByPrimaryKey(User user) {
		return userMapper.updateByPrimaryKey(user);
	}

	/* 
	 * 
	 * 验证登陆。
	 */
	public User login(String username, String password) {
		User user = userMapper.login(username);
		if(user!=null){
			if(password.equals(user.getUserPassword())){
				return user;
			} else{
				System.out.println("密码不对");
				return null;
			}
		} else{
			System.out.println("没有这个人");
			return null;
		}
	}

	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 */
	public List<User> getxzAllz() {
		return userMapper.getxzAllz();
	}

	/**
	 * 批量插入评价数据
	 * 
	 * @author 刘阳阳
	 */
	public int insertAll(List<Evaluate> evaList) {
		return userMapper.insertAll(evaList);
	}

	/**
	 * 
	 * 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllZheng(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllZheng(isEval);
	}

}
