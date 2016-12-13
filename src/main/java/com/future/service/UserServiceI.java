package com.future.service;

import java.util.List;

import com.future.domain.User;

public interface UserServiceI {
	
	int insert(User user);
	
	User selectByPrimaryKey(Integer userId);
	
	List<User> getAllUser();
}
