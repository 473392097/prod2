package com.lanou.cn.service.impl;

import com.lanou.cn.mapper.WareMapper;
import com.lanou.cn.service.WareService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class WareServiceImpl implements WareService {

    @Resource
    private WareMapper wareMapper;


    @Override
    //返回所有的仓储
    public List<Map<String, Object>> findWareList() {

        return wareMapper.findWares();
    }

    @Override
    public Map<String, Object> findWareInfoById(Integer id) {

        Map<String,Object> wareInfo = wareMapper.findWareById(id);
        return wareInfo;
    }

    @Override
    public void updateWare(Map<String, Object> params) {

        wareMapper.updateWare(params);

    }

    @Override
    public void addWare(Map<String, Object> params) {
        wareMapper.addWare(params);
    }
}
