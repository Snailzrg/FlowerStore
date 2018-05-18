package com.zrg.ixd.dao;

import com.zrg.ixd.bean.UserAdress;
import com.zrg.ixd.bean.UserAdressExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserAdressMapper {
    long countByExample(UserAdressExample example);

    int deleteByExample(UserAdressExample example);

    int deleteByPrimaryKey(Integer adid);

    int insert(UserAdress record);

    int insertSelective(UserAdress record);

    List<UserAdress> selectByExample(UserAdressExample example);

    UserAdress selectByPrimaryKey(Integer adid);

    int updateByExampleSelective(@Param("record") UserAdress record, @Param("example") UserAdressExample example);

    int updateByExample(@Param("record") UserAdress record, @Param("example") UserAdressExample example);

    int updateByPrimaryKeySelective(UserAdress record);

    int updateByPrimaryKey(UserAdress record);
}