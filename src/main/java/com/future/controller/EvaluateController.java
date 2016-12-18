package com.future.controller;

import com.future.base.BaseAction;
import com.future.utils.PageBean;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@Scope("prototype")
@RequestMapping("evaluate")
public class EvaluateController extends BaseAction {

    /**
     *
     * @param id  评价人的ID
     * @param name 被评人的姓名
     * @return
     */
    @RequestMapping(value = "/findByUserIdOrEvalByName")
    public ModelAndView findByUserIdOrEvalByName(@RequestParam("id")Integer id,@RequestParam("name")String name){
        PageBean page=PageBean.getDefault(); //创建一个默认当前页数为1，显示条数为10的page
        ModelAndView mv = new ModelAndView();
        Map<String,Object> hashmap = new HashMap<String,Object>();
        hashmap.put("id",id);
        hashmap.put("name",name);
        hashmap.put("page",page);
       /* List<Evaluate> evaluates = evaluateService.findEvalByUser(hashmap);
        mv.addObject("evaluates",evaluates);
        mv.setViewName("Evaluate/findEvaluateBy");*/
        return mv;
    }

}
