package com.lanou.cn.controller;

import com.lanou.cn.service.ProDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("prodetail")
public class ProDetailController {
    @Autowired
    private ProDetailService service;

    @RequestMapping("getAll")
    public String getAll(){
        System.out.println("---"+service.getAllDetail());
        return "success";
    }
}
