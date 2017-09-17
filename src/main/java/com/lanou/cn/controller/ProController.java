package com.lanou.cn.controller;

import com.lanou.cn.entity.ProType;
import com.lanou.cn.service.impl.ProInfoServiceImpl;

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


    @ModelAttribute("proInfo")
    public List<Map<String,Object>> proInfo(){
        List<Map<String,Object>> list =proInfoService.proInfo();
        System.out.println("jiguo3"+list);
        System.out.println("结果三的后面");
        return list;
    }




//    @RequestMapping("upload")
//    @ResponseBody
//    public Map<String, Object> upload(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
//        Map<String, Object> result = new HashMap<>();
//        // 判断文件是否为空
//        if (!file.isEmpty()) {
//            try {
//                // 文件保存路径
//                String str="/upload/avatar/"+file.getOriginalFilename();
//                //图像的绝对路径
//                String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/avatar/" + file.getOriginalFilename();
//                System.out.println("头像路径为"+filePath);
////                File newFile = new File(filePath);
////                newFile.createNewFile();
//                proInfoService.upateImage(str);
//                result.put("filepath",filePath);
//                System.out.println("222222222222222222");
//
//                // 把接收到的file直接存到硬盘       转存文件
//                file.transferTo(new File(filePath));
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        result.put("result", "success");
//        return result;


//    }
















}
