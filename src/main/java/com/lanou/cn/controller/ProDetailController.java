package com.lanou.cn.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.cn.mapper.ProDetailMapper;
import com.lanou.cn.service.ProDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
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

    //查询商品明细表
    @RequestMapping("getAll")
    public ModelAndView getAll(@RequestParam Map<String,Object> param){
        System.out.println("进去呀了");
        System.out.println("接受的参数:"+param);
        System.out.println("接受的参数:"+param);
        ModelAndView modelAndView = new ModelAndView();
        // 后期需要优化

        RestTemplate restTemplate=new RestTemplate();
        MultiValueMap<String,Object> bodyMap=new LinkedMultiValueMap<>();

        bodyMap.add("currentPage",null == param.get("currentPage")?"1" : param.get("currentPage"));
        bodyMap.add("size",5);
        bodyMap.add("prd_dtl_name",param.get("prd_dtl_name"));
        bodyMap.add("price_min",param.get("price_min"));
        bodyMap.add("price_max",param.get("price_max"));
        bodyMap.add("count_min",param.get("count_min"));
        bodyMap.add("count_max",param.get("count_max"));
        bodyMap.add("is_used",param.get("is_used"));
        System.out.println("uhghh"+restTemplate.postForObject("http://localhost:8888/prd/getAll", bodyMap, Map.class));
        Map<String,Object> result1 =restTemplate.postForObject("http://localhost:8888/prd/getAll", bodyMap, Map.class);
        System.out.println(result1.get("pages"));
        System.out.println(result1.get("list"));
        System.out.println("找到了");
        modelAndView.addObject("list",result1.get("list"));
        modelAndView.addObject("page",result1);
        modelAndView.addObject("param",param);


//        PageInfo<Map<String, Object>> pageInfo = service.getAllDetail(param);
//        modelAndView.addObject("page",pageInfo);
//        modelAndView.addObject("param",param);
//        modelAndView.addObject("list",pageInfo.getList());
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

    //添加商品明细
    @RequestMapping("addProDetail")
    @ResponseBody
    public Map<String,Object> addProDetail(@RequestParam Map<String,Object> params,HttpServletRequest req){
        Map<String,Object> map=new HashMap<>();

        String imgurl= (String) req.getSession().getAttribute("str");
        params.put("img_url",imgurl);
        System.out.println("添加商品明细接收的参数:"+params);
        try {
            service.insertProDetail(params);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result","error");
            return map;
        }
        map.put("result","success");
        return map;
    }

    //查看该明细下所有的仓库对应信息
    @RequestMapping("getDetailInfo")
    @ResponseBody
    public ModelAndView getDetailInfo(int id){
        System.out.println("shangpng明细id"+id);
        ModelAndView modelAndView = new ModelAndView("/proInfo/proDetailInfo");
        RestTemplate restTemplate=new RestTemplate();
        MultiValueMap<String,Object> bodyMap=new LinkedMultiValueMap<>();
        bodyMap.add("id",id);
        List<Map<String,Object>> result = restTemplate.postForObject("http://localhost:8888/prd/getDetailInfo", bodyMap, List.class);
        modelAndView.addObject("proDetailInfo",result);
        return modelAndView;
    }

    //更新仓库与明细关系表
    @RequestMapping("updateRelation")
    @ResponseBody
    public String updateRelation(@RequestParam Map<String,Object> params){
        Map<String,Object> map=new HashMap<>();
        System.out.println("更新仓库与明细关系表接收的参数:"+params);
        try {
            service.updateRelation(params);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result","error");
            return "UPDATE FAILER FUCK!(～￣▽￣)～(～￣▽￣)～";
        }
        map.put("result","success");
        return "UPDATE SUCCESS(￣▽￣)~*";
    }
        //跳转到更新仓库与明细关系表界面
    @RequestMapping("addDetailInfo")
    public ModelAndView addDetailInfo(@RequestParam Map<String,Object> params){
        ModelAndView modelAndView = new ModelAndView("/proInfo/addDetailInfo");
        System.out.println(params);
        String str= (String) params.get("id");
        Map<String,Object> map=new HashMap<>();
        Integer prd_dtl_id=Integer.parseInt(str.split("n")[0]);
        Integer prd_id=Integer.parseInt(str.split("n")[1]);
        System.out.println(prd_dtl_id+" -"+prd_id);
        map.put("prd_dtl_id",prd_dtl_id);
        map.put("prd_id",prd_id);
        //modelAndView.addObject("prd_dtl_id",prd_dtl_id);
        modelAndView.addObject("aaa",map);

        return modelAndView;
    }

    //更新仓库与明细关系表
    @RequestMapping("insertRelation")
    @ResponseBody
    public Map<String,Object> insertRelation(@RequestParam Map<String,Object> params){
        Map<String,Object> map=new HashMap<>();
        System.out.println("添加仓库与明细关系表接收的参数:"+params);
        try {
            service.insertRelation(params);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result","error");
            return map;
        }
        map.put("result","success");
        return map;
    }

    @RequestMapping("upload1")
    @ResponseBody
    public Map<String, Object> upload(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                String str="/avatar/"+file.getOriginalFilename();
                request.getSession().setAttribute("str",str);
                //图像的绝对路径
                String filePath = request.getSession().getServletContext().getRealPath("/") + "avatar/" + file.getOriginalFilename();
                result.put("filepath",filePath);
                // 把接收到的file直接存到硬盘       转存文件
                file.transferTo(new File(filePath));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        result.put("result", "success");
        return result;
    }

}
