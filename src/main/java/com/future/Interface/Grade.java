package com.future.Interface;

import com.future.domain.Statistics;
import com.future.utils.File;

import java.io.IOException;

/**
 * Created by 牛洧鹏 on 2016/12/19.
 */
public interface Grade {
    File file=new File();
    public void grade(Statistics statistics) throws IOException;
    

}
