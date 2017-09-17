package com.lanou.cn.entity;

public class ProInfo {
    int id;//商品id
    String prdNo;//商品编号
    String prdName;//商品名称
    String prdCode;//商品简码
    String prdType;//商品类别
    int supId;//供应商ID
    String shDate;//上架时间
    String imgUrl;//图片地址url
    String isGifts;//是否为赠品(捆绑)
    String isSales;//是否参与活动
    String saleCode;//售卖方式
    String isReturn;//是否支持退换货
    String isUsed;//是否可用
    String instDate;//创建时间
    int instId;//创建人
    String mdfDate;//修改时间
    String mdfId;//修改人

//get/set方法
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPrdNo() {
        return prdNo;
    }

    public void setPrdNo(String prdNo) {
        this.prdNo = prdNo;
    }

    public String getPrdName() {
        return prdName;
    }

    public void setPrdName(String prdName) {
        this.prdName = prdName;
    }

    public String getPrdCode() {
        return prdCode;
    }

    public void setPrdCode(String prdCode) {
        this.prdCode = prdCode;
    }

    public String getPrdType() {
        return prdType;
    }

    public void setPrdType(String prdType) {
        this.prdType = prdType;
    }

    public int getSupId() {
        return supId;
    }

    public void setSupId(int supId) {
        this.supId = supId;
    }

    public String getShDate() {
        return shDate;
    }

    public void setShDate(String shDate) {
        this.shDate = shDate;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getIsGifts() {
        return isGifts;
    }

    public void setIsGifts(String isGifts) {
        this.isGifts = isGifts;
    }

    public String getIsSales() {
        return isSales;
    }

    public void setIsSales(String isSales) {
        this.isSales = isSales;
    }

    public String getSaleCode() {
        return saleCode;
    }

    public void setSaleCode(String saleCode) {
        this.saleCode = saleCode;
    }

    public String getIsReturn() {
        return isReturn;
    }

    public void setIsReturn(String isReturn) {
        this.isReturn = isReturn;
    }

    public String getIsUsed() {
        return isUsed;
    }

    public void setIsUsed(String isUsed) {
        this.isUsed = isUsed;
    }

    public String getInstDate() {
        return instDate;
    }

    public void setInstDate(String instDate) {
        this.instDate = instDate;
    }

    public int getInstId() {
        return instId;
    }

    public void setInstId(int instId) {
        this.instId = instId;
    }

    public String getMdfDate() {
        return mdfDate;
    }

    public void setMdfDate(String mdfDate) {
        this.mdfDate = mdfDate;
    }

    public String getMdfId() {
        return mdfId;
    }

    public void setMdfId(String mdfId) {
        this.mdfId = mdfId;
    }


    //toString方法


    @Override
    public String toString() {
        return "ProInfo{" +
                "id=" + id +
                ", prdNo='" + prdNo + '\'' +
                ", prdName='" + prdName + '\'' +
                ", prdCode='" + prdCode + '\'' +
                ", prdType='" + prdType + '\'' +
                ", supId=" + supId +
                ", shDate='" + shDate + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                ", isGifts='" + isGifts + '\'' +
                ", isSales='" + isSales + '\'' +
                ", saleCode='" + saleCode + '\'' +
                ", isReturn='" + isReturn + '\'' +
                ", isUsed='" + isUsed + '\'' +
                ", instDate='" + instDate + '\'' +
                ", instId=" + instId +
                ", mdfDate='" + mdfDate + '\'' +
                ", mdfId='" + mdfId + '\'' +
                '}';
    }
}
