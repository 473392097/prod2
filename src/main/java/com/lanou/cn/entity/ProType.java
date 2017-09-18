package com.lanou.cn.entity;

import java.util.Date;
//商品类别
public class ProType {
    int id;//主键
    String tpCd;//类别编号
    String tpName;//类别名称
    String isUsed;//是否可用
    Date instDate;//创建时间
    int instId;//创建人
    Date mdfDate;//修改时间
    int mdfId;//修改人

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTpCd() {
        return tpCd;
    }

    public void setTpCd(String tpCd) {
        this.tpCd = tpCd;
    }

    public String getTpName() {
        return tpName;
    }

    public void setTpName(String tpName) {
        this.tpName = tpName;
    }

    public String getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(String isUsed) {
        this.isUsed = isUsed;
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

    @Override
    public String toString() {
        return "ProTypeMapper{" +
                "id=" + id +
                ", tpCd='" + tpCd + '\'' +
                ", tpName='" + tpName + '\'' +
                ", isUsed='" + isUsed + '\'' +
                ", instDate=" + instDate +
                ", instId=" + instId +
                ", mdfDate=" + mdfDate +
                ", mdfId=" + mdfId +
                '}';
    }
}
