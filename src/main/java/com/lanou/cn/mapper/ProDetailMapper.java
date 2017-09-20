package com.lanou.cn.mapper;

import com.lanou.cn.entity.ProDetail;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.cache.annotation.Cacheable;

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

    //查看该明细下所有的仓库对应关系
    List<Map<String,Object>> getproDetailInfo(int id);

    void updateRelation(Map<String,Object> map);

    /**
     * 插入明细-仓库对应关系时需要判断该明细在该仓库是否已经存在 若存在则更新该明细在该仓库下的数量
     * 不会存在插入两个相同仓库 相同明细id的记录
     * ###################################################################################################
     */
    void insertRelation(Map<String, Object> map);
    @Select("select COUNT(*) from prodetail_ware_relation where w_no=#{w_no} and prd_dtl_no=#{prd_dtl_id}" )
    int selectBywno(Map<String, Object> map);
    @Select("update prodetail_ware_relation set w_count=w_count+#{w_count} where w_no=#{w_no} and prd_dtl_no=#{prd_dtl_id}")
    void updateBywno(Map<String, Object> map);
    /**
     * ###################################################################################################
     */
}
