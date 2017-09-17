package com.lanou.cn.service;

import com.lanou.cn.entity.ProType;

import java.util.List;
import java.util.Map;

public interface ProInfoService {
//商品类别
    List<Map<String,Object>> selectPrdType();
//供应商
    public List<Map<String,Object>> supplier();

//商品信息表
    List<Map<String,Object>> proInfo();

//上传图片
//    public void upateImage(String avatar);

    void insertPro(Map<String,Object> params);
}
