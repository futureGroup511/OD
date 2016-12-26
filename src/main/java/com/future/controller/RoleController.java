package com.future.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.future.base.BaseAction;
import com.future.domain.Evaluate;

@Controller
@Scope("prototype")
@RequestMapping("role")
public class RoleController extends BaseAction {

	/**
	 * 校正厅对所有正职评价，处理结果
	 * 
	 * @author 刘阳阳
	 */
	@RequestMapping(value = "zancun", method = RequestMethod.GET)
	public ModelAndView zancun(@RequestParam("evalEvalto") Integer evalEvalto,
			@RequestParam("evalEvalby") Integer[] evalEvalby,
			@RequestParam("resultt") String result,
			@RequestParam("zancunCate") String zancunCate,
			@RequestParam("zancunDesc") String zancunDesc) {
		
		System.out.println("评价人" + evalEvalto);
		System.out.println("级别：" + zancunCate);
		System.out.println("描述" + zancunDesc);
		System.out.println("被评价人：");
		for (int i = 0; i < evalEvalby.length; i++) {
			System.out.print(evalEvalby[i] + " ");
		}
		System.out.println("评价结果");
		String[] result1 = result.split(",");

		for(int i=0;i<result1.length;i++){
			System.out.print(result1[i] + " ");
		}
		
		//拿到集合，已备存储结果
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
			eva.setEvalCate(Integer.parseInt(zancunCate));
			// 设置校正厅对正职大的分
			eva.setEvalDesc(zancunDesc);
			evaList.add(eva);
		}
		
		//插入暂存结果之前应该删除以前暂存的记录
		userService.deleteAllZanCun(evalEvalto,Integer.parseInt(zancunCate),zancunDesc);
		
		//插入暂存结果
		int num = userService.insertAllZanCun(evaList);

		String viewname = "User/success";
		ModelAndView modelAndView = new ModelAndView(viewname);
		modelAndView.addObject("message", "评价数据暂存成功");
		
		return modelAndView;
	}
	
	
	
	
}
