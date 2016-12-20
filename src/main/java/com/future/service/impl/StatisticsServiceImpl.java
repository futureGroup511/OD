package com.future.service.impl;

import com.future.dao.StatisticsMapper;
import com.future.service.StatisticsServiceI;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 */
@Service
@Transactional
public class StatisticsServiceImpl implements StatisticsServiceI {
    @Autowired
    private StatisticsMapper statistics;
}
