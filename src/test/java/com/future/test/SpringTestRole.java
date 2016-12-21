package com.future.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.future.domain.User;
import com.future.service.RoleServiceI;
import com.future.service.UserServiceI;



@RunWith(SpringJUnit4ClassRunner.class)
//配置了@ContextConfiguration注解并使用该注解的locations属性指明spring和配置文件之后，
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class SpringTestRole {
 
	//注入roleService
	@Autowired
	private RoleServiceI roleService;
	
	@Test
	public void getAllRole(){
	   System.out.println(roleService.getAllRole().get(1).getRoleName());
	}
	
	/*@Test
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
	}*/
	
}
