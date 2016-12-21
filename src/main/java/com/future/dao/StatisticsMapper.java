package com.future.dao;

import com.future.domain.Statistics;

import java.util.List;

import java.util.List;
/**
 * Created by 牛洧鹏 on 2016/12/20.
 */
public interface StatisticsMapper {

    List<Statistics> findAllStatisticsByRole(Integer roleId);

    /**
     * by zhaoshuo 查询得到所有的统计结果
     */
    List<Statistics> getAllEvaluateResult();
}

