package com.lanou.cn.controller;

import com.lanou.cn.service.impl.WareServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("order")
public class OrderInfoController {

    @Autowired
    private WareServiceImpl wareService;


    @RequestMapping("orderPage")
    public ModelAndView mainPage(@RequestParam Map<String,Object> params){
        ModelAndView modelAndView = new ModelAndView();
        System.out.println(params.get("id"));
        System.out.println("********************");
        //新加的
        RestTemplate restTemplate=new RestTemplate();
        MultiValueMap<String,Object> bodyMap=new LinkedMultiValueMap<>();
        bodyMap.add("currentPage",null == params.get("currentPage")?"1" : params.get("currentPage"));
        bodyMap.add("size",5);
        bodyMap.add("id",params.get("id"));
        bodyMap.add("ord_no",params.get("ord_no"));
        bodyMap.add("vip_no",params.get("vip_no"));
        bodyMap.add("ord_tp_cd",params.get("ord_tp_cd"));
        bodyMap.add("ord_tp_cd",params.get("ord_crt_date"));
        bodyMap.add("date_min",params.get("date_min"));
        bodyMap.add("date_max",params.get("date_max"));
//        date_min
        System.out.println("最低时间"+params.get("date_min"));
        System.out.println("最晚时间"+params.get("date_max"));
        System.out.println("uhghh"+restTemplate.postForObject("http://10.90.86.244:8080/order/getOrderInfo", bodyMap, Map.class));
        Map<String,Object> result1 =restTemplate.postForObject("http://10.90.86.244:8080/order/getOrderInfo", bodyMap, Map.class);
        System.out.println(result1);
        System.out.println(result1.get("pages"));
        System.out.println(result1.get("list"));
        System.out.println("找到了");
        modelAndView.addObject("list",result1.get("list"));
        modelAndView.addObject("page",result1);
        modelAndView.addObject("param",params);
        modelAndView.setViewName("/artificial/orderInfo");
        return modelAndView;
    }



    @RequestMapping("cancelOrder")
    @ResponseBody
    public String cancelOrder(String ord_no){
        System.out.println("进去cancelOrder");
        System.out.println("ord_no"+ord_no);
        Map<String,Object> map = new HashMap<>();
        wareService.updateWare2(ord_no);
        System.out.println("##############结束了");
        return "取消成功";
    }








}
