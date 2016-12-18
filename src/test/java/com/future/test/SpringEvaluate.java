package com.future.test;

import com.future.domain.Evaluate;
import com.future.domain.User;
import com.future.service.EvaluateServiceI;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
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
        User user=new User();
        user.setUserId(9);
        Map<String,Object> hashMap = new HashMap<String, Object>();
        hashMap.put("id",user.getUserId());
        hashMap.put("name","�����");
        List<Evaluate> datas=evaluateService.findEvalByUser(hashMap);
        for(Evaluate e:datas) System.out.println(e);
    }


}
