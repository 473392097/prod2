package com.lanou.cn.mapper;

import com.lanou.cn.entity.ProType;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface ProInfoMapper {

    //查询类别表,返回一个List集合对象
    List<Map<String,Object>> selectPrdType();
    //查询供应商
    List<Map<String,Object>> supplier();
    //查询商品表
    List<Map<String,Object>> proInfo();
    //上传图片
//    public void upateImage(String imgUrl);


    void insertPro(Map<String,Object> params);

    @Update("update pro_info set prd_no= #{prdNo} , prd_name= #{prdName},prd_code= #{prdCode}," +
            "sup_id= #{supId},is_gifts= #{isGifts},is_sales= #{isSales},is_return= #{isReturn},is_used= #{isUsed} where id = #{id}")
    int updateUserInfo(Map<String,Object> params);

    Map<String,Object> getProInfo(@Param("prdNo")String prdNo);

    List<Map<String,Object>> findPros(Map<String,Object> params);

}
