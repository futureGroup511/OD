package com.future.dao;

import com.future.domain.TempEval;


public interface TempEvalMapper {
    int deleteByPrimaryKey(Integer evalId);

    int insert(TempEval record);

    int insertSelective(TempEval record);

    TempEval selectByPrimaryKey(Integer evalId);

    int updateByPrimaryKeySelective(TempEval record);

    int updateByPrimaryKey(TempEval record);


}