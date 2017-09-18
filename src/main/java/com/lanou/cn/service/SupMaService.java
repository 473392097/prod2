package com.lanou.cn.service;

import com.github.pagehelper.PageInfo;
import com.lanou.cn.entity.Supplier;

import java.util.List;
import java.util.Map;

public interface SupMaService {
    PageInfo<Map<String, Object>> find(Map<String,Object> params);
    Map<String,Object> selectTan(int id);
    void updateSup(Map<String,Object> params);

}
