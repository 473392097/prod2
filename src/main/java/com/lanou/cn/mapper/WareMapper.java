package com.lanou.cn.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface WareMapper {

    @Select("select * from ware ")
    List<Map<String,Object>> findWares();

    /**
     * 根据id获取菜单信息
     * @param id
     * @return
     */
    @Select("select id, w_no, w_name, w_addr, is_used ,w_type from ware where id=#{id}")
    Map<String,Object> findWareById(@Param("id") Integer id);

    /**
     * 更新菜单
     * @param params
     */
    @Update("update ware set w_no= #{wareNo} , w_name= #{wareName},w_addr= #{wareAddr},is_used= #{isUsed},w_type= #{wareType} where id = #{id}")
    void updateWare(Map<String,Object> params);

    /**
     * 添加菜单
     * @return
     */
    @Insert("insert into ware(w_no,w_name,w_addr,is_used,w_type) values(#{params.wareNo},#{params.wareName},#{params.wareAddr},#{params.isUsed},#{params.wareType})")
    void addWare(@Param("params") Map<String,Object> params);

}
