package com.future.Interface.Impl;

import com.future.Interface.Grade;
import com.future.domain.Statistics;

import java.io.IOException;

/**
 * Created by 牛洧鹏 on 2016/12/20.
 *
 * 党群副处、行政副处：互评成绩*0.3 + 厅级打分*0.2  + 单位正职* 0.2
 */
public class DeputyCommissionerGrade implements Grade{
    private final String DC="DCweigth.properties";
    public void grade(Statistics statistics) throws IOException {
        file.getAllvalue(DC);
        Double  zx = file.getZx();
        Double  fx = file.getFx();
        Double hpweight=file.getHpweight();
        Double xtweight=file.getXtweight();
        Double dwweight=file.getDwweight();
        Double hp=statistics.getStatic_hp()*hpweight;
        Double t=(statistics.getStatic_ztf()*zx+statistics.getStatic_ft()*fx)*xtweight;
        Double dw=statistics.getStatic_dw()*dwweight;
        Double result=hp+t+dw;
        statistics.setStatic_xhp(hp);
        statistics.setStatic_t(t);
        statistics.setStatic_xdw(dw);
        statistics.setStatic_result(result);
    }

}
