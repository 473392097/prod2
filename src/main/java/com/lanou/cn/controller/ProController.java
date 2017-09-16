package com.lanou.cn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("prd")
public class ProController {

    @RequestMapping("addProduct")
    public String addProduct(){
        return "proInfo/addPro";
    }

}
