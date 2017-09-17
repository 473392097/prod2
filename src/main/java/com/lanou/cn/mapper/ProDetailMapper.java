package com.lanou.cn.mapper;

import com.lanou.cn.entity.ProDetail;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ProDetailMapper {
    //获取所有的商品详情

    List<Map<String,Object>> getAllDetail();

    //根据商品详情id查找具体的一个商品详情信息
    ProDetail getOneDetail(int proDtlId);

    //更新一个商品详情
    void update(ProDetail proDetail);

    //插入一个商品详情
    void insert(ProDetail proDetail);


}
