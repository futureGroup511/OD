package com.future.utils;

import java.util.List;

/**
 * Created by 牛洧鹏 on 2016/12/18.
 */
public class PageBean {
    private Integer currentPage; //当前页
    private Integer pageSize;// 显示记录
    private Integer recordCount; //查询总记录数
    private List<?> recordlist;    //查询出来所需要的数据

    private Integer endPageIndex; //尾页
    private Integer beginPageIndex; //首页
    private Integer pageCount; //显示的页数
    private Integer offset; //数据库中开始查的条数



    public static PageBean newInstance(){
        PageBean pageBean=new PageBean();
        return pageBean;
    } 

    public Integer getOffset() {
        return (currentPage-1)*pageSize;
    }

    public Integer getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
    }

    public List<?> getRecordlist() {
        return recordlist;
    }

    public void setRecordlist(List<?> recordlist) {
        this.recordlist = recordlist;
    }

    public Integer getEndPageIndex() {
        return endPageIndex;
    }

    public void setEndPageIndex(Integer endPageIndex) {
        this.endPageIndex = endPageIndex;
    }

    public Integer getBeginPageIndex() {
        return beginPageIndex;
    }

    public void setBeginPageIndex(Integer beginPageIndex) {
        this.beginPageIndex = beginPageIndex;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    /**
     * 创建一个默认当前页数为1，一页显示条数为10的对象
     * @return
     */
    public static PageBean getDefault(){
        PageBean p=newInstance();
        p.setCurrentPage(1);
        p.setPageSize(10);
        return p;
    }
    /**
     * 通过当前页和一页显示的条数计算起始页和结束页
     */
    public void calbeginAndEnd(){
        if(pageSize == null && currentPage == null && recordCount != null) {
            System.err.println("参数不够");
        }
        pageCount = (recordCount+pageSize-1)/pageSize;  //显示页数
        if(pageCount < 10){
            beginPageIndex=1;
            endPageIndex=pageCount;
        }else{
            beginPageIndex = currentPage - 4;
            endPageIndex = currentPage + 5;
            if(beginPageIndex < 1){
                beginPageIndex=1;
                endPageIndex=10;
            }
            if(endPageIndex > pageCount){
                endPageIndex=pageCount;
                beginPageIndex=endPageIndex-9;
            }

        }

    }

    @Override
    public String toString() {
        return "PageBean{" +
                "currentPage=" + currentPage +
                ", pageSize=" + pageSize +
                ", recordCount=" + recordCount +
                ", recordlist=" + recordlist +
                ", endPageIndex=" + endPageIndex +
                ", beginPageIndex=" + beginPageIndex +
                ", pageCount=" + pageCount +
                ", offset=" + offset +
                '}';
    }
}
