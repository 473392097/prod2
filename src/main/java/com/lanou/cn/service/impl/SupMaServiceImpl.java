package com.lanou.cn.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.cn.entity.Supplier;
import com.lanou.cn.mapper.SupMaMapper;
import com.lanou.cn.service.SupMaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SupMaServiceImpl  implements SupMaService{

    @Autowired
    private SupMaMapper supMaMapper;

    @Override
    public PageInfo<Map<String, Object>> find(Map<String,Object> params) {
        Integer currentPage = params.get("currentPage") == null ? 1:Integer.parseInt((String)params.get("currentPage"));

        PageHelper.startPage(currentPage, 5);
        String name = (String) params.get("username");

        List<Map<String,Object>> list = supMaMapper.find(params);
        //用PageInfo对结果进行包装
        PageInfo<Map<String,Object>> page = new PageInfo<Map<String,Object>>(list);
        //测试PageInfo全部属性
        return page;
    }


    @Override
    public Map<String,Object> selectTan(int id) {
        System.out.println("实现上");
        Map<String,Object> list =  supMaMapper.selectTan(id);
        System.out.println("实现下");
        return list;
    }

    @Override
    public void updateSup(Map<String, Object> params) {
        System.out.println("进入修改了");
        supMaMapper.updateSup(params);
    }


}
