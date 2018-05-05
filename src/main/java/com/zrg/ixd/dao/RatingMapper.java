package com.zrg.ixd.dao;

import com.zrg.ixd.bean.Rating;
import com.zrg.ixd.bean.RatingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RatingMapper {
    long countByExample(RatingExample example);

    int deleteByExample(RatingExample example);

    int deleteByPrimaryKey(Integer rid);

    int insert(Rating record);

    int insertSelective(Rating record);

    List<Rating> selectByExample(RatingExample example);

    Rating selectByPrimaryKey(Integer rid);

    int updateByExampleSelective(@Param("record") Rating record, @Param("example") RatingExample example);

    int updateByExample(@Param("record") Rating record, @Param("example") RatingExample example);

    int updateByPrimaryKeySelective(Rating record);

    int updateByPrimaryKey(Rating record);
}