package com.lanou.cn.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    public PageInfo<Map<String, Object>> getAllDetail(Map<String,Object> params) {
        Integer currentPage = params.get("currentPage") == null ? 1:Integer.parseInt((String)params.get("currentPage"));

        PageHelper.startPage(currentPage, 5);
        List<Map<String,Object>> list = mapper.getAllDetail(params);
        //用PageInfo对结果进行包装
        PageInfo<Map<String,Object>> page = new PageInfo<Map<String,Object>>(list);
        //测试PageInfo全部属性
        return page;

    }

    @Override
    public Map<String, Object> getOneDetail(int id) {

        return mapper.getOneDetail(id);
    }

    @Override
    public void updateProDetail(Map<String, Object> map) {
        mapper.update(map);
    }
}
