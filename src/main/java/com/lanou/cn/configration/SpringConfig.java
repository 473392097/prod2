package com.lanou.cn.configration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.Jedis;

@Configuration
public class SpringConfig {

    @Bean(name = "jedis")
    public Jedis setup() {
        //连接redis服务器，
       Jedis jedis = new Jedis("10.90.86.210", 6379);
       return jedis;
    }
}
