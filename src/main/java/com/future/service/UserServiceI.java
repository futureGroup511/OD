package com.future.service;

import java.util.List;

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
}
