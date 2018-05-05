package com.zrg.ixd.dao;

import com.zrg.ixd.bean.Adim;
import com.zrg.ixd.bean.AdimExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AdimMapper {
    long countByExample(AdimExample example);

    int deleteByExample(AdimExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Adim record);

    int insertSelective(Adim record);

    List<Adim> selectByExample(AdimExample example);

    Adim selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Adim record, @Param("example") AdimExample example);

    int updateByExample(@Param("record") Adim record, @Param("example") AdimExample example);

    int updateByPrimaryKeySelective(Adim record);

    int updateByPrimaryKey(Adim record);
}