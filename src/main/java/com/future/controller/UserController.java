package com.future.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.future.base.BaseAction;
import com.future.domain.Department;
import com.future.domain.Evaluate;
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
	
	/**
	 * 处理登陆请求
	 * @author 刘阳阳
	 */
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(@RequestParam("username") String username,@RequestParam("password") String password,ModelMap session){
		User user = userService.login(username,password);
		session.addAttribute("user",user);
		return "User/shouye";
	}
	
	
	/**
	 * 校正厅对所有正职评价,请求页面
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xzAllzUI",method=RequestMethod.GET)
	public ModelAndView xzAllzUI(ModelMap session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，  （注意，本次查询在mapper只用到了一个userid其余写死的死的，如果修改代码请注意）
		//查到有记录就代表评价过，
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.get("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(2);
		isEval.setEvalDesc("0");
		List<Evaluate> num = userService.getIsOrNoAllZheng(isEval);
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已对所有正职评价过！！");
		} else{
			//未评价过
			List<User> user = userService.getxzAllz();
			modelAndView.addObject("userList",user);
			modelAndView.addObject("userNum",user.size());
			modelAndView.addObject("url","/user/xzAllz");
		}
		return modelAndView;
	}
	
	/**
	 * ajax获取本次评价的优秀的百分比，
	 * @author 刘阳阳
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="ajaxgetBili",method=RequestMethod.POST)
	public String ajaxgetBili() throws IOException{
		System.out.println("ajax收到");
		InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("date.properties");
		
		Properties pro = new Properties();
		pro.load(inputStream);
		String a = pro.getProperty("bili");
		return a;
	}
	
	/**
	 * 校正厅对所有正职评价，处理结果
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xzAllz",method=RequestMethod.GET)
	public String xzAllz(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){
		System.out.println("评价人" + evalEvalto);
		System.out.println("被评价人数" + evalEvalby.length);
		System.out.println("被评价人：");
		for(int i=0;i<evalEvalby.length;i++){
			System.out.print(evalEvalby[i] + " ");
		}
		System.out.println("评价结果");
		String[] result1 = result.split(",");
		
		//拿到结合，已备存储结果
		List<Evaluate> evaList = new ArrayList<Evaluate>();
		for(int i=0;i<result1.length;i++){
			Evaluate eva = new Evaluate();
			//评价人
			eva.setEvalEvalto(evalEvalto);
			//被评价人
			eva.setEvalEvalby(evalEvalby[i]);
			//级别 优良中茶
			eva.setEvalRank(Integer.parseInt(result1[i]));
			//设置级别
			eva.setEvalCate(2);
			//设置校正厅对正职大的分
			eva.setEvalDesc("0");
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		System.out.println(num);
		return "";
	}
	
	
	/**
	 * 校正厅对所有分管单位正副职评价,请求页面
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xzAllFenGuanUI",method=RequestMethod.GET)
	public ModelAndView xzAllFenGuanUI(ModelMap session){
		
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.get("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(2);
		isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllFenGuan(isEval);
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已对分管单位所有人员评价过！！");
		} else {
			//未评价过
			//查询分管单位的所有人   从当前session拿到单位id，传到dao层查询
			User user = (User) session.get("user");
			List<User> userList = userService.xzAllFenGuanUI(user.getUserName());
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/xzAllFenGuan");
		}
		return modelAndView;
	}
	
	/**
	 * 校正厅对所有=分管单位=评价，处理结果
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xzAllFenGuan",method=RequestMethod.GET)
	public String xzAllFenGuan(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){
		System.out.println("评价人" + evalEvalto);
		System.out.println("被评价人数" + evalEvalby.length);
		System.out.println("被评价人：");
		for(int i=0;i<evalEvalby.length;i++){
			System.out.print(evalEvalby[i] + " ");
		}
		System.out.println("评价结果");
		String[] result1 = result.split(",");
		
		//拿到结合，已备存储结果
		List<Evaluate> evaList = new ArrayList<Evaluate>();
		for(int i=0;i<result1.length;i++){
			Evaluate eva = new Evaluate();
			//评价人
			eva.setEvalEvalto(evalEvalto);
			//被评价人
			eva.setEvalEvalby(evalEvalby[i]);
			//级别 优良中茶
			eva.setEvalRank(Integer.parseInt(result1[i]));
			//设置级别
			eva.setEvalCate(2);
			//设置校正厅对正职大的分
			eva.setEvalDesc("1");
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		System.out.println(num);
		return "";
	}
	
	
	/**
	 * 校副厅--对所有  分管单位  正副职评价,请求页面
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xfAllFenGuanUI",method=RequestMethod.GET)
	public ModelAndView xfAllFenGuanUI(ModelMap session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.get("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(2);
		isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllFenGuanXF(isEval);
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已对分管单位所有人员评价过！！");
		} else {
			//未评价过
			//查询分管单位的所有人   从当前session拿到单位id，传到dao层查询
			User user = (User) session.get("user");
			List<User> userList = userService.xfAllFenGuanUI(user.getUserName());
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/xfAllFenGuan");
		}
		return modelAndView;
	}
	
	/**
	 * 校副厅对所有=分管单位=评价，处理结果
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xfAllFenGuan",method=RequestMethod.GET)
	public String xfAllFenGuan(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){
		System.out.println("评价人" + evalEvalto);
		System.out.println("被评价人数" + evalEvalby.length);
		System.out.println("被评价人：");
		for(int i=0;i<evalEvalby.length;i++){
			System.out.print(evalEvalby[i] + " ");
		}
		System.out.println("评价结果");
		String[] result1 = result.split(",");
		
		//拿到结合，已备存储结果
		List<Evaluate> evaList = new ArrayList<Evaluate>();
		for(int i=0;i<result1.length;i++){
			Evaluate eva = new Evaluate();
			//评价人
			eva.setEvalEvalto(evalEvalto);
			//被评价人
			eva.setEvalEvalby(evalEvalby[i]);
			//级别 优良中茶
			eva.setEvalRank(Integer.parseInt(result1[i]));
			//设置级别
			eva.setEvalCate(2);
			//设置校 副厅  厅对正职大的分
			eva.setEvalDesc("1");
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		System.out.println(num);
		return "";
	}
	
}
