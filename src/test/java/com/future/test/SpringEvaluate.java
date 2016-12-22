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
 * Created by ţ��� on 2016/12/17.
 */

@RunWith(SpringJUnit4ClassRunner.class)
//������@ContextConfigurationע�Ⲣʹ�ø�ע���locations����ָ��spring�������ļ�֮��
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
        hashMap.put("name","�����");
        hashMap.put("page",page);
        evaluateService.findEvalByUser(hashMap);
        System.out.println(page);

    }


}
