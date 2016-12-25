package com.future.service.impl;

import com.future.dao.StatisticsMapper;
import com.future.domain.Statistics;
import com.future.domain.User;
import com.future.service.StatisticsServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 */
@Service
@Transactional
public class StatisticsServiceImpl implements StatisticsServiceI {
    @Autowired
    private StatisticsMapper statistics;
 
    public List<Statistics> findAllStatisticsByRole(Integer roleId) {
        return statistics.findAllStatisticsByRole(roleId);
    }
    public List<Statistics> getAllEvaluateResult() {
        return statistics.getAllEvaluateResult();
    }

    public List<Statistics> getAllEvaluateResultByType(Integer peopleType) {
        return statistics.getAllEvaluateResultByType(peopleType);
    }

    public List<Statistics> getAllEvaluateResultByType(User user) {

        return statistics.getAllEvaluateResultByType(user);
    }
}
