package com.future.dao;

import com.future.domain.Statistics;
import com.future.domain.User;

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

    List<Statistics> getAllEvaluateResultByType(Integer peopleType);

    List<Statistics> getAllEvaluateResultByType(User user);
}

