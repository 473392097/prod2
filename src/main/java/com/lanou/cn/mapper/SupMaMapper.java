package com.lanou.cn.mapper;

import com.lanou.cn.entity.Supplier;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface SupMaMapper {

    List<Map<String,Object>> find(Map<String,Object> params);
    Map<String,Object> selectTan(int id);
    void updateSup(Map<String,Object> params);
}
