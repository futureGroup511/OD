package com.future.dao;

import java.util.List;

import com.future.domain.Evaluate;
import com.future.domain.TempEval;


public interface TempEvalMapper {
    int deleteByPrimaryKey(Integer evalId);

    int insert(TempEval record);

    int insertSelective(TempEval record);

    TempEval selectByPrimaryKey(Integer evalId);

    int updateByPrimaryKeySelective(TempEval record);

    int updateByPrimaryKey(TempEval record);

    /**
	 * 暂存评价结果
	 * 
	 * @author 刘阳阳
	 */
	int insertAllZanCun(List<Evaluate> evaList);

	/**
	 * 暂存之前删除之前 所有暂存的记录
	 */
	void deleteAllZanCun(Integer evalEvalto, int zancunCate, String zancunDesc);

	/**
	 * 评价之前拿到所有暂存的记录
	 */
	List<TempEval> getByIdZanCunData(Integer userId, int cate, String desc);

	/**
	 * delteDateFromEvaluate
	 * 清空临时数据表
	 * 
	 * @author 刘阳阳
	 */
	int delteDateFromTempEvaluate();


}