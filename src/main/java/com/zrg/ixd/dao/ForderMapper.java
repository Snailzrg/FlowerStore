package com.zrg.ixd.dao;

import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.ForderExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ForderMapper {
    long countByExample(ForderExample example);

    int deleteByExample(ForderExample example);

    int deleteByPrimaryKey(Integer oid);

    int insert(Forder record);

    int insertSelective(Forder record);

    List<Forder> selectByExample(ForderExample example);

    Forder selectByPrimaryKey(Integer oid);

    int updateByExampleSelective(@Param("record") Forder record, @Param("example") ForderExample example);

    int updateByExample(@Param("record") Forder record, @Param("example") ForderExample example);

    int updateByPrimaryKeySelective(Forder record);

    int updateByPrimaryKey(Forder record);
    
  //帶訂單詳細表的 用户的订单
    /* SELECT  t.* ,a.* FROM forder t ,orderdetil a  WHERE t.oid=a.oid  and uid=20*/
   List<Forder> getAllListsByUser(Integer uid);
/**
 *  <!-- 一个用户对应多个订单  一个订单对应多个详单..-->
 */
    
}