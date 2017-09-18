package com.lanou.cn.service;

import com.github.pagehelper.PageInfo;

import java.util.Map;

public interface ProTypeService {

    /**
     * 添加商品类别
     * @param params
     */
    void addType(Map<String,Object> params);

    /**
     * 分页
     * @param params
     * @return
     */
    PageInfo<Map<String,Object>> findTypeList(Map<String, Object> params);
    /**
     * 根据id获取类型信息
     * @param id
     * @return
     */
    Map<String,Object> findTypeInfoById(Integer id);

    /**
     * 更新类型信息
     * @param params
     */
    void updateType(Map<String,Object> params);
}
