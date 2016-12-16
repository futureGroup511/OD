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
	 * 批量插入评价数据
	 * 
	 * @author 刘阳阳
	 */
	public int insertAll(List<Evaluate> evaList) {
		return userMapper.insertAll(evaList);
	}

	/**
	 * 校正厅 判断 是否对其 正职评价
	 * 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllZheng(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllZheng(isEval);
	}
	
	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 */
	public List<User> getxzAllz() {
		return userMapper.getxzAllz();
	}

	/**
	 * 校正厅查询分管单位是否评价过
	 * 拿到session 评价人的userid，然后根据本次评价类别 2 厅级对下级，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllFenGuan(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllFenGuan(isEval);
	}
	
	/**
	 * 校正厅查询分管单位所有人
	 * 通过session中的单位id，传到dao查询到单位名称，再去User表中查询所有人。
	 * @author 刘阳阳
	 */
	public List<User> xzAllFenGuanUI(String name) {
		return userMapper.xzAllFenGuanUI(name);
	}

	/**
	 * 校副厅  对其 分管单位 是否评价过
	 * 2 厅级对下级，在在加上描述中 desc 为 1 代表 校副厅-对其分管单位打得分。
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllFenGuanXF(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllFenGuanXF(isEval);
	}

	/**
	 * 校副厅查询分管单位所有人员（分管单位有可能大于1，是2）
	 * 
	 * @author 刘阳阳
	 */
	public List<User> xfAllFenGuanUI(String name) {
		return userMapper.xfAllFenGuanUI(name);
	}

	/**
	 * 党群  查看是否对其 互评的结果评价过
	 * 
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllDangQunZHP(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllDangQunZHP(isEval);
	}

	/**
	 * 党群查询所有互评的人员（所有院系书记副书记）
	 * @author 刘阳阳
	 */
	public List<User> dangquanAllHPUser(){
		return userMapper.dangquanAllHPUser();
	}

	/**
	 * 党群，查看是否对其 本单位的下级评价过
	 * 
	 * @author 刘阳阳
	 */
	public List<Evaluate> getIsOrNoAllDangQunDepDown(Evaluate isEval) {
		return evaluateMapp.getIsOrNoAllDangQunDepDown(isEval);
	}

	/**
	 * 党群，查询所有本单位的下级 副
	 * 
	 * @author 刘阳阳
	 */
	public List<User> dangquanAllDepDwon(User user) {
		return userMapper.dangquanAllDepDwon(user);
	}

	/**
	 * 教学书记副书记查询所有 党群机构
	 * 
	 * @author 刘阳阳
	 */
	public List<User> JiaoxueShujiGetAlldangqun() {
		return userMapper.JiaoxueShujiGetAlldangqun();
	}

}
