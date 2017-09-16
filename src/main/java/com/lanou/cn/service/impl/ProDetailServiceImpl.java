package com.lanou.cn.service.impl;

import com.lanou.cn.mapper.ProDetailMapper;
import com.lanou.cn.service.ProDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ProDetailServiceImpl implements ProDetailService {
    @Autowired
    private ProDetailMapper mapper;


    @Override
    public List<Map<String, Object>> getAllDetail() {

        return mapper.getAllDetail();
    }
}
