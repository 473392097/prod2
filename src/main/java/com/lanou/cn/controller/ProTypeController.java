package com.lanou.cn.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.cn.service.ProTypeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/prd")
public class ProTypeController {

    public static final Logger logger = LoggerFactory.getLogger(ProTypeController.class);

    @Resource
    private ProTypeService proTypeService;

    @RequestMapping("findProType")
    public String findProType() {
        return "/proInfo/addTypeList";
    }

    //添加商品类型信息
    @RequestMapping("addTypeForm")
    @ResponseBody
    public Map<String,Object> addTypeForm(@RequestParam Map<String,Object> params) {
        Map<String,Object> result = new HashMap<>();
        try {
            proTypeService.addType(params); ;
            result.put("result","success");
        } catch (Exception e) {
            result.put("result","failuer");
            e.printStackTrace();
        }
        return result;
    }
    /**
     * 分页
     * @return
     */
    @RequestMapping("getTypeList")
    public ModelAndView getTypeList(@RequestParam Map<String,Object> params){
        ModelAndView modelAndView = new ModelAndView();
        // 后期需要优化
        PageInfo<Map<String, Object>> pageInfo = proTypeService.findTypeList(params);
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("list",pageInfo.getList());
        modelAndView.addObject("params",null==params?new HashMap():params);

        modelAndView.setViewName("/proInfo/addTypeList");
        return modelAndView;
    }
    //跳转到商品类型修改页面
    @RequestMapping("updateType")
    public ModelAndView updateType(int id) {
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> result = proTypeService.findTypeInfoById(id);
        modelAndView.addObject("result",result);
        modelAndView.setViewName("/proInfo/updateType");
        return modelAndView;
    }
    //修改商品类型信息
    @RequestMapping("updateTypeForm")
    @ResponseBody
    public Map<String,Object> updateTypeForm(@RequestParam Map<String,Object> params) {
        Map<String,Object> result = new HashMap<>();
        proTypeService.updateType(params);
        result.put("result","success");
        return result;
    }
}
