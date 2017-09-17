package com.lanou.cn.controller;

/**
 * Created by admin on 13/7/17.
 */

import com.lanou.cn.mapper.ProDetailMapper;
import com.lanou.cn.mapper.UserMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.HashMap;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:spring/spring-context.xml" })
public class ControllerTest{
	@Autowired
	ProDetailMapper mapper;
	@Resource
	UserMapper userMapper;

	@Test
	public void menuTest() {
		System.out.println(userMapper.getUserInfo("zhangsan"));
		String s ="";
		Object o = new Object();
	}

	@Test
	public void proDetailTest(){
		System.out.println(mapper.getAllDetail(new HashMap<>()));
	}
}
