package com.future.service;

import com.future.utils.PageBean;

import java.util.Map;

public interface EvaluateServiceI {

    public PageBean findEvalByUser(Map<String,Object> hashMap);
}
