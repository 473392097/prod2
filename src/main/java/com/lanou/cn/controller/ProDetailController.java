package com.lanou.cn.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.cn.mapper.ProDetailMapper;
import com.lanou.cn.service.ProDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("prd")
public class ProDetailController {
    @Autowired
    private ProDetailService service;
    @Autowired
    private ProDetailMapper mapper;

    @RequestMapping("getAll")
    public ModelAndView getAll(@RequestParam Map<String,Object> param){
        System.out.println("接受的参数:"+param);
        ModelAndView modelAndView = new ModelAndView();
        // 后期需要优化
        PageInfo<Map<String, Object>> pageInfo = service.getAllDetail(param);
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("param",param);
        modelAndView.addObject("list",pageInfo.getList());
        modelAndView.setViewName("/proInfo/proDetailList");
        return modelAndView;

    }

    //跳转到商品详情修改页面
    @RequestMapping("getUpdatePage")
    public ModelAndView getUpdatePage(int id){
        ModelAndView modelAndView = new ModelAndView("/proInfo/updateProDetail");

        Map<String,Object> map=service.getOneDetail(id);
        modelAndView.addObject("onedetail",map);
        System.out.println("根据id查商品明细:"+map);
        return modelAndView;
    }

    //更新商品明细
    @RequestMapping("updateProDetail")
    @ResponseBody
    public Map<String,Object> updateProDetail(@RequestParam Map<String,Object> params){
        Map<String,Object> map=new HashMap<>();
        System.out.println("需要修改的商品明细为:"+params);
        service.updateProDetail(params);
        map.put("result","success");
        return map;
    }

    @ModelAttribute("ware")
    public List<Map<String,Object>> getAllWare(){
        return  mapper.getAllWare();
    }
}
