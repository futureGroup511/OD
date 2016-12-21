package com.future.commonUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by Administrator on 2016/12/18.
 */
public final class PropertiesUtils {

   private static String pathSrc = "staticData.properties";

   
    // 传入指定文件
    public static void setPath(String path){
        pathSrc = path;
    }

    // 解析  属性文件返回指定键对应的值（同意作为字符串处理，）
    public static String getProperties(String key){

        InputStream inputStream = PropertiesUtils.class.getClassLoader().getResourceAsStream(pathSrc);
        Properties properties = new Properties();
        try {
            properties.load(inputStream);
        }catch (IOException ioException){

            System.out.println("配置文件读取发生io错误");
            ioException.printStackTrace();
        }
        return (String) properties.get(key);
    }
}
