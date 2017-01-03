package com.future.controller;

import com.future.base.BaseAction;
import com.future.commonUtils.MyPageBean;
import com.future.commonUtils.PropertiesUtils;
import com.future.domain.Evaluate;
import com.future.domain.PeopleType;
import com.future.domain.Statistics;
import com.future.domain.User;
import com.future.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("/evaluate")
public class EvaluateController extends BaseAction {


// 查看 它被其他人评价
    // write by zhaoshuo
    @RequestMapping("/valuatedByInfo/{currentPage}")
    public ModelAndView showAllValuatedBy(@PathVariable("currentPage") Integer currentPage){

        System.out.println("@@@@@zhaoshou@@@@@");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/valuateByInfo");

        Integer pageSize = Integer.parseInt(PropertiesUtils.getProperties("pageSize"));
        Integer recordCount = evaluateService.getValuatedByCount();

        MyPageBean pageBean = new MyPageBean(currentPage,pageSize,recordCount,null);
        List<User> userList = evaluateService.getAllValuatedBy(pageBean);
        pageBean.setRecordlist(userList);

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("pageBean",pageBean);
        modelAndView.addAllObjects(map);

        return modelAndView;
    }

    // 它评价了谁 的第一页

    @RequestMapping("/valuateToInfo/{currentPage}")
    public ModelAndView showAllValuatedTo(@PathVariable("currentPage") Integer currentPage){

    	System.out.println("%%%%%");
        Integer pageSize = Integer.parseInt(PropertiesUtils.getProperties("pageSize"));
        Integer recordCount = evaluateService.getValuatedToCount();
        MyPageBean pageBean = new MyPageBean(currentPage,pageSize,recordCount,null);
        
        
        List<User> userList = evaluateService.getAllValuatedTo(pageBean);
        //pageBean.setRecordlist(userList);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/valuateToInfo");
        Map<String,Object> map = new HashMap<String,Object>();
        //map.put("pageBean", pageBean);
        map.put("userList", userList);
        modelAndView.addAllObjects(map);
        return modelAndView;
    }

    @RequestMapping("/getValuatedMe/{meId}")
    public ModelAndView getValuatedMe(@PathVariable("meId") Integer meId) {

        System.out.println("&*&*&*&*&*&*&*&*");
        List<Evaluate> evaluatesList = evaluateService.getValuatedMe(meId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/valuateMePeople");

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("evaluatesList", evaluatesList);

        modelAndView.addAllObjects(map);
        return modelAndView;
    }

    // 它评价了谁 的最后一页

    @RequestMapping(value = "/getValuatedOthers")
    public ModelAndView getValuatedOthers(HttpServletRequest request,
    									@RequestParam(value="meId",required=false)Integer meId,
                                          @RequestParam(value="name",required=false)String himName,
                                          @RequestParam(value="rank",required=false)Integer rank,
                                          @RequestParam(value="nameLY",required=false)String nameLY){
    	String str = "";
    	try {
			 str = new String(request.getParameter("nameLY").getBytes("iso-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Map<String,Object> datas=new HashMap<String, Object>();
        datas.put("meId",meId);
        if(himName != null && himName.equals("")) himName = null;
        else datas.put("himName",himName);
        datas.put("rank",rank);
        List<Evaluate> evaluatesList = evaluateService.getValuateByPeople(datas);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/valuateOthersPeople");

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("evaluatesList", evaluatesList);
        map.put("meId",meId);
        map.put("nameLY",str);
        modelAndView.addAllObjects(map);

        return modelAndView;
    }


    // 查看总评结果
    @RequestMapping("/seeAllEvaluateResult")
    public ModelAndView seeAllEvaluateResult(){
        List<Statistics> statisticList = statisticsService.getAllEvaluateResult();

        /**
         * 以总评结果进行排序
         */
         Collections.sort(statisticList);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/allEvaluateResult");
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("statisticList", statisticList);

        PeopleType peopleType = new PeopleType();
        peopleType.setRoleType(1);
        map.put("pType", peopleType);

        modelAndView.addAllObjects(map);

        return modelAndView;
    }


    @RequestMapping("/redirectHere")
    public ModelAndView redirectHere(/*PeopleType pType*/ User user){
        if (user.getUserName()!= null && user.getUserName().equals("")) user.setUserName(null);
        if (user.getDepartment()!=null && user.getDepartment().getDepName().equals(""))user.setDepartment(null);
        List<Statistics> statisticList = statisticsService.getAllEvaluateResultByType(user);
        /**
         * 以总评结果进行排序
         */
        Collections.sort(statisticList);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/allEvaluateResult");
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("statisticList", statisticList);

        PeopleType peopleType = new PeopleType();
        peopleType.setRoleType(1);
        map.put("pType", peopleType);
        
        modelAndView.addObject("tempUesrRole", user.getUserRole());
        modelAndView.addAllObjects(map);
        modelAndView.addObject("user",user);
        return modelAndView;

    }





    /**
     *
     *
     * @param id  评价人的ID
     * @param name 被评人的姓名
     * @param  currentPage 当前页
     * @return
     */
    @RequestMapping(value = "/findByUserIdOrEvalByName")
    public ModelAndView findByUserIdOrEvalByName(@RequestParam(value = "id",required=false)Integer id,
                                                 @RequestParam(value = "name",required=false)String name,
                                                 @RequestParam(value = "currentPage",required=false) Integer currentPage,
                                                 @RequestParam(value="fenlei",required=false) String fenlei,
                                                 HttpServletRequest request){
    	ModelAndView mv = new ModelAndView();
    	System.out.println(fenlei);
    	if(fenlei == null){
    		//根据userid 和打分类别，查询到所有的人
    		fenlei = "3";
    	}
    	if(!fenlei.equals("3")){
        	System.out.println("嗯哼嗯哼不为空！！");
        	User tempUser = (User) request.getSession().getAttribute("user");
        	List<Evaluate> evalList = evaluateService.contanueFindByUser(tempUser.getUserId(),fenlei);
        	mv.setViewName("Evaluate/findEvaluateBy");
        	mv.addObject("evalList",evalList);
        	mv.addObject("tempFenlei",fenlei);
        	System.out.println(evalList);
        	
        	
        } else {
        	PageBean page=PageBean.getDefault(); //创建一个默认当前页数为1，显示条数为10的page
            if(currentPage != null) page.setCurrentPage(currentPage);
            if(name != null && name.equals("")) name = null;
            
            Map<String,Object> hashmap = new HashMap<String,Object>();
            hashmap.put("id",id);
            hashmap.put("name",name);
            hashmap.put("page",page);
            evaluateService.findEvalByUser(hashmap);
            mv.addObject("page",page);
            if(name != null)mv.addObject("findname",name);
            mv.setViewName("Evaluate/findEvaluateBy");
        }
    	
    	return mv;
    }
    
    /**
     * 根据姓名模糊查询评价人
     * 
     * @author 刘阳阳
     */
    @RequestMapping(value = "getUserByNameLY",method=RequestMethod.POST)
    public ModelAndView getUserByNameLY(@RequestParam("nameLYY") String nameLYY){
    	System.out.println(nameLYY);
    	List<User> userList = evaluateService.getUserByNameLY(nameLYY);
    	ModelAndView modelAndView = new ModelAndView("Manager/valuateToInfo");
    	modelAndView.addObject("userList", userList);
    	return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/getAlldepartmentName")
    public List<String> getAlldepartmentName(){
        List<String> departments=evaluateService.getAllDepartment();
        return  departments;
    }
    
    /**
     * 删除评价信息
     */
    @RequestMapping(value="delteEvaluate/{meId}",method=RequestMethod.GET)
    public ModelAndView delteEvaluate(@PathVariable("meId") Integer evalTo){
    	evaluateService.deleteByEvalTo(evalTo);
    	String viewname = "User/success";
    	ModelAndView modelAndView = new ModelAndView(viewname);
    	modelAndView.addObject("message", "操作成功！");
    	return modelAndView;
    }
}
