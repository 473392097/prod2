package com.lanou.cn.controller;

import com.lanou.cn.service.WareService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ware")
public class WareController {

    public static final Logger logger = LoggerFactory.getLogger(WareController.class);
    @Resource
    private WareService wareService;

    @RequestMapping("findWare")
    public String findWare() {
        return "/ware/wareList";
    }

    //回显仓储信息
    @RequestMapping("getMenuListByPage")
    public ModelAndView getMenuListByPage() {
        ModelAndView modelAndView = new ModelAndView();
        List<Map<String, Object>> list = wareService.findWareList();
        modelAndView.addObject("list",list );
        modelAndView.setViewName("/ware/wareList");
        return modelAndView;

    }
    //跳转到仓储信息修改页面
    @RequestMapping("updateWare")
    public ModelAndView updateWare(int id) {
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> result = wareService.findWareInfoById(id);
        modelAndView.addObject("result",result);
        modelAndView.setViewName("/ware/updateWare");
        return modelAndView;
    }
    //修改仓储信息
    @RequestMapping("updateWareForm")
    @ResponseBody
    public Map<String,Object> updateWareForm(@RequestParam Map<String,Object> params) {
        Map<String,Object> result = new HashMap<>();
            wareService.updateWare(params);
            result.put("result","success");
        return result;
    }
    //添加仓储信息
    @RequestMapping("addWareForm")
    @ResponseBody
    public Map<String,Object> addWareForm(@RequestParam Map<String,Object> params) {
        Map<String,Object> result = new HashMap<>();
        try {
            wareService.addWare(params);
            result.put("result","success");
        } catch (Exception e) {
            result.put("result","failuer");
            e.printStackTrace();
        }
        return result;
    }

}
