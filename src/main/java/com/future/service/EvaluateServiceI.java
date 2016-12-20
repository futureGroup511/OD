package com.future.service;

import com.future.commonUtils.PageBean;
import com.future.domain.Evaluate;
import com.future.domain.User;


import java.util.List;

import com.future.utils.PageBean;

import java.util.Map;

public interface EvaluateServiceI {

    //得到分页查询的被评价人 信息
    List<User> getAllValuatedBy(PageBean pageBean);

    // 得到分页查询的 评价人的 信息
    List<User> getAllValuatedTo(PageBean pageBean);
    //得到 被评价人的所有数量
    Integer getValuatedByCount();
    // 得到 评价人的所有数量
    Integer getValuatedToCount();
    // 得到评价此人的  评价人信息
    List<Evaluate> 	getValuatedMe(Integer meId);
    public PageBean findEvalByUser(Map<String,Object> hashMap);
}
