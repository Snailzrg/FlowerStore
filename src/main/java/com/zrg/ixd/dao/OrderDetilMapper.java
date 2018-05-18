package com.zrg.ixd.dao;

import com.zrg.ixd.bean.OrderDetil;
import com.zrg.ixd.bean.OrderDetilExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderDetilMapper {
    long countByExample(OrderDetilExample example);

    int deleteByExample(OrderDetilExample example);

    int deleteByPrimaryKey(Integer odid);

    int insert(OrderDetil record);

    int insertSelective(OrderDetil record);

    List<OrderDetil> selectByExample(OrderDetilExample example);

    OrderDetil selectByPrimaryKey(Integer odid);

    int updateByExampleSelective(@Param("record") OrderDetil record, @Param("example") OrderDetilExample example);

    int updateByExample(@Param("record") OrderDetil record, @Param("example") OrderDetilExample example);

    int updateByPrimaryKeySelective(OrderDetil record);

    int updateByPrimaryKey(OrderDetil record);
}