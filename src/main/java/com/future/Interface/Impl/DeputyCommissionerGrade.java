package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 *
 * 党群副处、行政副处：互评成绩*0.3 + 厅级打分*0.2  + 单位正职* 0.2
 */
public class DeputyCommissionerGrade implements Grade{
    private InputStream inputStream=getClass().getResourceAsStream("DCweigth.properties");
    public void grade(Statistics statistics) throws IOException {
        Properties properties=new Properties();
        properties.load(inputStream);
        Double hpweight=Double.valueOf(properties.getProperty("hpweight"));
        Double xtweight=Double.valueOf(properties.getProperty("xtweight"));
        Double dwweight=Double.valueOf(properties.getProperty("dwweight"));
        Double result=statistics.getStatic_hp()*hpweight+(statistics.getStatic_ztf()*0.7+statistics.getStatic_ft()*0.3)*xtweight+
                         statistics.getStatic_dw()*dwweight;
        statistics.setStatic_result(result);

    }
}
