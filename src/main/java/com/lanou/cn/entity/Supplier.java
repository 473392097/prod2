package com.lanou.cn.entity;

import java.sql.Date;

public class Supplier {
   //ID
    private int id;
    //供应商名称
    private String supName;
    //注册公司
    private String supComp;
    //所在地
    private String supAddr;
    //供应商等级
    private int supLevel;
    //是否使用
    private String isUser;
    //合作关系（线上、线下）
    private String cpRelation;
    //创建时间
    private Date instDate;
    //创建人
    private int instId;
    //修改时间
    private Date mdfDate;
    //修改人
    private int mdfId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getSupComp() {
        return supComp;
    }

    public void setSupComp(String supComp) {
        this.supComp = supComp;
    }

    public String getSupAddr() {
        return supAddr;
    }

    public void setSupAddr(String supAddr) {
        this.supAddr = supAddr;
    }

    public int getSupLevel() {
        return supLevel;
    }

    public void setSupLevel(int supLevel) {
        this.supLevel = supLevel;
    }

    public String getIsUser() {
        return isUser;
    }

    public void setIsUser(String isUser) {
        this.isUser = isUser;
    }

    public String getCpRelation() {
        return cpRelation;
    }

    public void setCpRelation(String cpRelation) {
        this.cpRelation = cpRelation;
    }

    public Date getInstDate() {
        return instDate;
    }

    public void setInstDate(Date instDate) {
        this.instDate = instDate;
    }

    public int getInstId() {
        return instId;
    }

    public void setInstId(int instId) {
        this.instId = instId;
    }

    public Date getMdfDate() {
        return mdfDate;
    }

    public void setMdfDate(Date mdfDate) {
        this.mdfDate = mdfDate;
    }

    public int getMdfId() {
        return mdfId;
    }

    public void setMdfId(int mdfId) {
        this.mdfId = mdfId;
    }

    public Supplier(int id, String supName, String supComp, String supAddr, int supLevel, String isUser, String cpRelation, Date instDate, int instId, Date mdfDate, int mdfId) {
        this.id = id;
        this.supName = supName;
        this.supComp = supComp;
        this.supAddr = supAddr;
        this.supLevel = supLevel;
        this.isUser = isUser;
        this.cpRelation = cpRelation;
        this.instDate = instDate;
        this.instId = instId;
        this.mdfDate = mdfDate;
        this.mdfId = mdfId;
    }

    public Supplier() {
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", supName='" + supName + '\'' +
                ", supComp='" + supComp + '\'' +
                ", supAddr='" + supAddr + '\'' +
                ", supLevel=" + supLevel +
                ", isUser='" + isUser + '\'' +
                ", cpRelation='" + cpRelation + '\'' +
                ", instDate=" + instDate +
                ", instId=" + instId +
                ", mdfDate=" + mdfDate +
                ", mdfId=" + mdfId +
                '}';
    }
}
