package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 *
 * 教学正书记、教学正院长：互评成绩*0.3 + 厅级打分*0.3
 */
public class AssistantdeanGrade implements Grade {
    private final String AG="AGweigth.properties";
    public void grade(Statistics statistics) throws IOException {
        file.getAllvalue(AG);
        Double  zx = file.getZx();
        Double  fx = file.getFx();
        Double hpweight = file.getHpweight();
        Double xtweight = file.getXtweight();
        Double result = statistics.getStatic_hp()*hpweight+(statistics.getStatic_ztf()*zx+statistics.getStatic_ft()*fx)*xtweight;
        statistics.setStatic_xhp(statistics.getStatic_hp()*hpweight);
        statistics.setStatic_t((statistics.getStatic_ztf()*zx+statistics.getStatic_ft()*fx)*xtweight);
        statistics.setStatic_result(result);
    }
}
