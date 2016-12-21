package com.future.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.future.domain.User;
import com.future.service.UserServiceI;



@RunWith(SpringJUnit4ClassRunner.class)
//配置了@ContextConfiguration注解并使用该注解的locations属性指明spring和配置文件之后，
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class SpringTestUser {

	//注入userService 
	@Autowired
	private UserServiceI userService;
	
	@Test
	public void testAddUser(){
	    User user = new User();
	    user.setUserRole(1);
        user.setUserName("张三");
        user.setUserNum("zhangsan");
        user.setUserPassword("123456");
        user.setUserDesc("此字段为一个描述");
	    userService.insert(user);
	}
	
	@Test
	public void testGetUserById(){
	   int userId = 1;
	   User user = userService.selectByPrimaryKey(userId);
	   System.out.println(user.getUserName());
	}
	
	@Test
	public void login(){
	   User user = userService.login("guoqiuping", "123");
	   System.out.println(user);
	}
	
	/**
	 * 校正厅查询所有正职
	 * @author 刘阳阳
	 */
	@Test
	public void getxzAllz(){
		List<User> listUser = userService.getxzAllz();
		System.out.println(listUser);
	}
	
	/**
	 * 校正厅查询分管单位
	 * @author 刘阳阳
	 */
	@Test
	public void xzAllFenGuanUI(){
		List<User> listUser = userService.xzAllFenGuanUI("王清连");
		System.out.println(listUser);
	}
	
	/**
	 * ajax
	 */
	@Test
	public void testAjax(){
		System.out.println(4f/6f);
	}
	
	
	
}
