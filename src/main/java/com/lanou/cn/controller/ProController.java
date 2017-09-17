package com.lanou.cn.controller;

import com.lanou.cn.entity.ProType;
import com.lanou.cn.service.impl.ProInfoServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("prd")
public class ProController {

    @Resource
    private ProInfoServiceImpl proInfoServiceImpl;


    @ModelAttribute("proType")
    public List<ProType> proType(){
        List<ProType> list =proInfoServiceImpl.selectPrdType();
        System.out.println("jiguo"+list);
       return list;
    }


    @RequestMapping("addProduct")
    public String addProduct(){
        return "proInfo/addPro";
    }




}
