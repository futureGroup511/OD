package com.future.controller;

import com.future.base.BaseAction;
import com.future.commonUtils.MyPageBean;
import com.future.commonUtils.PropertiesUtils;
import com.future.domain.Evaluate;
import com.future.domain.Statistics;
import com.future.domain.User;
import com.future.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
        pageBean.setRecordlist(userList);

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/valuateToInfo");
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("pageBean", pageBean);
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

    @RequestMapping("/getValuatedOthers/{meId}")
    public ModelAndView getValuatedOthers(@PathVariable("meId") Integer meId){

        List<Evaluate> evaluatesList = evaluateService.getValuateByPeople(meId);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/allEvaluateResult");

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("evaluatesList", evaluatesList);

        modelAndView.addAllObjects(map);

        return modelAndView;
    }


    // 查看总评结果
    @RequestMapping("/seeAllEvaluateResult")
    public ModelAndView seeAllEvaluateResult(){

        List<Statistics> statisticList = statisticsService.getAllEvaluateResult();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/allEvaluateResult");

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("statisticList", statisticList);

        modelAndView.addAllObjects(map);

        return modelAndView;
    }







    /**
     *
     * @param id  评价人的ID
     * @param name 被评人的姓名
     * @param  currentPage 当前页
     * @return
     */
    @RequestMapping(value = "/findByUserIdOrEvalByName")
    public ModelAndView findByUserIdOrEvalByName(@RequestParam(value = "id",required=false)Integer id,
                                                 @RequestParam(value = "name",required=false)String name,
                                                 @RequestParam(value = "currentPage",required=false) Integer currentPage){
        PageBean page=PageBean.getDefault(); //创建一个默认当前页数为1，显示条数为10的page
        if(currentPage != null) page.setCurrentPage(currentPage);
        if(name != null && name.equals("")) name = null;
        ModelAndView mv = new ModelAndView();
        Map<String,Object> hashmap = new HashMap<String,Object>();
        hashmap.put("id",id);
        hashmap.put("name",name);
        hashmap.put("page",page);
        evaluateService.findEvalByUser(hashmap);
        mv.addObject("page",page);
        if(name != null)mv.addObject("findname",name);
        mv.setViewName("Evaluate/findEvaluateBy");
        return mv;
    }

}
