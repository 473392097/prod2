package com.lanou.cn.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.cn.mapper.ProDetailMapper;
import com.lanou.cn.service.ProDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
@Service
@Transactional

public class ProDetailServiceImpl implements ProDetailService {
    @Autowired
    private ProDetailMapper mapper;


    @Override
//     @Cacheable("getAllDetail")
    public PageInfo<Map<String, Object>> getAllDetail(Map<String,Object> params) {
        Integer currentPage = params.get("currentPage") == null ? 1:Integer.parseInt((String)params.get("currentPage"));

        PageHelper.startPage(currentPage, 5);
        List<Map<String,Object>> list = mapper.getAllDetail(params);
        System.out.println("查询的所有明细==="+list);
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

    @Override
    public void insertProDetail(Map<String, Object> map) {
        String proid= (String) map.get("prd_id");
        map.put("prd_dtl_id",proid+mapper.getFirstId()+1);
        mapper.insert(map);
        mapper.insert2(map);
    }

    @Override
    public List<Map<String, Object>> getproDetailInfo(int id) {


        return  mapper.getproDetailInfo(id);
    }

    @Override
    public void updateRelation(Map<String, Object> map) {
        mapper.updateRelation(map);
    }

    @Override
    public void insertRelation(Map<String, Object> map) {
        int num=mapper.selectBywno(map);
        System.out.println(num+"ssadfgdsag=====");
        if (num<=0){
            mapper.insertRelation(map);
        }else {
            mapper.updateBywno(map);
        }
    }


}
