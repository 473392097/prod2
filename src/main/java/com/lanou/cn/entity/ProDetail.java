package com.lanou.cn.entity;

import java.util.Date;

public class ProDetail {
    private int id;
    private int proId;//商品id
    private int proDtlId;//商品详情id
    private String proDtlName;//商品详情名称
    private String imgUrl;//商品图片地址
    private double sourcepPrice;//商品进价
    private double salepPrice;//商品售价
    private int wareId;//仓库id
    private Date createDate;//创建日期
    private int createUid;//创建人
    private Date mdfDate;//修改日期
    private int mdfId;//修改人

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProId() {
        return proId;
    }

    public void setProId(int proId) {
        this.proId = proId;
    }

    public int getProDtlId() {
        return proDtlId;
    }

    public void setProDtlId(int proDtlId) {
        this.proDtlId = proDtlId;
    }

    public String getProDtlName() {
        return proDtlName;
    }

    public void setProDtlName(String proDtlName) {
        this.proDtlName = proDtlName;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public double getSourcepPrice() {
        return sourcepPrice;
    }

    public void setSourcepPrice(double sourcepPrice) {
        this.sourcepPrice = sourcepPrice;
    }

    public double getSalepPrice() {
        return salepPrice;
    }

    public void setSalepPrice(double salepPrice) {
        this.salepPrice = salepPrice;
    }

    public int getWareId() {
        return wareId;
    }

    public void setWareId(int wareId) {
        this.wareId = wareId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getCreateUid() {
        return createUid;
    }

    public void setCreateUid(int createUid) {
        this.createUid = createUid;
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
        return "ProDetail{" +
                "id=" + id +
                ", proId=" + proId +
                ", proDtlId=" + proDtlId +
                ", proDtlName='" + proDtlName + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", sourcepPrice=" + sourcepPrice +
                ", salepPrice=" + salepPrice +
                ", wareId=" + wareId +
                ", createDate=" + createDate +
                ", createUid=" + createUid +
                ", mdfDate=" + mdfDate +
                ", mdfId=" + mdfId +
                '}';
    }
}
