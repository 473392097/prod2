package com.lanou.cn.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface WareMapper {
    /**
     * 查询所有仓储信息
     * @return
     */
    @Select("select * from ware ")
    List<Map<String,Object>> findWares();

    /**
     * 根据id获取仓储信息
     * @param id
     * @return
     */
    @Select("select id, w_no, w_name, w_addr, is_used ,w_type from ware where id=#{id}")
    Map<String,Object> findWareById(@Param("id") Integer id);

    /**
     * 更新仓储信息
     * @param params
     */
    @Update("update ware set w_no= #{wareNo} , w_name= #{wareName},w_addr= #{wareAddr},is_used= #{isUsed},w_type= #{wareType} where id = #{id}")
    void updateWare(Map<String,Object> params);

    /**
     * 添加仓储信息
     * @return
     */
    @Insert("insert into ware(w_no,w_name,w_addr,is_used,w_type) values(#{params.wareNo},#{params.wareName},#{params.wareAddr},#{params.isUsed},#{params.wareType})")
    void addWare(@Param("params") Map<String,Object> params);

    @Update("UPDATE ord_bsc_info  \n" +
            "LEFT JOIN order_ware  \n" +
            "ON order_ware.ord_no = ord_bsc_info.ord_no\n" +
            "LEFT JOIN ord_dtl_info  \n" +
            "ON order_ware.ord_dtl_no = ord_dtl_info.ord_dtl_no\n" +
            "LEFT JOIN prodetail_ware_relation\n" +
            "on prodetail_ware_relation.prd_dtl_no = order_ware.ord_dtl_no \n" +
            "SET ord_sts_cd='已取消',\n" +
            "order_status='已取消',\n" +
            "order_ware.occ_count = order_ware.occ_count + ord_dtl_info.prd_count ,\n" +
            "prodetail_ware_relation.w_count = prodetail_ware_relation.w_count\n" +
            "WHERE ord_bsc_info.ord_no='D2'")
    void updateWare2(String ord_no);



}
