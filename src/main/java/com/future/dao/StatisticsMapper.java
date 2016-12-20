package com.future.dao;

import com.future.domain.Statistics;

import java.util.List;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 */
public interface StatisticsMapper {

    List<Statistics> findAllStatisticsByRole(Integer roleId);
}
