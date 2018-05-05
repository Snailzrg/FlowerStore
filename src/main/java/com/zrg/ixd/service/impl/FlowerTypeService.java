package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.FlowerType;
import com.zrg.ixd.bean.FlowerTypeExample;
import com.zrg.ixd.bean.FlowerTypeExample.Criteria;
import com.zrg.ixd.dao.FlowerTypeMapper;

@Service 
public class FlowerTypeService {

	@Autowired
	FlowerTypeMapper flowerTypeMapper;
	/**
	 * 测试已过
	 * @return
	 */
	public List<FlowerType> getAllFtypes(){
		FlowerTypeExample  example=new FlowerTypeExample();
		Criteria criteria=example.createCriteria();
		List<FlowerType> fTypeLists=flowerTypeMapper.selectByExample(example);
		return fTypeLists;
	}
}
