package com.lanou.cn.mapper;

import com.lanou.cn.entity.ProDetail;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface ProDetailMapper {
    //获取所有的商品详情

    List<Map<String,Object>> getAllDetail(Map<String,Object> map);

    //根据商品详情id查找具体的一个商品详情信息
    Map<String,Object> getOneDetail(int proDtlId);

    //更新一个商品详情
    void update(Map<String, Object> map);

    //插入一个商品详情
    void insert(Map<String, Object> map);
    //插入一个商品详情的同时往关系表中插入一条数据
    void insert2(Map<String, Object> map);

    //查询出所有的仓库名称 用于修改商品明细是回显
    @Select("select * from ware")
    List<Map<String,Object>> getAllWare();

    //查询出当前商品明细表的最后一条数据的主键id用于插入数据时明细id的计算
    @Select("select id from prd_detail order by id desc limit 1")
    int getFirstId();

}
