package com.zrg.ixd.dao;

import com.zrg.ixd.bean.FlowerType;
import com.zrg.ixd.bean.FlowerTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlowerTypeMapper {
    long countByExample(FlowerTypeExample example);

    int deleteByExample(FlowerTypeExample example);

    int deleteByPrimaryKey(Integer ftid);

    int insert(FlowerType record);

    int insertSelective(FlowerType record);

    List<FlowerType> selectByExample(FlowerTypeExample example);

    FlowerType selectByPrimaryKey(Integer ftid);

    int updateByExampleSelective(@Param("record") FlowerType record, @Param("example") FlowerTypeExample example);

    int updateByExample(@Param("record") FlowerType record, @Param("example") FlowerTypeExample example);

    int updateByPrimaryKeySelective(FlowerType record);

    int updateByPrimaryKey(FlowerType record);
}