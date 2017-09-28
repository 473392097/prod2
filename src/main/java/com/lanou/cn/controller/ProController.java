package com.lanou.cn.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.cn.mapper.ProDetailMapper;
import com.lanou.cn.service.impl.ProInfoServiceImpl;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("prd")
public class ProController {

    private static final String LOGIN_INFO = "imgUrl";

    //商品信息实现层类123
    @Resource
    private ProInfoServiceImpl proInfoService;
    @Autowired
    private ProDetailMapper mapper;


//   ———————————————————————————————— 跳转到前端添加商品页面 li————————————————————————
    @RequestMapping("addProduct")
    public String addProduct(){
        return "proInfo/addPro";
    }


    //---li---
    //查询商品类别,返回集合对象
    @ModelAttribute("proType")
    public List<Map<String,Object>> proType(){
        System.out.println("进去了");
        List<Map<String,Object>> list =proInfoService.selectPrdType();
        System.out.println("jiguo1"+list);
       return list;
    }

   //--li---
    @ModelAttribute("supplier")
    public List<Map<String,Object>> supplier(){
        List<Map<String,Object>> list =proInfoService.supplier();
        System.out.println("jiguo2"+list);
        return list;
    }

    //--li--- 查询供应商表,返回集合对象
    @ModelAttribute("proInfo")
    public List<Map<String,Object>> proInfo(){
        List<Map<String,Object>> list =proInfoService.proInfo();
        System.out.println("jiguo3"+list);
        return list;
    }




    //添加商品信息--li---
    @RequestMapping("addProInfo")
    @ResponseBody
    public Map<String,Object> addProInfo(@RequestParam Map<String,Object> params,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        int a = proInfoService.selectUserId((String) request.getSession().getAttribute("loginInfo"));//获取登录名
        int b = proInfoService.selctProLastId();
        int c = b +1;
        String  prdType = (String) params.get("prdType");//获取类别的id
        String pid = "" + c;//把id转换为字符串
        String prdNo =pid+prdType;//拼接成的字符串
        params.put("prdNo",prdNo);//创建时间
        params.put("instDate",new Date());//创建时间
        params.put("instId",a);//创建人id
        params.put("mdfDate",new Date());//修改时间
        String str = (String) request.getSession().getAttribute("str");
        params.put("imgUrl",str);
        try {
            proInfoService.insertPro(params);
        }catch (Exception e){
            e.printStackTrace();
            map.put("result","failuer");
            return map;
        }
        map.put("result","success");
        System.out.println("方法后面");
        return map;
    }




    //添加商品信息--li---
    @RequestMapping("upload")
    @ResponseBody
    public Map<String, Object> upload(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
        Map<String, Object> result = new HashMap<>();
        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                // 文件保存路径
                String str="http://10.90.110.187:8888/resources/images/dtl/"+file.getOriginalFilename();
                request.getSession().setAttribute("str",str);
                //图像的绝对路径
                String filePath = request.getSession().getServletContext().getRealPath("/") + "resources/images/dtl/" + file.getOriginalFilename();
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


