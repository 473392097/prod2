package com.lanou.cn.controller;

import com.github.pagehelper.PageInfo;

import com.lanou.cn.entity.Supplier;
import com.lanou.cn.service.impl.SupMaServiceImpl;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
@RequestMapping("sup")
public class SupplierMaController {




    @Resource
    private SupMaServiceImpl supMaService;
    //跳转到前端添加商品页面
//    @RequestMapping("getSupList")
//    public String addProduct(){
//        return "/proInfo/supplierManager";
//    }


    @RequestMapping("getSupList")
    public ModelAndView mainPage(@RequestParam Map<String,Object> params){
        ModelAndView modelAndView = new ModelAndView();

        System.out.println(params);
        //新加的
        RestTemplate restTemplate=new RestTemplate();
        MultiValueMap<String,Object> bodyMap=new LinkedMultiValueMap<>();

        bodyMap.add("currentPage",null == params.get("currentPage")?"1" : params.get("currentPage"));
        bodyMap.add("size",5);
        System.out.println("uhghh"+restTemplate.postForObject("http://localhost:8888/sup/getSupList", bodyMap, Map.class));
        Map<String,Object> result1 =restTemplate.postForObject("http://localhost:8888/sup/getSupList", bodyMap, Map.class);
        System.out.println(result1.get("pages"));
        System.out.println(result1.get("list"));
        System.out.println("找到了");
        modelAndView.addObject("list",result1.get("list"));
        modelAndView.addObject("page",result1);
        modelAndView.addObject("param",params);
//        Map<String,Object> result = restTemplate.postForObject("http://localhost:8080/menu/getMenuListByPage", bodyMap, Map.class);
//        PageInfo<Map<String, Object>> pageInfo = supMaService.find(params);
//        System.out.println("pageInfo"+pageInfo);
//        modelAndView.addObject("page",pageInfo);
//        modelAndView.addObject("list",pageInfo.getList());
//        System.out.println("pageInfo.getList"+pageInfo.getList());
//        modelAndView.addObject("params",params);
//        System.out.println(params.get("supName"));
//        System.out.println(params.get("supComp"));
//        System.out.println(params.get("supAddr"));
//        System.out.println("返回到前端");
        modelAndView.setViewName("/proInfo/supplierManager");
        return modelAndView;
    }



    @RequestMapping("tan")
    public String menListByPate(@RequestParam("id") int id,HttpServletRequest req){
        System.out.println("从前端传过来的id为"+id);
        Map<String,Object> supplier =supMaService.selectTan(id);
        req.getSession().setAttribute("supplier",supplier);
        System.out.println(supplier);
        System.out.println("jkhk");
        return "/proInfo/supEdit";
    }


    //修改
    @RequestMapping("updateSup")
    @ResponseBody
    public Map<String,Object> updateSup(@RequestParam Map<String,Object> params,HttpServletRequest request){
        System.out.println("进入了修改层");
        System.out.println(params.get("supName"));
        System.out.println( params.get("id"));

        Map<String,Object> map = new HashMap<>();
        supMaService.updateSup(params);
//        return "redirect:/sup/getSupList";

        try {
            supMaService.updateSup(params);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result","failuer");
            return map;
        }
        map.put("result","success");
        System.out.println("方法后面");
        return map;

    }








}
