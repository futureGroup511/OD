package com.future.controller;

import static org.springframework.test.web.client.response.MockRestResponseCreators.withBadRequest;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.druid.sql.dialect.mysql.ast.statement.MySqlCreateUserStatement.UserSpecification;
import com.future.base.BaseAction;
import com.future.domain.Department;
import com.future.domain.Evaluate;
import com.future.domain.Role;
import com.future.domain.User;

@Controller
@Scope("prototype")
@RequestMapping("user")
public class UserController extends BaseAction {
	
	//@SessionAttributes("user")
	
	/**
	 *	添加用户时请求Ajax，查询是否存在同名用户 
	 */
	@ResponseBody
	@RequestMapping(value="ajaxgetisOrNotUser",method=RequestMethod.POST)
	public Boolean ajaxgetisOrNotUser(@RequestParam("usernum") String userNum){
		System.out.println(userNum);
		User user = userService.ajaxgetisOrNotUser(userNum);
		if(user == null){
			System.out.println("不存在可以插入！");
			return false;
		}
		return true;
		
	}
	
	
	
	/**
	 * 左侧菜单请求
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="returnMeun",method=RequestMethod.GET)
	public String returnMeun(){
		return "User/menu";
	}
	
	/**
	 * 登陆页面请求
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="loginUI",method=RequestMethod.GET)
	public String loginUI(){
		return "User/loginUI";
	}
	
	/**
	 * 处理登陆请求
	 * @author 刘阳阳
	 */
	@RequestMapping(value="login",method=RequestMethod.POST)
	//public ModelAndView login(@RequestParam("username") String username,@RequestParam("password") String password,ModelMap session){
	public ModelAndView login(@RequestParam("username") String username,@RequestParam("password") String password,HttpSession session,HttpServletRequest request){
		User user = userService.login(username,password);
		if(user != null){
			String viewname = "User/shouye";
			ModelAndView modelAndView = new ModelAndView(viewname);
			//session.addAttribute("user",user);
			session.setAttribute("user", user);
			return modelAndView;
		} else{
			String viewname = "User/loginUI";
			ModelAndView modelAndView = new ModelAndView(viewname);
			//session.addAttribute("message","账号或密码错误");
			request.setAttribute("message", "账号或密码错误111");
			//session.setAttribute("message","账号或密码错误");
			return modelAndView;
		}
	}
	
	/**
	 * 处理登出请求
	 * @author 刘阳阳
	 * @throws IOException 
	 */
	@RequestMapping(value="logout",method=RequestMethod.GET)
	//public void logout(ModelMap session){
	//public ModelAndView logout(SessionStatus sessionStatus) throws IOException{
	//public String logout(SessionStatus sessionStatus) throws IOException{
	public String logout(HttpSession session) throws IOException{
		//sessionStatus.setComplete();  
		session.removeAttribute("user");
		//ModelAndView modelAndView = new ModelAndView("User/loginUI");
		return "redirect:loginUI";
	}
	
	

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
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public String addUser(User user){
		userService.insert(user);
		return "redirect:getAllUser";
	}
	 */
	@RequestMapping(value="addUser",method=RequestMethod.POST)
	public String addUser(User user,@RequestParam("uploadfile") CommonsMultipartFile file,HttpServletRequest request){
	//public String addUser(User user){
		//userService.insert(user);
		String filename = "";
		if (!file.isEmpty()) {
            String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
            filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
            String path = request.getSession().getServletContext().getRealPath("/upload/" + filename);// 存放位置
            File destFile = new File(path);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);// 复制临时文件到指定目录下
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
		if(filename != ""){
			user.setUserReport("upload/" + filename);
		}
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
	public String updateUser(User user,@RequestParam("uploadfile") CommonsMultipartFile file,HttpServletRequest request){
		
		if(file.isEmpty()){
			userService.updateByPrimaryKey(user);
		}else {
			String filename = "";
            String type = file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));// 取文件格式后缀名
            filename = System.currentTimeMillis() + type;// 取当前时间戳作为文件名
            String path = request.getSession().getServletContext().getRealPath("/upload/" + filename);// 存放位置
            File destFile = new File(path);
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), destFile);// 复制临时文件到指定目录下
            } catch (IOException e) {
                e.printStackTrace();
            }
            if(filename != ""){
    			user.setUserReport("upload/" + filename);
    		}
            
            userService.updateByPrimaryKey(user);
		}
		return "redirect:getAllUser";
	}
	
	@RequestMapping(value="deleteUser/{id}",method=RequestMethod.GET)
	public String deleteUser(@PathVariable("id") Integer id){
		System.out.println(id);
		userService.deleteUser(id);
		return "redirect:/user/getAllUser";
	}
	
	
	
	
	/**
	 * 校正厅对所有正职评价,请求页面
	 * @author 刘阳阳
	 */
	//public ModelAndView xzAllzUI(ModelMap session){
	@RequestMapping(value="xzAllzUI",method=RequestMethod.GET)
	public ModelAndView xzAllzUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，  （注意，本次查询在mapper只用到了一个userid其余写死的死的，如果修改代码请注意）
		//查到有记录就代表评价过，
		Evaluate isEval = new Evaluate();
		//User tempuser = (User) session.get("user");
		User tempuser = (User) session.getAttribute("user");
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
		return "User/successEval";
	}
	
	
	/**
	 * 校正厅对所有分管单位正副职评价,请求页面
	 * @author 刘阳阳
	 */
	//public ModelAndView xzAllFenGuanUI(ModelMap session){
	@RequestMapping(value="xzAllFenGuanUI",method=RequestMethod.GET)
	public ModelAndView xzAllFenGuanUI(HttpSession session){
		
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		//User tempuser = (User) session.get("user");
		User tempuser = (User) session.getAttribute("user");
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
			//User user = (User) session.get("user");
			User user = (User) session.getAttribute("user");
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
		return "User/successEval";
	}
	
	
	/**
	 * 校副厅--对所有  分管单位  正副职评价,请求页面
	 * @author 刘阳阳
	 */
	@RequestMapping(value="xfAllFenGuanUI",method=RequestMethod.GET)
	public ModelAndView xfAllFenGuanUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
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
			User user = (User) session.getAttribute("user");
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
		return "User/successEval";
	}
	
	/**
	 * 党群部门  评价所有教学书记副书记,请求页面
	 * dangqunGetAllJiaoxueShujiUI
	 */
	@RequestMapping(value="dangqunGetAllJiaoxueShujiUI",method=RequestMethod.GET)
	public ModelAndView dangqunGetAllJiaoxueShujiUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		//isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllDangQunZHP(isEval);	
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已对院系书记副书记评价过！！");
		} else {
			//未评价过
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.dangquanAllHPUser();
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/dangqunGetAllJiaoxueShuji");
		}
		return modelAndView;
	}
	
	/**
	 * 党群部门  评价所有教学书记副书记，接受表单请求
	 * dangqunGetAllJiaoxueShuji
	 */
	@RequestMapping(value="dangqunGetAllJiaoxueShuji",method=RequestMethod.GET)
	public String dangqunGetAllJiaoxueShuji(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}
	
	/**
	 * 党群部门  评价 本单位所有副职 请求页面
	 * dangqunGetAllDepZFUI
	 */
	@RequestMapping(value="dangqunGetAllDepZFUI",method=RequestMethod.GET)
	public ModelAndView dangqunGetAllDepZFUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(3);
		//isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllDangQunDepDown(isEval);	
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已本单位副职评价过！");
		} else {
			//未评价过
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.dangquanAllDepDwon(tempuser);
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/dangqunGetAllDepZF");
		}
		return modelAndView;
	}
	
	/**
	 * 党群部门  评价 本单位所有副职 接受表单请求
	 * dangqunGetAllDepZFUI
	 */
	@RequestMapping(value="dangqunGetAllDepZF",method=RequestMethod.GET)
	public String dangqunGetAllDepZF(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 3, null);
		return "User/successEval";
	}
	
	/**
	 * 教学书记副书记  互评  对所有党群，请求页面
	 * JiaoxueShujiGetAlldangqunUI
	 * @author 刘阳阳
	 */
	@RequestMapping(value="JiaoxueShujiGetAlldangqunUI",method=RequestMethod.GET)
	public ModelAndView JiaoxueShujiGetAlldangqunUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		//isEval.setEvalDesc("1");
		//调用党群的方法                        						//=====================此处少一个方法。
		List<Evaluate> num = userService.getIsOrNoAllDangQunZHP(isEval);	
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已对党群部门互评过！");
		} else {
			//未评价过
			//User user = (User) session.get("user");
			List<User> userList = userService.JiaoxueShujiGetAlldangqun();
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/JiaoxueShujiGetAlldangqun");
		}
		return modelAndView;
	}
	
	/**
	 * 教学书记副书记  互评 党群
	 * dangqunGetAllDepZFUI
	 */
	@RequestMapping(value="JiaoxueShujiGetAlldangqun",method=RequestMethod.GET)
	public String JiaoxueShujiGetAlldangqun(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}
	
	/**
	 * 教学书记 正书记，对其所属部门，的副职进行评价，请求页面
	 * JiaoxueShujiGetAllDepDown
	 * @author 刘阳阳
	 */
	@RequestMapping(value="JiaoxueShujiGetAllDepDownUI",method=RequestMethod.GET)
	public ModelAndView JiaoxueShujiGetAllDepDownUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(3);
		//isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllJiaoShuShuJiDepDown(isEval);		
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已本单位副职评价过！");
		} else {
			//未评价过
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.jiaoxueshujiAllGetDepDown(user);
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/JiaoxueShujiGetAllDepDown");
		}
		return modelAndView;
	}
	
	/**
	 * 教学书记 评价 本单位，所有副职
	 * dangqunGetAllDepZFUI
	 */
	@RequestMapping(value="JiaoxueShujiGetAllDepDown",method=RequestMethod.GET)
	public String JiaoxueShujiGetAllDepDown(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}
	
	
	/**
	 * 行政教辅部门 与院系院长副院长，互评请求页面
	 * XzGetAllYxYzUI 行政 get 所有 院系院长 副院长，
	 * @author 刘阳阳
	 */
	@RequestMapping(value="XzGetAllYxYzUI",method=RequestMethod.GET)
	public ModelAndView XzGetAllYxYzUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);	
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 1 厅级对上机
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		//isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllYxYz(isEval);  //YxYz 院系院长
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已对院系院长副院长评价过！");
		} else {
			//未评价过
			//User user = (User) session.get("user");
			List<User> userList = userService.XzGetAllYxYz();
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/XzGetAllYxYz");
		}
		return modelAndView;
	}
	
	/**
	 * 行政教辅部门 与院系院长副院长，互评,处理结果
	 * 教学书记 评价 本单位，所有副职
	 * dangqunGetAllDepZFUI
	 */
	@RequestMapping(value="XzGetAllYxYz",method=RequestMethod.GET)
	public String XzGetAllYxYz(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}
	
	
	/**
	 * 行政教辅部门 正职 对所有本单位的副职，进行评价
	 * 
	 */
	@RequestMapping(value="XzGetAllDepDownUI",method=RequestMethod.GET)
	public ModelAndView XzGetAllDepDownUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);	
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 1 厅级对上机
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(3);
		//isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllDepDown(isEval);  //YxYz 院系院长
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已本单位所有副职评价过！");
		} else {
			//未评价过
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.XzGetAllDepDown(user);
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/XzGetAllDepDown");
		}
		return modelAndView;
	}
	
	/**
	 * 行政教辅部门 正职 对所有本单位的副职，进行评价
	 * 
	 */
	@RequestMapping(value="XzGetAllDepDown",method=RequestMethod.GET)
	public String XzGetAllDepDown(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 3, null);
		return "User/successEval";
	}
	
	
	
	/**
	 * 院系院长评价 对 所有行政部门进行评价
	 * 
	 * YxYzGetXzUI
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="YxYzGetXzUI",method=RequestMethod.GET)
	public ModelAndView YxYzGetXzUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);	
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 1 厅级对上机
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		//isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllYxYz(isEval);  //YxYz 院系院长
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已对行政教辅部门评价过！");
		} else {
			//未评价过
			//User user = (User) session.get("user");
			List<User> userList = userService.YxYzGetXz();  //院系院长get行政
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/YxYzGetXz");
		}
		return modelAndView;
	}
	
	/**
	 * 院系院长评价  对  所有行政部门进行评价
	 * 
	 */
	@RequestMapping(value="YxYzGetXz",method=RequestMethod.GET)
	public String YxYzGetXz(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}
	
	/**
	 * 院系院长 对 本单位 所有副院长评价
	 * YxYzGetDepDownUI
	 * @author 刘阳阳
	 */
	@RequestMapping(value="YxYzGetDepDownUI",method=RequestMethod.GET)
	public ModelAndView YxYzGetDepDownUI(HttpSession session){
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中 desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(3);
		//isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllYxYzDepDown(isEval);		
		if(num.size() > 0){
			//评价过
			modelAndView.addObject("message","您已本单位副职评价过！");
		} else {
			//未评价过
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.YxYzGetAllDepDown(user);
			modelAndView.addObject("userList",userList);
			modelAndView.addObject("userNum",userList.size());
			modelAndView.addObject("url","/user/YxYzGetDepDown");
		}
		return modelAndView;
	}
	
	/**
	 * 院系院长 对 本单位 所有副院长评价
	 * 
	 */
	@RequestMapping(value="YxYzGetDepDown",method=RequestMethod.GET)
	public String YxYzGetDepDown(@RequestParam("evalEvalto") Integer evalEvalto,@RequestParam("evalEvalby") Integer[] evalEvalby,@RequestParam("resultt") String result){	
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 3, null);
		return "User/successEval";
	}
	
	/**
	 * 请求修改密码页面
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="updatePasswordUI/{id}",method=RequestMethod.GET)
	public ModelAndView updatePasswordUI(@PathVariable("id") Integer id){
		System.out.println(id);
		String viewname = "User/updatePasswprdUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		modelAndView.addObject("userId", id);
		return modelAndView;
	}
	
	/**
	 * 修改密码前Ajax检测密码是否正确
	 * @author 刘阳阳
	 */
	@ResponseBody
	@RequestMapping(value="ajaxNotOrSuccess",method=RequestMethod.POST)
	public boolean ajaxNotOrSuccess(@RequestParam("id") Integer id,@RequestParam("password") String password){
		System.out.println("id" + id);
		System.out.println("password" + password);
		User user = userService.selectByPrimaryKey(id);
		if(password.equals(user.getUserPassword())){
			return true;
		}
		return false;
		
	}
	
	/**
	 * 处理修改密码，更改密码
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="updatePassword",method=RequestMethod.POST)
	public String updatePassword(@RequestParam("userId") Integer userId,@RequestParam("password") String password,HttpSession session){
		System.out.println(userId + "===" + password);
		User user = userService.selectByPrimaryKey(userId);
		user.setUserPassword(password);
		userService.updateByPrimaryKeySelective(user);
		session.removeAttribute("user");
		return "redirect:/user/loginUI";
	}
	
	/**
	 * 删除部门
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="deleteDep/{id}",method=RequestMethod.GET)
	public String deleteDep(@PathVariable("id") Integer id){
		userService.deleteDep(id);
		return "redirect:/department/getAllDep";
	}
	
	/**
	 * 
	 * 查询所有角色
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="getAllRole",method=RequestMethod.GET)
	public ModelAndView getAllRole(){
		String viewname = "User/allRole";
		ModelAndView modelAndView = new ModelAndView(viewname);
		List<Role> roleList = userService.getAllRole();
		modelAndView.addObject("roleList", roleList);
		
		return modelAndView;
	}
	
	/**
	 * 添加角色，请求页面
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="addRoleUI",method=RequestMethod.GET)
	public ModelAndView addRoleUI(){
		String viewname = "User/addRoleUI";
		ModelAndView modelAndViewa = new ModelAndView(viewname);
		modelAndViewa.addObject("role", new Role());
		return modelAndViewa;
	}
	
	/**
	 * 添加角色，
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="addRole",method=RequestMethod.POST)
	public String addRole(Role role){
		userService.insertRole(role);
		return "redirect:getAllRole";
	}
	
	/**
	 * 删除角色，
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="deleteRole/{id}",method=RequestMethod.GET)
	public String deleteRole(@PathVariable("id") Integer id){
		userService.deleteRole(id);
		return "redirect:/user/getAllRole";
	}
	
	/**
	 * 修改角色，请求页面
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value="updateRoleUI/{id}",method=RequestMethod.GET)
	public ModelAndView updateRoleUI(@PathVariable("id") Integer id){
		Role role = userService.getByIdRole(id);		
		String viewname = "User/updateRoleUI";
		ModelAndView modelAndViewa = new ModelAndView(viewname);
		modelAndViewa.addObject("role", role);
		return modelAndViewa;
	}
	
	/**
	 * 修改角色
	 */
	@RequestMapping(value="updateRole",method=RequestMethod.POST)
	public String updateRole(Role role){
		userService.updateRole(role);
		return "redirect:/user/getAllRole";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int publicAccountInsert(Integer evalEvalto,Integer[] evalEvalby,String result,int cate,String desc){
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
			eva.setEvalCate(cate);
			//设置互评
			//eva.setEvalDesc(desc);
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		return num;
	}
}

class Np{
	
	private Integer id;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
