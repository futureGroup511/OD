package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 *
 * 教学正书记、教学正院长：互评成绩*0.3 + 厅级打分*0.3
 */
public class AssistantdeanGrade implements Grade {
    private InputStream inputStream=getClass().getResourceAsStream("AGweigth.properties");
    public void grade(Statistics statistics) throws IOException {

        Properties properties=new Properties();
        properties.load(inputStream);
        Double hpweight = Double.valueOf(properties.getProperty("hpweight"));
        Double xtweight = Double.valueOf(properties.getProperty("xtweight"));
        Double result = statistics.getStatic_hp()*hpweight+(statistics.getStatic_ztf()*0.7+statistics.getStatic_ft()*0.3)*xtweight;
        statistics.setStatic_result(result);
    }
}
