package com.lanou.cn.entity;

import java.util.Date;

public class Ware {
    //ID
    private int id;
    //仓储编号
    private String wareNo;
    //仓储名称
    private String wareName;
    //仓储地址
    private String wareAddr;
    //是否可用
    private String isUsed;
    //仓储类别
    private String wareType;
    //创建时间
    private Date instDate;
    //创建人
    private int instId;
    //修改时间
    private Date mdfDate;
    //修改人
    private int mdfId;

    public Ware(int id, String wareNo, String wareName, String wareAddr, String isUsed, String wareType, Date instDate, int instId, Date mdfDate, int mdfId) {
        this.id = id;
        this.wareNo = wareNo;
        this.wareName = wareName;
        this.wareAddr = wareAddr;
        this.isUsed = isUsed;
        this.wareType = wareType;
        this.instDate = instDate;
        this.instId = instId;
        this.mdfDate = mdfDate;
        this.mdfId = mdfId;
    }

    public Ware() {

    }

    @Override
    public String toString() {
        return "Ware{" +
                "id=" + id +
                ", wareNo='" + wareNo + '\'' +
                ", wareName='" + wareName + '\'' +
                ", wareAddr='" + wareAddr + '\'' +
                ", isUsed='" + isUsed + '\'' +
                ", wareType='" + wareType + '\'' +
                ", instDate=" + instDate +
                ", instId=" + instId +
                ", mdfDate=" + mdfDate +
                ", mdfId=" + mdfId +
                '}';
    }
}
