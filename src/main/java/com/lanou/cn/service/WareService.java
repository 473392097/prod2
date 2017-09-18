package com.lanou.cn.service;

import java.util.List;
import java.util.Map;

public interface WareService {
    //查询所有的仓储信息
    List<Map<String,Object>> findWareList();

    /**
     * 根据id获取仓储信息
     * @param id
     * @return
     */
    Map<String,Object> findWareInfoById(Integer id);

    /**
     * 更新仓储信息
     * @param params
     */
    void updateWare(Map<String,Object> params);

    /**
     * 添加仓储信息
     * @param params
     */
    void addWare(Map<String,Object> params);
}
