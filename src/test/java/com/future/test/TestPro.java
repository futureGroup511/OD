package com.future.test;

import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by 牛洧鹏 on 2016/12/23.
 */
public class TestPro {
    @Test
    public void test() throws IOException {
        InputStream inputStream=getClass().getClassLoader().getResourceAsStream("President.properties");
        Properties properties=new Properties();
        properties.load(inputStream);
        String value=properties.getProperty("123");
       // System.out.println(Double.valueOf(value));
    }
    @Test
    public void testDoubleDefault(){
    
    }
}
