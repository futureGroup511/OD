package com.future.dao;

import com.future.domain.Evaluate;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer evalId);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer evalId);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);
}