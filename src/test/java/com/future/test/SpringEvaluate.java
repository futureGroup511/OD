package com.future.test;

import com.future.domain.Evaluate;
import com.future.service.EvaluateServiceI;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created by 牛洧鹏 on 2016/12/17.
 */

@RunWith(SpringJUnit4ClassRunner.class)
//配置了@ContextConfiguration注解并使用该注解的locations属性指明spring和配置文件之后，
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class SpringEvaluate {
    @Autowired
    private EvaluateServiceI evaluateService;

    @Test
    public void test(){
        List<Evaluate> datas=evaluateService.findEvalByUser(9);
        for(Evaluate e:datas) System.out.println(e);
    }


}
