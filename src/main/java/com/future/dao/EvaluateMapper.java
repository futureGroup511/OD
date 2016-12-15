package com.future.dao;

import java.util.List;

import com.future.domain.Evaluate;

public interface EvaluateMapper {
    int deleteByPrimaryKey(Integer evalId);

    int insert(Evaluate record);

    int insertSelective(Evaluate record);

    Evaluate selectByPrimaryKey(Integer evalId);

    int updateByPrimaryKeySelective(Evaluate record);

    int updateByPrimaryKey(Evaluate record);

    /**
	 * 
	 * 首先判断是否评价过，评价过的条件为，拿当前session 评价人 的userid，然后根据本次评价的类型 类别(1互评、2厅级上对下、3本单位上对下)，
	 * 查到有记录就代表评价过，
	 * @author 刘阳阳
	 */
	List<Evaluate> getIsOrNoAllZheng(Evaluate isEval);
}