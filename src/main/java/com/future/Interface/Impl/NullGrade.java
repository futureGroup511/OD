package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;

/**
 * Created by Administrator on 2016/12/20.
 */
public class NullGrade implements Grade {
    public void grade(Statistics statistics) throws IOException {
        statistics.setStatic_result(0.0);
    }
} 
