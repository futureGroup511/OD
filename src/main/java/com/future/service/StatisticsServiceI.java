package com.future.service;

import com.future.domain.Statistics;

import java.util.List;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 */
public interface StatisticsServiceI {

    public List<Statistics> findAllStatisticsByRole(Integer roleId);
}
