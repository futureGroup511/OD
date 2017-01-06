package com.future.controller;

import com.future.base.BaseAction;
import com.future.domain.Department;
import com.future.domain.Evaluate;
import com.future.domain.Role;
import com.future.domain.TempEval;
import com.future.domain.User;
import com.future.utils.PageBean;
import com.mysql.jdbc.SocksProxySocketFactory;

import org.apache.commons.io.FileUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.*;

@Controller
@Scope("prototype")
@RequestMapping("user")
public class UserController extends BaseAction {

	// @SessionAttributes("user")
	
	@RequestMapping(value="resetPassword/{id}/{pageCurr}",method=RequestMethod.GET)
	public String resetPassword(@PathVariable("id") Integer id, @PathVariable("pageCurr") Integer pageCurr){
		//updateUserUI
		userService.resetPassword(id);
		return "redirect:/user/getAllUser/" + pageCurr;
	}

	/**
	 * 清空数据
	 */
	@RequestMapping(value="empetDate",method=RequestMethod.GET)
	public ModelAndView empetDate(){
		int a = userService.delteDateFromEvaluate();
		int b = userService.updateDateStatistic();
		int c = userService.delteDateFromTempEvaluate();
		String viewname = "User/success";
		ModelAndView modelAndView = new ModelAndView(viewname);
		modelAndView.addObject("message", "数据清除成功！");
		System.out.println(123);
		return modelAndView;
	}
	
	/**
	 * ajax获取所有用户姓名
	 */
	@ResponseBody
	@RequestMapping(value="ajaxgetAllUserName",method=RequestMethod.POST)
	public List<String> ajaxgetAllUserName(){
		//System.out.println("aaaaa");
		List<String> list = userService.ajaxgetAllUserName();
		//System.out.println(list);
		return list;
	}
	
	
	/**
	 * 
	 * 
	 * 根据用户名称，查询改用户，模糊查询
	 */
	@RequestMapping(value="findByNameForUser",method=RequestMethod.POST)
	public ModelAndView findByNameForUser(@RequestParam("name") String username,@RequestParam("role") String role,HttpServletRequest request){
		System.out.println(username);
		User tempuser = new User();
		if(username.equals("") && role.equals("0")){
			String message = (String) request.getSession().getAttribute("userDeleteMessage");
			request.getSession().removeAttribute("userDeleteMessage");
			
			String viewname="User/allUser";
			ModelAndView modelAndView = new ModelAndView(viewname);
			//PageBean pageBean = PageBean.newInstance(); 
			PageBean pageBean = PageBean.getDefault();
			pageBean.setCurrentPage(currentPage);
			pageBean = userService.pageBeanGetAllUser(pageBean);
			pageBean.calbeginAndEnd();
			modelAndView.addObject("pageBean",pageBean);
			modelAndView.addObject("userDeleteMessage", message);
			return modelAndView;
		}
		if(username.equals("")){
			tempuser.setUserName(null);
		} else {
			tempuser.setUserName(username);
		}
		if(role.equals("0") ){
			tempuser.setUserRole(null);
		} else {
			tempuser.setUserRole(Integer.parseInt(role));
		}
		
		//tempuser.setUserName(username);
		
		List<User> user = userService.findByNameForUser(tempuser);
		String viewname = "User/allUser";
		ModelAndView modelAndView = new ModelAndView(viewname);
		modelAndView.addObject("userr", user);
		modelAndView.addObject("tempRole", role);
		return modelAndView;
	}
	
	/**
	 * 添加用户时请求Ajax，查询是否存在同名用户
	 */
	@ResponseBody
	@RequestMapping(value = "ajaxgetisOrNotUser", method = RequestMethod.POST)
	public Boolean ajaxgetisOrNotUser(@RequestParam("usernum") String userNum) {
		System.out.println(userNum);
		User user = userService.ajaxgetisOrNotUser(userNum);
		if (user == null) {
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
	@RequestMapping(value = "returnMeun", method = RequestMethod.GET)
	public String returnMeun() {
		return "User/menu";
	}

	/**
	 * 登陆页面请求
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "loginUI", method = RequestMethod.GET)
	public String loginUI() {
		return "User/loginUI";
	}

	/**
	 * 处理登陆请求
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	// public ModelAndView login(@RequestParam("username") String
	// username,@RequestParam("password") String password,ModelMap session){
	public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, HttpServletRequest request) {
		User user = userService.login(username, password);
		if (user != null) {
			String viewname = "User/shouye";
			ModelAndView modelAndView = new ModelAndView(viewname);
			// session.addAttribute("user",user);
			session.setAttribute("user", user);
			return modelAndView;
		} else {
			String viewname = "User/loginUI";
			ModelAndView modelAndView = new ModelAndView(viewname);
			// session.addAttribute("message","账号或密码错误");
			request.setAttribute("message", "账号或密码错误!");
			// session.setAttribute("message","账号或密码错误");
			return modelAndView;
		}
	}
	
	/**
	 * 处理登陆请求
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	// public ModelAndView login(@RequestParam("username") String
	// username,@RequestParam("password") String password,ModelMap session){
	public ModelAndView aaa(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session, HttpServletRequest request) {
		User user = userService.login(username, password);
		if (user != null) {
			String viewname = "User/shouye";
			ModelAndView modelAndView = new ModelAndView(viewname);
			// session.addAttribute("user",user);
			session.setAttribute("user", user);
			return modelAndView;
		} else {
			String viewname = "User/loginUI";
			ModelAndView modelAndView = new ModelAndView(viewname);
			// session.addAttribute("message","账号或密码错误");
			request.setAttribute("message", "账号或密码错误111");
			// session.setAttribute("message","账号或密码错误");
			return modelAndView;
		}
	}

	/**
	 * 处理登出请求
	 * 
	 * @author 刘阳阳
	 * @throws IOException
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	// public void logout(ModelMap session){
	// public ModelAndView logout(SessionStatus sessionStatus) throws
	// IOException{
	// public String logout(SessionStatus sessionStatus) throws IOException{
	public String logout(HttpSession session) throws IOException {
		// sessionStatus.setComplete();
		session.removeAttribute("user");
		// ModelAndView modelAndView = new ModelAndView("User/loginUI");
		return "redirect:loginUI";
	}

	/**
	 * 查询所有用户信息
	 * 
	 * @return modelAndView视图显示
	 */
	@RequestMapping(value = "getAllUser111", method = RequestMethod.GET)
	public ModelAndView getAllUser111() {
		String viewname = "User/allUser";
		ModelAndView modelAndView = new ModelAndView(viewname);
		List<User> list = userService.getAllUser();
		modelAndView.addObject("userList", list);
		return modelAndView;
	}

	/**
	 * 查询所有用户信息，分页显示
	 * @return modelAndView视图显示
	 */
	@RequestMapping(value="getAllUser/{currentPage}",method=RequestMethod.GET)
	public ModelAndView getAllUser(@PathVariable("currentPage") Integer currentPage,HttpServletRequest request){
		String message = (String) request.getSession().getAttribute("userDeleteMessage");
		request.getSession().removeAttribute("userDeleteMessage");
		
		String viewname="User/allUser";
		ModelAndView modelAndView = new ModelAndView(viewname);
		//PageBean pageBean = PageBean.newInstance(); 
		PageBean pageBean = PageBean.getDefault();
		pageBean.setCurrentPage(currentPage);
		pageBean = userService.pageBeanGetAllUser(pageBean);
		pageBean.calbeginAndEnd();
		modelAndView.addObject("pageBean",pageBean);
		modelAndView.addObject("userDeleteMessage", message);
		return modelAndView;
	}

	/**
	 * 准备添加用户页面
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "addUserUI", method = RequestMethod.GET)
	public ModelAndView addUserUI() {
		String viewname = "User/addUserUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		List<Role> role = roleService.getAllRole();
		List<Department> dep = departmentService.getAllDep();

		modelAndView.addObject("user", new User());
		modelAndView.addObject("userRole", role);
		modelAndView.addObject("userDep", dep);
		return modelAndView;
	}

	/**
	 * 添加用户
	 * 
	 * @author 刘阳阳
	 * @RequestMapping(value="addUser",method=RequestMethod.POST) public String
	 *                                                            addUser(User
	 *                                                            user){
	 *                                                            userService.insert(user);
	 *                                                            return
	 *                                                            "redirect:getAllUser";
	 *                                                            }
	 */
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	public String addUser(User user, @RequestParam("uploadfile") CommonsMultipartFile file,
			HttpServletRequest request) {
		// public String addUser(User user){
		// userService.insert(user);
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
		if (filename != "") {
			user.setUserReport("upload/" + filename);
		}
		userService.insert(user);
		return "redirect:getAllUser/1";
	}

	@RequestMapping(value = "updateUserUI/{id}/{pageCurr}", method = RequestMethod.GET)
	public ModelAndView updateUserUI(@PathVariable("id") Integer id, @PathVariable("pageCurr") Integer pageCurr,Map<String, Object> map) {
		String viewname = "User/addUserUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		User user = userService.selectByPrimaryKey(id);
		List<Role> role = roleService.getAllRole();
		List<Department> dep = departmentService.getAllDep();

		modelAndView.addObject("user", user);
		modelAndView.addObject("userRole", role);
		modelAndView.addObject("userDep", dep);
		modelAndView.addObject("pageCurr", pageCurr);
		
		return modelAndView;
	}

	/**
	 * 修改用户
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "updateUser", method = RequestMethod.POST)
	public String updateUser(User user, @RequestParam("uploadfile") CommonsMultipartFile file,
			HttpServletRequest request) {

		String pageCurr = request.getParameter("pageCurr");
		if (file.isEmpty()) {
			userService.updateByPrimaryKey(user);
		} else {
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
			if (filename != "") {
				user.setUserReport("upload/" + filename);
			}

			userService.updateByPrimaryKey(user);
		}
		System.out.println(pageCurr);
		return "redirect:/user/getAllUser/" + pageCurr;
	}
	
	/**
	 * 
	 * 上传述职报告 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "uploadResport", method = RequestMethod.POST)
	public ModelAndView uploadResport(@RequestParam("uploadfile") CommonsMultipartFile file,
			HttpServletRequest request) {
			String viewname = "User/success";
			ModelAndView modelAndView = new ModelAndView(viewname);
			
			User user = (User) request.getSession().getAttribute("user");
			System.out.println(user);
			
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
			if (filename != "") {
				user.setUserReport("upload/" + filename);
			}
			userService.updateByPrimaryKey(user);
			modelAndView.addObject("message", "上传成功！");
		return modelAndView;
	}

	@RequestMapping(value = "deleteUser/{id}", method = RequestMethod.GET)
	public String deleteUser(@PathVariable("id") Integer id,HttpServletRequest request) {
		System.out.println(id);
		try {
			userService.deleteUser(id);
		} catch (Exception e) {
			request.getSession().setAttribute("userDeleteMessage", "因为此用户有关联记录，所有无法删除！");
		}
		return "redirect:/user/getAllUser/1";
	}

	/**
	 * 校正厅对所有正职评价,请求页面
	 * 
	 * @author 刘阳阳
	 */
	// public ModelAndView xzAllzUI(ModelMap session){
	@RequestMapping(value = "xzAllzUI", method = RequestMethod.GET)
	public ModelAndView xzAllzUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型
		// 类别(1互评、2厅级上对下、3本单位上对下)， （注意，本次查询在mapper只用到了一个userid其余写死的死的，如果修改代码请注意）
		// 查到有记录就代表评价过，
		Evaluate isEval = new Evaluate();
		// User tempuser = (User) session.get("user");
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(2);
		isEval.setEvalDesc("0");
		List<Evaluate> num = userService.getIsOrNoAllZheng(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对所有处级干部评价过！！");
		} else {
			
			//必须进行的操作，因为要拿到数量
			List<User> user = userService.getxzAllz();
			
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),2,"0");
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User tempuser1 = (User) session.getAttribute("user");
			List<User> userList = userService.xzAllFenGuanUI(tempuser1.getUserName());
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			}else{
				// 未评价过
				modelAndView.addObject("userList", user);
			}
			modelAndView.addObject("userNum", user.size());
			modelAndView.addObject("pingjiaMessage", "处级干部评价");
			modelAndView.addObject("url", "/user/xzAllz");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "2");
			modelAndView.addObject("zancunDesc","0");
			
			
			
		}
		return modelAndView;
			
	}

	/**
	 * ajax获取本次评价的优秀的百分比，
	 * 
	 * @author 刘阳阳
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping(value = "ajaxgetBili", method = RequestMethod.POST)
	public String ajaxgetBili() throws IOException {
		System.out.println("ajax收到");
		InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("date.properties");

		Properties pro = new Properties();
		pro.load(inputStream);
		String a = pro.getProperty("bili");
		return a;
	}
	
	/**
	 * 获取比例之后的 30%计算 
	 * 
	 * 增加两行注释
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="ajaxgetBiliAfter",method=RequestMethod.POST)
	public boolean ajaxgetBiliAfter(@RequestParam("countUsre") String countUsre,@RequestParam("countResult") String countResult) throws IOException{
		//拿到人数和评价对应的数组
		String[] user = countUsre.split(",");
		String[] result = countResult.split(",");
		List<String> goodUserList = new ArrayList();
		//循环评价，是优秀的就把人id存到list中
		for(int i=0;i<result.length;i++){
			if(result[i].equals("1")){
				goodUserList.add(user[i]);
			}
		}
		
		//查询优秀评价结果有多少是副职
		System.out.println(goodUserList);
		if(goodUserList.size() != 0){
			int num = userService.getUserGoodFuZhi(goodUserList);
			//百分之30
			float baifenzhisanshi = ((float)num)/((float)goodUserList.size());
			System.out.println("num:" + num);
			System.out.println("zong:" + goodUserList.size());
			System.out.println(baifenzhisanshi);
			//读取0.3
			InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("date.properties");
			
			Properties pro = new Properties();
			pro.load(inputStream);
			String a = pro.getProperty("xibili");
			float xibili = Float.parseFloat(a);
			System.out.println("xiblli:" + xibili);
			if(baifenzhisanshi >= xibili/100){
				//大于百分之30返回true
				System.out.println("大于0.3");
				return true;
			} else {
				//System.out.println("小玉0.3");
				return false;
			}
		} else {
			return true;
		}
	}
	
	

	/**
	 * 校正厅对所有正职评价，处理结果
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "xzAllz", method = RequestMethod.GET)
	public String xzAllz(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		System.out.println("评价人" + evalEvalto);
		System.out.println("被评价人数" + evalEvalby.length);
		System.out.println("被评价人：");
		for (int i = 0; i < evalEvalby.length; i++) {
			System.out.print(evalEvalby[i] + " ");
		}
		System.out.println("评价结果");
		String[] result1 = result.split(",");

		for(int i=0;i<result1.length;i++){
			if(result1[i].equals("1")){
				result1[i] = "100";
			}
			if(result1[i].equals("2")){
				result1[i] = "80";
			}
			if(result1[i].equals("3")){
				result1[i] = "60";
			}
			if(result1[i].equals("4")){
				result1[i] = "40";
			}
		}
		
		// 拿到结合，已备存储结果
		List<Evaluate> evaList = new ArrayList<Evaluate>();
		for (int i = 0; i < result1.length; i++) {
			Evaluate eva = new Evaluate();
			// 评价人
			eva.setEvalEvalto(evalEvalto);
			// 被评价人
			eva.setEvalEvalby(evalEvalby[i]);
			// 级别 优良中茶
			eva.setEvalRank(Integer.parseInt(result1[i]));
			// 设置级别
			eva.setEvalCate(2);
			// 设置校正厅对正职大的分
			eva.setEvalDesc("0");
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		System.out.println(num);
		return "User/successEval";
	}

	/**
	 * 校正厅对所有分管单位正副职评价,请求页面
	 * 
	 * @author 刘阳阳
	 */
	// public ModelAndView xzAllFenGuanUI(ModelMap session){
	@RequestMapping(value = "xzAllFenGuanUI", method = RequestMethod.GET)
	public ModelAndView xzAllFenGuanUI(HttpSession session) {

		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);

		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中
		// desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		// User tempuser = (User) session.get("user");
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(2);
		isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllFenGuan(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对分管单位所有人员评价过！！");
		} else {
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),2,"1");
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.xzAllFenGuanUI(user.getUserName());
			if(tempEvalList.size() > 0){
				//System.out.println("=============");
				//System.out.println(tempEvalList);
				//System.out.println("=============");
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				// 查询分管单位的所有人 从当前session拿到单位id，传到dao层查询
				// User user = (User) session.get("user");
				modelAndView.addObject("userList", userList);
			}
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "分管(联点)单位评价");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "2");
			modelAndView.addObject("zancunDesc","1");
			modelAndView.addObject("url", "/user/xzAllFenGuan");	
		}
		return modelAndView;
	}

	/**
	 * 校正厅对所有=分管单位=评价，处理结果
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "xzAllFenGuan", method = RequestMethod.GET)
	public String xzAllFenGuan(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		System.out.println("评价人" + evalEvalto);
		System.out.println("被评价人数" + evalEvalby.length);
		System.out.println("被评价人：");
		for (int i = 0; i < evalEvalby.length; i++) {
			System.out.print(evalEvalby[i] + " ");
		}
		System.out.println("评价结果");
		String[] result1 = result.split(",");

		for(int i=0;i<result1.length;i++){
			if(result1[i].equals("1")){
				result1[i] = "100";
			}
			if(result1[i].equals("2")){
				result1[i] = "80";
			}
			if(result1[i].equals("3")){
				result1[i] = "60";
			}
			if(result1[i].equals("4")){
				result1[i] = "40";
			}
		}
		
		// 拿到结合，已备存储结果
		List<Evaluate> evaList = new ArrayList<Evaluate>();
		for (int i = 0; i < result1.length; i++) {
			Evaluate eva = new Evaluate();
			// 评价人
			eva.setEvalEvalto(evalEvalto);
			// 被评价人
			eva.setEvalEvalby(evalEvalby[i]);
			// 级别 优良中茶
			eva.setEvalRank(Integer.parseInt(result1[i]));
			// 设置级别
			eva.setEvalCate(2);
			// 设置校正厅对正职大的分
			eva.setEvalDesc("1");
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		System.out.println(num);
		return "User/successEval";
	}
	
	
	/**
	 *校副厅对所有处级干部评价，比例cate为3 
	 * xfAllzfUI
	 * 
	 */
	@RequestMapping(value = "xfAllzfUI", method = RequestMethod.GET)
	public ModelAndView xfAllzfUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型
		// 类别(1互评、2正厅级打分和分管领导打分0.7 3、其他副厅级打分0.3  3本单位上对下)， 
		//（注意，本次查询在mapper只用到了一个userid其余写死的死的，如果修改代码请注意）
		// 查到有记录就代表评价过，
		Evaluate isEval = new Evaluate();
		// User tempuser = (User) session.get("user");
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(3);
		isEval.setEvalDesc("0");
		List<Evaluate> num = userService.getIsOrNoAllZheng(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对所有处级干部评价过！！");
		} else {
			
			//必须进行的操作，因为要拿到数量
			List<User> user = userService.getxzAllz();
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),3,"0");
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User tempuser1 = (User) session.getAttribute("user");
			List<User> userList = userService.xzAllFenGuanUI(tempuser1.getUserName());
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			}else{
				// 未评价过
				modelAndView.addObject("userList", user);
			}
			
			// 未评价过
			modelAndView.addObject("userNum", user.size());
			modelAndView.addObject("pingjiaMessage", "处级干部评价");
			modelAndView.addObject("url", "/user/xfAllzf");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "3");
			modelAndView.addObject("zancunDesc","0");
			
		}
		return modelAndView;
	}
	
	/**
	 * 校副厅对所有处级干部评价   
	 * 
	 */
	@RequestMapping(value = "xfAllzf", method = RequestMethod.GET)
	public String xfAllzf(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 3, "0");
		return "User/successEval";
	}
	
	
	/**
	 * 校副厅--对所有 分管单位 正副职评价,请求页面
	 * 
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "xfAllFenGuanUI", method = RequestMethod.GET)
	public ModelAndView xfAllFenGuanUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);

		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中
		// desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(2);
		isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllFenGuanXF(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对分管单位所有人员评价过！！");
		} else {
			
			//必须进行的操作，因为要拿到数量
			List<User> userList = userService.xfAllFenGuanUI(tempuser.getUserName());
			
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),2,"1");
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			}else{
				modelAndView.addObject("userList", userList);
			}
			
			// 未评价过
			// 查询分管单位的所有人 从当前session拿到单位id，传到dao层查询
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "分管(联点单位评价)");
			modelAndView.addObject("url", "/user/xfAllFenGuan");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "2");
			modelAndView.addObject("zancunDesc","1");
			
		}
		return modelAndView;
	}

	/**
	 * 校副厅对所有=分管单位=评价，处理结果
	 * 
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "xfAllFenGuan", method = RequestMethod.GET)
	public String xfAllFenGuan(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		System.out.println("评价人" + evalEvalto);
		System.out.println("被评价人数" + evalEvalby.length);
		System.out.println("被评价人：");
		for (int i = 0; i < evalEvalby.length; i++) {
			System.out.print(evalEvalby[i] + " ");
		}
		System.out.println("评价结果");
		String[] result1 = result.split(",");

		for(int i=0;i<result1.length;i++){
			if(result1[i].equals("1")){
				result1[i] = "100";
			}
			if(result1[i].equals("2")){
				result1[i] = "80";
			}
			if(result1[i].equals("3")){
				result1[i] = "60";
			}
			if(result1[i].equals("4")){
				result1[i] = "40";
			}
		}
		
		// 拿到结合，已备存储结果
		List<Evaluate> evaList = new ArrayList<Evaluate>();
		for (int i = 0; i < result1.length; i++) {
			Evaluate eva = new Evaluate();
			// 评价人
			eva.setEvalEvalto(evalEvalto);
			// 被评价人
			eva.setEvalEvalby(evalEvalby[i]);
			// 级别 优良中茶
			eva.setEvalRank(Integer.parseInt(result1[i]));
			// 设置级别
			eva.setEvalCate(2);
			// 设置校 副厅 厅对正职大的分
			eva.setEvalDesc("1");
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		System.out.println(num);
		return "User/successEval";
	}

	/**
	 * 党群部门 评价所有教学书记副书记,请求页面 dangqunGetAllJiaoxueShujiUI
	 */
	@RequestMapping(value = "dangqunGetAllJiaoxueShujiUI", method = RequestMethod.GET)
	public ModelAndView dangqunGetAllJiaoxueShujiUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中
		// desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		// isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllDangQunZHP(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对院系书记副书记评价过！！");
		} else {
			
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.dangquanAllHPUser();
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),1,"3");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}
			
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "对口干部互评");
			modelAndView.addObject("url", "/user/dangqunGetAllJiaoxueShuji");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "1");
			modelAndView.addObject("zancunDesc","3");		
			
		}
		return modelAndView;
	}

	/**
	 * 党群部门 评价所有教学书记副书记，接受表单请求 dangqunGetAllJiaoxueShuji
	 */
	@RequestMapping(value = "dangqunGetAllJiaoxueShuji", method = RequestMethod.GET)
	public String dangqunGetAllJiaoxueShuji(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}

	/**
	 * 党群部门 评价 本单位所有副职 请求页面 dangqunGetAllDepZFUI
	 */
	@RequestMapping(value = "dangqunGetAllDepZFUI", method = RequestMethod.GET)
	public ModelAndView dangqunGetAllDepZFUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中
		// desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(4);
		// isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllDangQunDepDown(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已本单位副职评价过！");
		} else {
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.dangquanAllDepDwon(tempuser);
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),4,"4");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}
			
			// 未评价过
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "单位副职评价");
			modelAndView.addObject("url", "/user/dangqunGetAllDepZF");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "4");
			modelAndView.addObject("zancunDesc","4");
			
			
			
		}
		return modelAndView;
	}

	/**
	 * 党群部门 评价 本单位所有副职 接受表单请求 dangqunGetAllDepZFUI
	 */
	@RequestMapping(value = "dangqunGetAllDepZF", method = RequestMethod.GET)
	public String dangqunGetAllDepZF(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 4, null);
		return "User/successEval";
	}

	/**
	 * 教学书记副书记 互评 对所有党群，请求页面 JiaoxueShujiGetAlldangqunUI
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "JiaoxueShujiGetAlldangqunUI", method = RequestMethod.GET)
	public ModelAndView JiaoxueShujiGetAlldangqunUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中
		// desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		// isEval.setEvalDesc("1");
		// 调用党群的方法 //=====================此处少一个方法。
		List<Evaluate> num = userService.getIsOrNoAllDangQunZHP(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对党群部门互评过！");
		} else {
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			List<User> userList = userService.JiaoxueShujiGetAlldangqun();
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),1,"4");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}	
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "对口干部互评");
			modelAndView.addObject("url", "/user/JiaoxueShujiGetAlldangqun");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "1");
			modelAndView.addObject("zancunDesc","4");	
			
			
		}
		return modelAndView;
	}

	/**
	 * 教学书记副书记 互评 党群 dangqunGetAllDepZFUI
	 */
	@RequestMapping(value = "JiaoxueShujiGetAlldangqun", method = RequestMethod.GET)
	public String JiaoxueShujiGetAlldangqun(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}

	/**
	 * 教学书记 正书记，对其所属部门，的副职进行评价，请求页面 JiaoxueShujiGetAllDepDown
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "JiaoxueShujiGetAllDepDownUI", method = RequestMethod.GET)
	public ModelAndView JiaoxueShujiGetAllDepDownUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中
		// desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(4);
		// isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllJiaoShuShuJiDepDown(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已本单位副职评价过！");
		} else {
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.jiaoxueshujiAllGetDepDown(user);
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),4,"3");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "单位副职评价");
			modelAndView.addObject("url", "/user/JiaoxueShujiGetAllDepDown");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "4");
			modelAndView.addObject("zancunDesc","3");
		}
		return modelAndView;
	}

	/**
	 * 教学书记 评价 本单位，所有副职 dangqunGetAllDepZFUI
	 */
	@RequestMapping(value = "JiaoxueShujiGetAllDepDown", method = RequestMethod.GET)
	public String JiaoxueShujiGetAllDepDown(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 4, null);
		return "User/successEval";
	}

	/**
	 * 行政教辅部门 与院系院长副院长，互评请求页面 XzGetAllYxYzUI 行政 get 所有 院系院长 副院长，
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "XzGetAllYxYzUI", method = RequestMethod.GET)
	public ModelAndView XzGetAllYxYzUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 1 厅级对上机
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		// isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllYxYz(isEval); // YxYz 院系院长
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对院系院长副院长评价过！");
		} else {
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			List<User> userList = userService.XzGetAllYxYz();
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),1,"3");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "对口干部互评");
			modelAndView.addObject("url", "/user/XzGetAllYxYz");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "1");
			modelAndView.addObject("zancunDesc","3");
			
		}
		return modelAndView;
	}

	/**
	 * 行政教辅部门 与院系院长副院长，互评,处理结果 教学书记 评价 本单位，所有副职 dangqunGetAllDepZFUI
	 */
	@RequestMapping(value = "XzGetAllYxYz", method = RequestMethod.GET)
	public String XzGetAllYxYz(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}

	/**
	 * 行政教辅部门 正职 对所有本单位的副职，进行评价
	 * 
	 */
	@RequestMapping(value = "XzGetAllDepDownUI", method = RequestMethod.GET)
	public ModelAndView XzGetAllDepDownUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 1 厅级对上机
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(4);
		// isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllDepDown(isEval); // YxYz
																		// 院系院长
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已本单位所有副职评价过！");
		} else {
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.XzGetAllDepDown(user);
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),4,"3");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}

			// 未评价过
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "单位副职评价");
			modelAndView.addObject("url", "/user/XzGetAllDepDown");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "4");
			modelAndView.addObject("zancunDesc","3");
		}
		return modelAndView;
	}

	/**
	 * 行政教辅部门 正职 对所有本单位的副职，进行评价
	 * 
	 */
	@RequestMapping(value = "XzGetAllDepDown", method = RequestMethod.GET)
	public String XzGetAllDepDown(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 4, null);
		return "User/successEval";
	}

	/**
	 * 院系院长评价 对 所有行政部门进行评价
	 * 
	 * YxYzGetXzUI
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "YxYzGetXzUI", method = RequestMethod.GET)
	public ModelAndView YxYzGetXzUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 1 厅级对上机
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(1);
		// isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllYxYz(isEval); // YxYz 院系院长
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已对行政教辅部门评价过！");
		} else {
			
			
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			List<User> userList = userService.YxYzGetXz(); // 院系院长get行政
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),1,"3");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}
			// 未评价过		
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "对口干部互评");
			modelAndView.addObject("url", "/user/YxYzGetXz");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "1");
			modelAndView.addObject("zancunDesc","3");

		}
		return modelAndView;
	}

	/**
	 * 院系院长评价 对 所有行政部门进行评价
	 * 
	 */
	@RequestMapping(value = "YxYzGetXz", method = RequestMethod.GET)
	public String YxYzGetXz(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 1, null);
		return "User/successEval";
	}

	/**
	 * 院系院长 对 本单位 所有副院长评价 YxYzGetDepDownUI
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "YxYzGetDepDownUI", method = RequestMethod.GET)
	public ModelAndView YxYzGetDepDownUI(HttpSession session) {
		String viewname = "User/xzAllzUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		// 查询之前判断是否评价过，评价过的条件为，拿到session 评价人的userid，然后根据本次评价类别 2 厅级对上机，在在加上描述中
		// desc 为 1 代表校正厅对其分管单位打得分。
		Evaluate isEval = new Evaluate();
		User tempuser = (User) session.getAttribute("user");
		isEval.setEvalEvalto(tempuser.getUserId());
		isEval.setEvalCate(4);
		// isEval.setEvalDesc("1");
		List<Evaluate> num = userService.getIsOrNoAllYxYzDepDown(isEval);
		if (num.size() > 0) {
			// 评价过
			modelAndView.addObject("message", "您已本单位副职评价过！");
		} else {
			//首先拿到本来要评价的任，（因为要拿到具体人数，所以必须放出来）
			User user = (User) session.getAttribute("user");
			List<User> userList = userService.YxYzGetAllDepDown(user);
			//先检查是否有暂存记录，然后在进行一下操作
			List<TempEval> tempEvalList = userService.getByIdZanCunData(tempuser.getUserId(),4,"3");
			if(tempEvalList.size() > 0){
				modelAndView.addObject("tempEvalList", tempEvalList);
			} else {
				// 未评价过
				modelAndView.addObject("userList", userList);
			}		
			// 未评价过
			modelAndView.addObject("userNum", userList.size());
			modelAndView.addObject("pingjiaMessage", "单位副职评价");
			modelAndView.addObject("url", "/user/YxYzGetDepDown");
			//评价级别，和描述
			modelAndView.addObject("zancunCate", "4");
			modelAndView.addObject("zancunDesc","3");	
		}
		return modelAndView;
	}

	/**
	 * 院系院长 对 本单位 所有副院长评价
	 * 
	 */
	@RequestMapping(value = "YxYzGetDepDown", method = RequestMethod.GET)
	public String YxYzGetDepDown(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby, @RequestParam("resultt") String result) {
		int num = publicAccountInsert(evalEvalto, evalEvalby, result, 4, null);
		return "User/successEval";
	}

	/**
	 * 请求修改密码页面
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "updatePasswordUI/{id}", method = RequestMethod.GET)
	public ModelAndView updatePasswordUI(@PathVariable("id") Integer id) {
		System.out.println(id);
		String viewname = "User/updatePasswprdUI";
		ModelAndView modelAndView = new ModelAndView(viewname);
		modelAndView.addObject("userId", id);
		return modelAndView;
	}

	/**
	 * 修改密码前Ajax检测密码是否正确
	 * 
	 * @author 刘阳阳
	 */
	@ResponseBody
	@RequestMapping(value = "ajaxNotOrSuccess", method = RequestMethod.POST)
	public boolean ajaxNotOrSuccess(@RequestParam("id") Integer id, @RequestParam("password") String password) {
		System.out.println("id" + id);
		System.out.println("password" + password);
		User user = userService.selectByPrimaryKey(id);
		if (password.equals(user.getUserPassword())) {
			return true;
		}
		return false;

	}

	/**
	 * 处理修改密码，更改密码
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "updatePassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam("userId") Integer userId, @RequestParam("password") String password,
			HttpSession session) {
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
	@RequestMapping(value = "deleteDep/{id}", method = RequestMethod.GET)
	public String deleteDep(@PathVariable("id") Integer id,HttpServletRequest request) {
		try {
			userService.deleteDep(id);
		} catch (Exception e) {
			request.getSession().setAttribute("deleteDepMessage", "因为此单位有与之关联的记录，所以无法删除");
		}
		return "redirect:/department/getAllDep";
	}

	/**
	 * 
	 * 查询所有角色
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "getAllRole", method = RequestMethod.GET)
	public ModelAndView getAllRole() {
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
	@RequestMapping(value = "addRoleUI", method = RequestMethod.GET)
	public ModelAndView addRoleUI(HttpServletRequest request) {
		
		String message = (String) request.getSession().getAttribute("deleteRoleMessage");
		request.getSession().removeAttribute("deleteRoleMessage");
		String viewname = "User/addRoleUI";
		ModelAndView modelAndViewa = new ModelAndView(viewname);
		modelAndViewa.addObject("role", new Role());
		modelAndViewa.addObject("deleteRoleMessage", message);
		return modelAndViewa;
	}

	/**
	 * 添加角色，
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "addRole", method = RequestMethod.POST)
	public String addRole(Role role) {
		userService.insertRole(role);
		return "redirect:getAllRole";
	}

	/**
	 * 删除角色，
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "deleteRole/{id}", method = RequestMethod.GET)
	public String deleteRole(@PathVariable("id") Integer id,HttpServletRequest request) {
		try {
			userService.deleteRole(id);
		} catch (Exception e) {
			request.getSession().setAttribute("deleteRoleMessage", "此角色有与之对应的记录，所以无法删除！");
		}
		return "redirect:/user/getAllRole";
	}

	/**
	 * 修改角色，请求页面
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "updateRoleUI/{id}", method = RequestMethod.GET)
	public ModelAndView updateRoleUI(@PathVariable("id") Integer id) {
		Role role = userService.getByIdRole(id);
		String viewname = "User/updateRoleUI";
		ModelAndView modelAndViewa = new ModelAndView(viewname);
		modelAndViewa.addObject("role", role);
		return modelAndViewa;
	}

	/**
	 * 修改角色
	 */
	@RequestMapping(value = "updateRole", method = RequestMethod.POST)
	public String updateRole(Role role) {
		userService.updateRole(role);
		return "redirect:/user/getAllRole";
	}

	public int publicAccountInsert(Integer evalEvalto, Integer[] evalEvalby, String result, int cate, String desc) {
		String[] result1 = result.split(",");

		for(int i=0;i<result1.length;i++){
			if(result1[i].equals("1")){
				result1[i] = "100";
			}
			if(result1[i].equals("2")){
				result1[i] = "80";
			}
			if(result1[i].equals("3")){
				result1[i] = "60";
			}
			if(result1[i].equals("4")){
				result1[i] = "40";
			}
		}
		
		// 拿到结合，已备存储结果
		List<Evaluate> evaList = new ArrayList<Evaluate>();
		for (int i = 0; i < result1.length; i++) {
			Evaluate eva = new Evaluate();
			// 评价人
			eva.setEvalEvalto(evalEvalto);
			// 被评价人
			eva.setEvalEvalby(evalEvalby[i]);
			// 级别 优良中茶
			eva.setEvalRank(Integer.parseInt(result1[i]));
			// 设置级别
			eva.setEvalCate(cate);
			// 设置互评
			eva.setEvalDesc(desc);
			evaList.add(eva);
		}
		int num = userService.insertAll(evaList);
		return num;
	}

	/**
	 *
	 * @param file
	 * @param status 为1的时候进入页面，为2是修改数值
	 * @return
	 */
	@RequestMapping("/modifyProperties")
	public ModelAndView modifyProperties(com.future.utils.File file,@RequestParam("juge")Integer status) throws IOException {
		ModelAndView modelAndView=new ModelAndView();
		Properties properties = new Properties();
		String path="src/main/resources/President.properties";
		if (status == 1) {
			file.getAllvalue(path);
		}else if (status ==2){
			file.update(path);
			modelAndView.addObject("message","修改成功");
		}
		modelAndView.setViewName("/User/modifyProperties");
		modelAndView.addObject("file",file);
		return  modelAndView;
	}

	/**
	 * 修改党群正处、行政正处权重
	 * @param file
	 * @param status
	 * @return
	 */
	@RequestMapping("/modifySGProperties")
	public ModelAndView modifySGProperties(com.future.utils.File file,@RequestParam("juge")Integer status){
		ModelAndView modelAndView=new ModelAndView();
		Properties properties = new Properties();
		String path="src/main/resources/SGweigth.properties";
		if(status == 1) file.getAllvalue(path);
		else if(status == 2){
			file.update(path);
			modelAndView.addObject("message","修改成功");
		}
		modelAndView.setViewName("/User/modifySGProperties");
		modelAndView.addObject("file",file);
		return  modelAndView;
	}
	/**
	 * 修改教学副书记，教学副院长权重
	 * @param file
	 * @param status
	 * @return
	 */
	@RequestMapping("/modifySBGProperties")
	public ModelAndView modifySBGProperties(com.future.utils.File file,@RequestParam("juge")Integer status){
		ModelAndView modelAndView=new ModelAndView();
		String path="src/main/resources/SBGweigth.properties";
		if(status == 1) file.getAllvalue(path);
		else if(status == 2){
			file.update(path);
			modelAndView.addObject("message","修改成功");
		}
		modelAndView.setViewName("/User/modifySBGProperties");
		modelAndView.addObject("file",file);
		return modelAndView;
	}

	/**
	 * 教学正书记、教学正院长
	 * @param file
	 * @param status
	 * @return
	 */
	@RequestMapping("/modifyAGProperties")
	public ModelAndView modifyAGProperties(com.future.utils.File file,@RequestParam("juge")Integer status){
		ModelAndView modelAndView=new ModelAndView();
		String path="src/main/resources/AGweigth.properties";
		if(status == 1) file.getAllvalue(path);
		else if(status == 2){
			file.update(path);
			modelAndView.addObject("message","修改成功");
		}
		modelAndView.setViewName("/User/modifyAGProperties");
		modelAndView.addObject("file",file);
		return modelAndView;
	}

	@RequestMapping("/modifyDCProperties")
	public ModelAndView modifyDCProperties(com.future.utils.File file,@RequestParam("juge")Integer status){
		ModelAndView modelAndView=new ModelAndView();
		String path="src/main/resources/DCweigth.properties";
		if(status == 1) file.getAllvalue(path);
		else if(status == 2){
			file.update(path);
			modelAndView.addObject("message","修改成功");
		}
		modelAndView.setViewName("/User/modifyDCProperties");
		modelAndView.addObject("file",file);
		return modelAndView;
	}

	@RequestMapping("/modifyexcellent")
	public ModelAndView modifyexcellent(@RequestParam(value="bili",required = false)String bili
										,@RequestParam("juge")Integer juge
										,@RequestParam(value = "xibili",required = false)String xibili){

		ModelAndView modelAndView=new ModelAndView();
		Properties properties=new Properties();
		String path="src/main/resources/date.properties";
		try {
			InputStream inputStream = new BufferedInputStream(new FileInputStream(path));
			properties.load(inputStream);
			inputStream.close();
			if(juge != 1) {
				OutputStream out=new FileOutputStream(path);
				properties.setProperty("bili",bili);
				properties.setProperty("xibili",xibili);
				properties.store(out,"Modify"+(new Date()).toLocaleString());
				modelAndView.addObject("message","修改成功");
				out.close();
			}
			String bl=properties.getProperty("bili");
			String xbl=properties.getProperty("xibili");
			modelAndView.addObject("bl",bl);
			modelAndView.addObject("xbl",xbl);
			modelAndView.setViewName("/User/modifyexcellent");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return  modelAndView;
	}

	@RequestMapping("/lookpdf")
	public ModelAndView lookpdf(@RequestParam("reportName") String reportName,HttpSession session){
		ModelAndView modelAndView = new ModelAndView();
		String path=reportName;
		modelAndView.addObject("url",path);
		modelAndView.setViewName("User/lookPDF");
		return modelAndView;
	}
	// 竞赛分页相关
	private Integer currentPage = 1;
	private Integer pageSize = 10;

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

}

class Np {

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
