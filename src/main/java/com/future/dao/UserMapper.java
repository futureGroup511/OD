package com.future.dao;

import java.util.List;

import com.future.domain.Evaluate;
import com.future.domain.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User user);

    int insertSelective(User user);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User user);

    int updateByPrimaryKey(User user);
    
    List<User> getAllUser();

	User login(String username);

	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 * @return 
	 */
	List<User> getxzAllz();

	/**
	 * 批量插入评价数据
	 * 
	 * @author 刘阳阳
	 */
	int insertAll(List<Evaluate> evaList);
}