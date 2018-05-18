package com.zrg.ixd.dao;

import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.ShopCarExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShopCarMapper {
    long countByExample(ShopCarExample example);

    int deleteByExample(ShopCarExample example);

    int deleteByPrimaryKey(Integer gid);

    int insert(ShopCar record);

    int insertSelective(ShopCar record);

    List<ShopCar> selectByExample(ShopCarExample example);
    ShopCar selectByPrimaryKey(Integer gid);
    /**
     * 自定义
     * @param example
     * @return
     */
    List<ShopCar> selectByExampleWithImgCont(ShopCarExample example);
    ShopCar selectByPrimaryKeyWithImgCont(Integer gid);
  

    int updateByExampleSelective(@Param("record") ShopCar record, @Param("example") ShopCarExample example);

    int updateByExample(@Param("record") ShopCar record, @Param("example") ShopCarExample example);

    int updateByPrimaryKeySelective(ShopCar record);

    int updateByPrimaryKey(ShopCar record);
}