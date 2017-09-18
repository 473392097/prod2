package com.lanou.cn.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.cn.entity.ProType;
import com.lanou.cn.mapper.ProDetailMapper;
import com.lanou.cn.service.impl.ProInfoServiceImpl;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.sun.tools.doclets.formats.html.SourceToHTMLConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("prd")
public class ProController {


//    商品信息实现层类
    @Resource
    private ProInfoServiceImpl proInfoService;
    @Autowired
    private ProDetailMapper mapper;

//跳转到前端添加商品页面
    @RequestMapping("addProduct")
    public String addProduct(){
        return "proInfo/addPro";
    }


//查询商品类别,返回集合对象
    @ModelAttribute("proType")
    public List<Map<String,Object>> proType(){
        System.out.println("进去了");
        List<Map<String,Object>> list =proInfoService.selectPrdType();
        System.out.println("jiguo1"+list);
       return list;
    }

   // 查询供应商表,返回集合对象
    @ModelAttribute("supplier")
    public List<Map<String,Object>> supplier(){
        List<Map<String,Object>> list =proInfoService.supplier();
        System.out.println("jiguo2"+list);
        return list;
    }






  //添加
    @RequestMapping("addProInfo")
    public Map<String,Object> addProInfo(@RequestParam Map<String,Object> params){
        Map<String,Object> map = new HashMap<>();
        System.out.println(params.get("isGifts"));
        System.out.println(params.get("supId"));
        System.out.println("进去了");
        proInfoService.insertPro(params);
        map.put("result","success");
        map.put("result","failuer");
        System.out.println("方法后面");
        return map;
    }




    @RequestMapping("getProInfo")
    public ModelAndView getProInfo(String prdNo){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("proInfo/proInfo");
        Map<String,Object> menu= proInfoService.getProInfo(prdNo);
        System.out.println(menu.toString());
        modelAndView.addObject("result",menu);

        return modelAndView;
    }


    @RequestMapping("updateProInfo")
    @ResponseBody
    public Map<String,String> updateProInfo(@RequestParam Map<String,Object> params) {
        Map<String,String> result = new HashMap<>();
        int a=proInfoService.updateProInfo(params);
        if(a==1){
            result.put("result","success");
            return  result;
        }
        result.put("result","failure");
        return  result;
    }

    //跳转到前端添加商品页面
    @RequestMapping("promannger")
    public ModelAndView promannger(@RequestParam Map<String,Object> params){
        ModelAndView modelAndView = new ModelAndView();
        // 后期需要优化

        PageInfo<Map<String, Object>> pageInfo = proInfoService.findProPageList(params);
        if(pageInfo.getPages()<pageInfo.getPageNum()){
            pageInfo.setPageNum(1);
        }
        modelAndView.addObject("page",pageInfo);

        modelAndView.addObject("list",pageInfo.getList());
        modelAndView.addObject("params",null == params? new HashMap():params);
        modelAndView.setViewName("/proInfo/promannger");
        return modelAndView;
    }





    @RequestMapping("addProDetails")
    public ModelAndView addProDetails(int prdNo) {
        System.out.println(prdNo);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("proInfo/addDetails");
        modelAndView.addObject("prdNo",prdNo);
        return modelAndView;
    }

    @ModelAttribute("ware")
    public List<Map<String,Object>> getAllWare(){
        return  mapper.getAllWare();
    }

}
