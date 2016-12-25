package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 * 教学副书记、教学副院长：互评成绩*0.3 + 厅级打分*0.2  +  单位正职* 0.2
 */
public class SubdecanalGrade implements Grade {
    private final  String SBG="SBGweigth.properties";
    public void grade(Statistics statistics) throws IOException {
        file.getAllvalue(SBG);
        Double  zx = file.getZx();
        Double  fx = file.getFx();
        Double hpweight=file.getHpweight();
        Double xtweight=file.getXtweight();
        Double dwwight=file.getDwweight();
        Double result=statistics.getStatic_hp()*hpweight+(statistics.getStatic_ztf()*zx+statistics.getStatic_ft()*fx)*xtweight
                +statistics.getStatic_dw()*dwwight;
        statistics.setStatic_xhp(statistics.getStatic_hp()*hpweight);
        statistics.setStatic_t((statistics.getStatic_ztf()*zx+statistics.getStatic_ft()*fx)*xtweight);
        statistics.setStatic_xdw(statistics.getStatic_dw()*dwwight);
        statistics.setStatic_result(result);
    }
}
