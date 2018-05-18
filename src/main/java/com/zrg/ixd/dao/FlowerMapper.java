package com.zrg.ixd.dao;

import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.FlowerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FlowerMapper {
    long countByExample(FlowerExample example);

    int deleteByExample(FlowerExample example);

    int deleteByPrimaryKey(Integer fid);

    int insert(Flower record);

    int insertSelective(Flower record);

    List<Flower> selectByExample(FlowerExample example);

    Flower selectByPrimaryKey(Integer fid);

    int updateByExampleSelective(@Param("record") Flower record, @Param("example") FlowerExample example);

    int updateByExample(@Param("record") Flower record, @Param("example") FlowerExample example);

    int updateByPrimaryKeySelective(Flower record);

    int updateByPrimaryKey(Flower record);
    /**
     * 自定义 排序类
     * @param example
     * @return
     */
      List<Flower> selectWithPX(FlowerExample example);
}