package com.lanou.cn.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.cn.mapper.ProTypeMapper;
import com.lanou.cn.service.ProTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ProTypeServiceImpl implements ProTypeService {

    @Resource
    private ProTypeMapper proTypeMapper;

    /**
     * 添加商品类型信息
     * @param params
     */
    @Override
    public void addType(Map<String, Object> params) {
        proTypeMapper.addProType(params);
    }

    /**
     * 分页
     * @param params
     * @return
     */
    @Override
    public PageInfo<Map<String, Object>> findTypeList(Map<String, Object> params) {
        Integer currentPage = params.get("currentPage") == null ? 1:Integer.parseInt((String)params.get("currentPage"));

        PageHelper.startPage(currentPage, 5);
        List<Map<String,Object>> list = proTypeMapper.findTypes(params);

        //用PageInfo对结果进行包装
        PageInfo<Map<String,Object>> page = new PageInfo<Map<String,Object>>(list);
        //测试PageInfo全部属性
        return page;
    }

    /**
     * 根据id返回商品类型信息
     * @param id
     * @return
     */
    @Override
    public Map<String, Object> findTypeInfoById(Integer id) {
        Map<String,Object> wareInfo = proTypeMapper.findTypeById(id);
        return wareInfo;
    }

    /**
     * 更新商品类型信息
     * @param params
     */
    @Override
    public void updateType(Map<String, Object> params) {
         proTypeMapper.updateType(params);
    }
}
