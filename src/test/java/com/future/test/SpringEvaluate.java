package com.future.test;

import com.future.domain.User;
import com.future.service.EvaluateServiceI;
import com.future.utils.PageBean;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

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
        PageBean page=PageBean.getDefault();
        User user=new User();
        user.setUserId(9);
        Map<String,Object> hashMap = new HashMap<String, Object>();
        hashMap.put("id",user.getUserId());
        hashMap.put("name","李光磊");
        hashMap.put("page",page);
        evaluateService.findEvalByUser(hashMap);
        System.out.println(page);

    }


}
