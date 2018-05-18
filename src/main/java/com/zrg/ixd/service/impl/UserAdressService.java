package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.bean.UserAdress;
import com.zrg.ixd.bean.UserAdressExample;
import com.zrg.ixd.bean.UserAdressExample.Criteria;
import com.zrg.ixd.dao.UserAdressMapper;

@Service
public class UserAdressService {

	@Autowired
	UserAdressMapper userAdressMapper;

	public List<UserAdress> getAllAdressByUser(User user) {
		UserAdressExample example = new UserAdressExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(user.getUid());
		return userAdressMapper.selectByExample(example);
	}

	public boolean addUserAdress(User user, UserAdress record) {
		record.setUid(user.getUid());// H
		if (userAdressMapper.insertSelective(record) > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 根据主键删除
	 * 
	 * @param adid
	 * @return
	 */
	public boolean deletUserAdressById(Integer adid) {

		if (userAdressMapper.deleteByPrimaryKey(adid) > 0) {
			return true;
		}

		return false;
	}
}
