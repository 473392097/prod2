package com.lanou.cn.mapper;

import com.lanou.cn.entity.ProType;

import java.util.List;
import java.util.Map;

public interface ProInfoMapper {

    //查询类别表,返回一个List集合对象
    List<Map<String,Object>> selectPrdType();
    //查询供应商
    List<Map<String,Object>> supplier();
    //查询商品表
    List<Map<String,Object>> proInfo();
    //上传图片
//    public void upateImage(String imgUrl);


    void insertPro(Map<String,Object> params);

}
