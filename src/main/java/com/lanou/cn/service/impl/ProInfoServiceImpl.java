package com.lanou.cn.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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

    public Map<String,Object> getProInfo(String prdNo){
        return proInfoMapper.getProInfo(prdNo);
    }

    public int updateProInfo(Map<String, Object> params) {
        proInfoMapper.updateUserInfo(params);
        return 1;
    }


    //查询商品类别
    @Override
    public List<Map<String,Object>> selectPrdType() {
        List<Map<String,Object>> mapList = proInfoMapper.selectPrdType();
        return mapList;
    }
    //查询供应商表
    @Override
    public List<Map<String, Object>> supplier() {
        List<Map<String,Object>> mapList = proInfoMapper.supplier();
        return mapList;

    }
    //插叙商品信息
    @Override
    public List<Map<String, Object>> proInfo() {
        List<Map<String,Object>> mapList = proInfoMapper.proInfo();
        return mapList;
    }

    @Override
    public void insertPro(Map<String, Object> params) {
        proInfoMapper.insertPro(params);
    }

    //查询用户表获取id
    @Override
    public int selectUserId(String username) {
        int a = proInfoMapper.selectUserId(username);
        return a;
    }

    //查询商品表的最后一条记录的id
    @Override
    public int selctProLastId() {
        int a = proInfoMapper.selctProLastId();
        return a;
    }


    public PageInfo<Map<String, Object>> findProPageList(Map<String,Object> params) {
        Integer currentPage = params.get("currentPage") == null ? 1:Integer.parseInt((String)params.get("currentPage"));

        PageHelper.startPage(currentPage, 5);
        List<Map<String,Object>> list = proInfoMapper.findPros(params);
        //用PageInfo对结果进行包装
        PageInfo<Map<String,Object>> page = new PageInfo<Map<String,Object>>(list);
        //测试PageInfo全部属性
        return page;
    }



}
