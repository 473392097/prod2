package com.lanou.cn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@RequestMapping("cst")
@Controller
public class ArtificialBeforeController {
    /**
     * 根据用户名或者电话号码查出该用户的详细信息
     * @return
     */
    @RequestMapping("showCst")
    public ModelAndView showCst(@RequestParam Map<String,Object> param,String[] prd_dtl_id,@RequestParam(value="userid",required=false)String userid,String[] num){
        ModelAndView modelAndView=new ModelAndView("/artificial/cstList");
        Map<String,Object> result=new HashMap<>();
        System.out.println(Arrays.toString(prd_dtl_id));
        System.out.println("userid:"+userid);
        System.out.println("num:"+Arrays.toString(num));
        result.put("param",param);
        //调用查询客户信息的接口,返回的信息放到map中
        //result.put(userinfo,);
        modelAndView.addObject("ace",result);

        //调用生成订单的接口
        String uid=userid;
        List<String> list = new ArrayList<String>();
        if (num!=null){
            for (int i = 0; i < num.length; i++) {
                if (num[i] != null && !num[i].equals("")){
                    list.add(num[i]);
                }
            }
        }

        System.out.println(list);




        RestTemplate restTemplate=new RestTemplate();
        MultiValueMap<String,Object> bodyMap=new LinkedMultiValueMap<>();
        bodyMap.add("prd_id",100);
        Map<String,Object> result2 = restTemplate.postForObject("http://localhost:8888/prd/getAllDetail", bodyMap, Map.class);
        System.out.println(result2.get("result"));
        modelAndView.addObject("prduct",result2.get("result"));

        return modelAndView;
    }

    @RequestMapping("test")
    public String test(@RequestParam Map<String, Object>  param,String[] abc){
        System.out.println(param);
        System.out.println(Arrays.toString(abc));
        return "/artificial/test";
    }




}
