package com.lanou.cn.service.impl;

import com.lanou.cn.entity.ProType;
import com.lanou.cn.mapper.ProInfoMapper;
import com.lanou.cn.service.ProInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ProInfoServiceImpl implements ProInfoService{

    @Resource
    private ProInfoMapper proInfoMapper;


    @Override
    public List<ProType> selectPrdType() {
        List<ProType> mapList = proInfoMapper.selectPrdType();
        return mapList;
    }



}
