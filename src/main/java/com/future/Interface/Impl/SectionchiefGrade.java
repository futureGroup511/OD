package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 *
 * 党群正处、行政正处：互评成绩*0.3 + 厅级打分* 0.4
 */
public class SectionchiefGrade  implements Grade{
    private final String SG="SGweigth.properties";
    public void grade(Statistics statistics) throws IOException {
        file.getAllvalue(SG);
        Double  zx = file.getZx();
        Double  fx = file.getFx();
        Double hpweight=file.getHpweight();
        Double xtweight=file.getXtweight();
        Double result=statistics.getStatic_hp()*hpweight+(statistics.getStatic_ztf()*zx+statistics.getStatic_ft()*fx)*xtweight;
        statistics.setStatic_xhp(statistics.getStatic_hp()*hpweight);
        statistics.setStatic_t((statistics.getStatic_ztf()*zx+statistics.getStatic_ft()*fx)*xtweight);
        statistics.setStatic_result(result);
    } 
}
