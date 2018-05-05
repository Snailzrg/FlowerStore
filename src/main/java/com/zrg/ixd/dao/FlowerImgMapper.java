package com.zrg.ixd.dao;

import com.zrg.ixd.bean.FlowerImg;
import com.zrg.ixd.bean.FlowerImgExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlowerImgMapper {
    long countByExample(FlowerImgExample example);

    int deleteByExample(FlowerImgExample example);

    int deleteByPrimaryKey(Integer fiid);

    int insert(FlowerImg record);

    int insertSelective(FlowerImg record);

    List<FlowerImg> selectByExample(FlowerImgExample example);

    FlowerImg selectByPrimaryKey(Integer fiid);

    int updateByExampleSelective(@Param("record") FlowerImg record, @Param("example") FlowerImgExample example);

    int updateByExample(@Param("record") FlowerImg record, @Param("example") FlowerImgExample example);

    int updateByPrimaryKeySelective(FlowerImg record);

    int updateByPrimaryKey(FlowerImg record);
}