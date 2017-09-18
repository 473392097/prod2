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

    /**
     * 所有的仓储信息
     * @return
     */
    @Override
    public List<Map<String, Object>> findWareList() {

        return wareMapper.findWares();
    }

    /**
     * 根据id返回仓储信息
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> findWareInfoById(Integer id) {

        Map<String,Object> wareInfo = wareMapper.findWareById(id);
        return wareInfo;
    }

    /**
     * 更新仓储信息
     * @param params
     */
    @Override
    public void updateWare(Map<String, Object> params) {

        wareMapper.updateWare(params);

    }

    /**
     * 添加仓储信息
     * @param params
     */
    @Override
    public void addWare(Map<String, Object> params) {
        wareMapper.addWare(params);
    }
}
