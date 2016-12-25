package com.future.utils;

import com.future.Interface.FileOperation;

import java.io.*;
import java.util.Date;
import java.util.Properties;

/**
 * Created by 牛洧鹏 on 2016/12/23.
 */
public class File implements FileOperation{

    private Double hpweight;
    private Double xtweight;
    private Double dwweight;
    private Double zx;
    private Double fx;
    protected final String PRESIDENT="President.properties";

    public Double getHpweight() {
        return hpweight;
    }

    public void setHpweight(Double hpweight) {
        this.hpweight = hpweight;
    }

    public Double getXtweight() {
        return xtweight;
    }

    public void setXtweight(Double xtweight) {
        this.xtweight = xtweight;
    }

    public Double getDwweight() {
        return dwweight;
    }

    public void setDwweight(Double dwweight) {
        this.dwweight = dwweight;
    }

    public Double getZx() {
        return zx;
    }

    public void setZx(Double zx) {
        this.zx = zx;
    }

    public Double getFx() {
        return fx;
    }

    public void setFx(Double fx) {
        this.fx = fx;
    }

    public void getAllvalue(String path) {
        Properties properties=getProperties(path);
        Properties xproperties=getProperties(PRESIDENT);
        if(properties.getProperty("hpweight") != null)  hpweight=Double.valueOf(properties.getProperty("hpweight"));
        else hpweight=0.0;
        if(properties.getProperty("xtweight") != null)  xtweight=Double.valueOf(properties.getProperty("xtweight"));
        else xtweight=0.0;
        if(properties.getProperty("dwweight") != null)  dwweight=Double.valueOf(properties.getProperty("dwweight"));
        else  dwweight=0.0;
        zx=Double.valueOf(xproperties.getProperty("zx"));
        fx=Double.valueOf(xproperties.getProperty("fx"));
    }

    public void update(String path){
        defaultSet();
        Properties properties=getProperties(path);
        OutputStream outputStream = null;
        try {
            outputStream=new FileOutputStream(path);
            properties.setProperty("hpweight",hpweight+"");
            properties.setProperty("xtweight",xtweight+"");
            properties.setProperty("dwweight",dwweight+"");
            properties.setProperty("zx",zx+"");
            properties.setProperty("fx",fx+"");
            properties.store(outputStream,"Modity"+(new Date()).toLocaleString());
            outputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public Properties getProperties(String path) {
        InputStream inputStream = null;
        Properties properties=new Properties();
        try {
          //  inputStream = new BufferedInputStream(new FileInputStream(path));
            inputStream =this.getClass().getClassLoader().getResourceAsStream(path);
            properties.load(inputStream);
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return properties;
    }

    private void defaultSet(){
        if(hpweight == null) hpweight=0.0;
        if(xtweight == null) xtweight=0.0;
        if(dwweight == null) dwweight=0.0;
        if(zx == null) zx=0.0;
        if(fx == null) fx=0.0;
    }
}
