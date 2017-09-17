package com.lanou.cn.mapper;

import com.lanou.cn.entity.ProType;

import java.util.List;
import java.util.Map;

public interface ProInfoMapper {

    //查询类别表,返回一个List集合对象
    List<ProType> selectPrdType();

}
