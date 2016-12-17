package com.future.service;

import com.future.domain.Evaluate;

import java.util.List;

public interface EvaluateServiceI {

    public List<Evaluate> findEvalByUser(Integer id);
}
