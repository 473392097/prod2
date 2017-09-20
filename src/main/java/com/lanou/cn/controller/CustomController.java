package com.lanou.cn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("cst")
@Controller
public class CustomController {

    @RequestMapping("showCst")
    public String showCst(){
        return "/cst/cstList";
    }
}
