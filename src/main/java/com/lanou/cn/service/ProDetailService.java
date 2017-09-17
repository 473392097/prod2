package com.lanou.cn.service;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface ProDetailService {
    PageInfo<Map<String,Object>> getAllDetail(Map<String,Object> params);

    /**
     * 根据id获取该明细的具体信息 以及其他相关信息(库存 库存位置等)
     * @param id
     * @return
     */
    Map<String,Object> getOneDetail(int id);

    /**
     * 更新商品明细的信息,涉及到商品明细表的修改 商品明细-仓库表的修改
     * @param map
     */
    void updateProDetail(Map<String,Object> map);
}
