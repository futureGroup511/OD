
package com.future.domain;

import com.future.Interface.Grade;
import com.future.Interface.Impl.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;

/**
 * Created by 牛洧鹏 on 2016/12/20. 
 */
public class Statistics implements Comparable<Statistics>{

    private Integer stati_id;
    private User stati_user;
    private Double static_hp;
    private Double static_ztf;
    private Double static_ft;
    private Double static_dw;
    private Double static_result;
    private Double static_t;
    private Double static_xhp;
    private Double static_xdw;
    private Grade grade;

    public Double getStatic_xhp(){
        if(static_xhp == null) return 0.0;
        return  formatDouble(static_xhp);
    }
    public Double getStatic_xdw(){
        if(static_xdw == null) return 0.0;
        return   formatDouble(static_xdw);
    }
    public void   setStatic_xhp(Double static_xhp){this.static_xhp=static_xhp;}
    public void   setStatic_xdw(Double static_xdw){this.static_xdw=static_xdw;}
    public Double getStatic_t() {
        if(static_t == null) return 0.0;
        return formatDouble(static_t);
    }


    public void setStatic_t(Double static_t) {
        this.static_t = static_t;
    }

    public Double getStatic_hp() {
        return static_hp;
    }

    public void setStatic_hp(Double static_hp) {
        this.static_hp = static_hp;
    }

    public Double getStatic_ztf() {
        return static_ztf;
    }

    public void setStatic_ztf(Double static_ztf) {
        this.static_ztf = static_ztf;
    }

    public Double getStatic_ft() {
        return static_ft;
    }

    public void setStatic_ft(Double static_ft) {
        this.static_ft = static_ft;
    }

    public Double getStatic_dw() {
        return static_dw;
    }

    public void setStatic_dw(Double static_dw) {
        this.static_dw = static_dw;
    }

    public Double getStatic_result() {
        /**
         *   党群正处、行政正处：互评成绩*0.3 + 厅级打分* 0.4
             教学正书记、教学正院长：互评成绩*0.3 + 厅级打分*0.3
            党群副处、行政副处：互评成绩*0.3 + 厅级打分*0.2  + 单位正职* 0.2
            教学副书记、教学副院长：互评成绩*0.3 + 厅级打分*0.2  +  单位正职* 0.2

         */
       /* if(stati_user.getUserName().equals("郭秋平")){
            System.out.println();
        }*/
        Integer roleid=stati_user.getRole().getRoleId();
        if(stati_user.getUserNp()==0 ){ //正职
            if(roleid == 3 ||roleid == 5){ //党群和行政
                grade = new SectionchiefGrade();
            }else if(roleid == 4 || roleid == 6){  //书记和院长
                grade = new AssistantdeanGrade();
            }else{
                grade = new NullGrade();
            }

        }else if(stati_user.getUserNp() == 1){ //副职
            if(roleid == 3 ||roleid == 5){//党群和行政
                grade = new DeputyCommissionerGrade();
            }else if(roleid == 4 || roleid == 6){ //书记和院长
                grade = new SubdecanalGrade();
            }else{
                grade = new NullGrade();
            }
        }else grade = new NullGrade();
        try {
            grade.grade(this);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return formatDouble(static_result);
    }

    public void setStatic_result(Double static_result) {
        this.static_result = static_result;
    }

    public Integer getStati_id() {
        return stati_id;
    }

    public void setStati_id(Integer stati_id) {
        this.stati_id = stati_id;
    }

    public User getStati_user() {
        return stati_user;
    }

    public void setStati_user(User stati_user) {
        this.stati_user = stati_user;
    }


    /**
     * 赵硕 added
     */
    public int compareTo(Statistics o) {
        if(this.getStatic_result()>o.getStatic_result()){
            return -1;
        }else if(this.getStatic_result()<o.getStatic_result()){
            return 1;
        }else{
            return 0;
        }
    }

    public Double formatDouble(Double data){
        BigDecimal bg = new BigDecimal(data).setScale(2, RoundingMode.UP);
        return bg.doubleValue();
    }

}
