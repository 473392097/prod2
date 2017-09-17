package com.lanou.cn.service.impl;

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


//    @Override
//    public void upateImage(String avatar) {
//        proInfoMapper.upateImage(avatar);
//    }

}
