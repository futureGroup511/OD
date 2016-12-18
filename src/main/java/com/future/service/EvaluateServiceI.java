package com.future.service;

import com.future.domain.Evaluate;

import java.util.List;
import java.util.Map;

public interface EvaluateServiceI {

    public List<Evaluate> findEvalByUser(Map<String,Object> hashMap);
}
