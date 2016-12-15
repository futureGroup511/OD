package com.future.service;

import java.util.List;

import com.future.domain.Evaluate;
import com.future.domain.User;

public interface UserServiceI {
	
	int insert(User user);
	
	User selectByPrimaryKey(Integer userId);
	
	List<User> getAllUser();
	
	int updateByPrimaryKey(User user);

	/**
	 * 登陆
	 * @author 刘阳阳
	 */
	User login(String username, String password);

	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 */
	List<User> getxzAllz();

	/**
	 * 批量插入评价数据
	 * 
	 * @author 刘阳阳
	 */
	int insertAll(List<Evaluate> evaList);

	/**
	 * 
	 * 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllZheng(Evaluate isEval);
}
