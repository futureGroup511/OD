package com.future.controller;

import com.future.base.BaseAction;
import com.future.commonUtils.PageBean;
import com.future.commonUtils.PropertiesUtils;
import com.future.domain.Evaluate;
import com.future.domain.User;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
@Scope("prototype")
@RequestMapping("/evaluate")
public class EvaluateController extends BaseAction {


    // write by zhaoshuo
    @RequestMapping("/valuatedByInfo/{currentPage}")
    public ModelAndView showAllValuatedBy(@PathVariable("currentPage") Integer currentPage){

        System.out.println("@@@@@zhaoshou@@@@@");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/valuateByInfo");

        Integer pageSize = Integer.parseInt(PropertiesUtils.getProperties("pageSize"));
        Integer recordCount = evaluateService.getValuatedByCount();

        PageBean pageBean = new PageBean(currentPage,pageSize,recordCount,null);
        List<User> userList = evaluateService.getAllValuatedBy(pageBean);
        pageBean.setRecordlist(userList);

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("userList",userList);
        modelAndView.addAllObjects(map);

        return modelAndView;
    }

    @RequestMapping("/valuateToInfo")
    public ModelAndView showAllValuatedTo(){
        System.out.println("%%%%%");
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("Manager/valuateToInfo");
        Map<String,Object> map = new HashMap<String,Object>();
        modelAndView.addAllObjects(map);
        return modelAndView;
    }

    @RequestMapping("/getValuatedMe/{meId}")
    public ModelAndView getValuatedMe(@PathVariable("meId") Integer meId){

        System.out.println("&*&*&*&*&*&*&*&*");
        List<Evaluate> evaluatesList = evaluateService.getValuatedMe(meId);
        System.out.println(evaluatesList);
        System.out.println(evaluatesList.size());
        return null;
    }

}
