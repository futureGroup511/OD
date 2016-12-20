package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 *
 * 党群正处、行政正处：互评成绩*0.3 + 厅级打分* 0.4
 */
public class SectionchiefGrade  implements Grade{
    private InputStream inputStream=getClass().getResourceAsStream("SGweigth.properties");
    public void grade(Statistics statistics) throws IOException {
        Properties properties=new Properties();
        properties.load(inputStream);
        String hpweight=properties.getProperty("hpweight");
        String xtweight=properties.getProperty("xtweight");
        Double result=statistics.getStatic_hp()*Double.valueOf(hpweight)+(statistics.getStatic_ztf()*0.7+statistics.getStatic_ft()*0.3)*Double.valueOf(xtweight);
        statistics.setStatic_result(result);
    }
}
