package com.lanou.cn.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface ProTypeMapper {

    /**
     * 添加商品类型
     * @return
     */
    @Insert("insert into prd_type(tp_cd,tp_name,is_used,inst_date) values(#{params.tpCd},#{params.tpName},#{params.isUsed},#{params.instDate})")
    void addProType(@Param("params")Map<String,Object> params);

    /**
     * 分页查询商品类型
     * @return
     */
    @Select("select * from prd_type ")
    List<Map<String,Object>> findTypes(Map<String,Object> params);

    /**
     * 根据id获取类型信息
     * @param id
     * @return
     */
    @Select("select id, tp_cd, tp_name, is_used, inst_date from prd_type where id=#{id}")
    Map<String,Object> findTypeById(@Param("id") Integer id);

    /**
     * 更新类型信息
     * @param params
     */
    @Update("update prd_type set tp_cd= #{tpCd} , tp_name= #{tpName},is_used= #{isUsed},inst_date= #{instDate} where id = #{id}")
    void updateType(Map<String,Object> params);
}
