package com.future.service;

import com.future.utils.PageBean;
import com.future.commonUtils.MyPageBean;
import com.future.domain.Evaluate;
import com.future.domain.User;
import java.util.Map;

import java.util.List;

public interface EvaluateServiceI {

    //得到分页查询的被评价人 信息
    List<User> getAllValuatedBy(MyPageBean pageBean);

    // 得到分页查询的 评价人的 信息
    List<User> getAllValuatedTo(MyPageBean pageBean);

    //得到 被评价人的所有数量
    Integer getValuatedByCount();

    // 得到 评价人的所有数量
    Integer getValuatedToCount();

    // 得到评价此人的  评价人信息
    List<Evaluate> getValuatedMe(Integer meId);

    public PageBean findEvalByUser(Map<String, Object> hashMap);
    /**
     * 我评了谁 的所有记录
     * @param meId
     * @return
     */
    List<Evaluate> getValuateByPeople(Integer meId);

    /**
     * 我评了谁 的所有记录
     * map中包含有被评价人的姓名和被评价的类型
     * @param hashMap
     * @return
     */
    List<Evaluate> getValuateByPeople(Map<String,Object> hashMap);

    /**
     * 根据姓名模糊查询评价人
     * 
     * @author 刘阳阳
     */
	List<User> getUserByNameLY(String nameLYY);

    /**
     * 得到所有院系的名曾
     * @return
     */
    List<String> getAllDepartment();

    /**
     * 条件查询以评信息
     * 
     * @author 刘阳阳
     */
	List<Evaluate> contanueFindByUser(Integer userId, String fenlei);

	/**
	 * 删除某人评价的信息
	 * 
	 * @author 刘阳阳
	 */
	void deleteByEvalTo(Integer evalTo);
}
 