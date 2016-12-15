package com.future.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.future.base.BaseAction;
import com.future.dao.UserMapper;
import com.future.domain.Department;
import com.future.domain.Role;
import com.future.domain.User;

@Controller
@Scope("prototype")
@RequestMapping("user")
@SessionAttributes("user")
public class UserController extends BaseAction {

	/**
	 * 查询所有用户信息
	 * @return modelAndView视图显示
	 */
	@RequestMapping(value="getAllUser",method=RequestMethod.GET)
	public ModelAndView getAllUser(){
		String viewname="User/allUser";
		ModelAndView modelAndView = new ModelAndView(viewname);
		List<User> list = userService.getAllUser();
		modelAndView.addObject("userList", list);
		return modelAndView;
	}
	
	
	/**
	 * 准备添加用户页面
	 * @author 刘阳阳
	 */
	@RequestMapping(value="addUserUI",method=RequestMethod.GET)
	public ModelAndView addUserUI(){
		String viewname="User/addUserUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		List<Role> role = roleService.getAllRole();
		List<Department> dep = departmentService.getAllDep();
		
		modelAndView.addObject("user", new User());
		modelAndView.addObject("userRole",role);
		modelAndView.addObject("userDep",dep);
		return modelAndView;
	}
	
	/**
	 * 添加用户
	 * @author 刘阳阳
	 */
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public String addUser(User user){
		userService.insert(user);
		return "redirect:getAllUser";
	}
	
	
	@RequestMapping(value="updateUserUI/{id}",method=RequestMethod.GET)
	public ModelAndView updateUserUI(@PathVariable("id") Integer id,Map<String,Object> map){
		String viewname="User/addUserUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		User user = userService.selectByPrimaryKey(id);
		List<Role> role = roleService.getAllRole();
		List<Department> dep = departmentService.getAllDep();
		
		modelAndView.addObject("user", user);
		modelAndView.addObject("userRole",role);
		modelAndView.addObject("userDep",dep);
		return modelAndView;
	}
	
	/**
	 * 修改用户
	 * @author 刘阳阳
	 */
	@RequestMapping(value="updateUser",method=RequestMethod.POST)
	public String updateUser(User user){
		userService.updateByPrimaryKey(user);
		return "redirect:getAllUser";
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(@RequestParam("username") String username,@RequestParam("password") String password,ModelMap session){
		User user = userService.login(username,password);
		session.addAttribute("user",user);
		return "User/shouye";
	}
	
	
	/**
	 * 校正厅对所有正职评价
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xzAllz",method=RequestMethod.GET)
	public ModelAndView xzAllz(){
		String viewname = "User/xzAllz";
		ModelAndView modelAndView = new ModelAndView(viewname);
		
		List<User> user = userService.getxzAllz();
		modelAndView.addObject("userList",user);
		return modelAndView;
	}
	
}
