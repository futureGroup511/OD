package com.future.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.future.base.BaseAction;
import com.future.domain.Department;

/**
 * 
 * @author 刘阳阳
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("department")
public class DepartmentController extends BaseAction {

	/**
	 * 查询所有部门
	 * @return
	 */
	@RequestMapping(value="getAllDep",method=RequestMethod.GET)
	public ModelAndView getAllDep(HttpServletRequest request){
		//deleteDepMessage
		String message = (String) request.getSession().getAttribute("deleteDepMessage");
		request.getSession().removeAttribute("deleteDepMessage");
		String viewname = "Department/allDep";
		ModelAndView modelAndView = new ModelAndView(viewname);
		List<Department> depList = departmentService.getAllDep();
		modelAndView.addObject("depList", depList);
		modelAndView.addObject("deleteDepMessage", message);
		return modelAndView;
	}
	


	/**
	 * 请求添加单位UI
	 * @author 刘阳阳
	 */
	@RequestMapping(value="addDepUI",method=RequestMethod.GET)
	public String addDepUI(Map<String,Object> map){
		String viewname = "Department/addDepUI";
		map.put("department", new Department());
		return viewname;
	}
	

	/**
	 * 添加单位
	 * @author 刘阳阳
	 */
	@RequestMapping(value="addDep",method=RequestMethod.POST)
	public String addDep(Department dep){
		departmentService.insert(dep);
		return "redirect:getAllDep";
	}
	
	/**
	 * 请求修改页面
	 * @author 刘阳阳
	 */
	@RequestMapping(value="updateDepUI/{id}",method=RequestMethod.GET)
	public String updateDepUI(@PathVariable("id") Integer id,Map<String,Object> map){
		map.put("department", departmentService.selectByPrimaryKey(id));
		return "Department/updateDepUI";
	}
	
	@RequestMapping(value="updateDep",method=RequestMethod.POST)
	public String updateDep(Department dep){
		departmentService.updateByPrimaryKey(dep);
		return "redirect:getAllDep";
	}
}
