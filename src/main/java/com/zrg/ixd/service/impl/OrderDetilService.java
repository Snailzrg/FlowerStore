package com.zrg.ixd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.OrderDetil;
import com.zrg.ixd.dao.OrderDetilMapper;

@Service
public class OrderDetilService {

	@Autowired
	OrderDetilMapper orderDetilMapper;
	
	/**
	 * 传入的订单表 不需要 设置 fid
	 * 新增订单 详情表
	 * 要知道 花的订单详细 与订单总表
	 */
	public boolean addOrderDetil(Forder forder,OrderDetil record) {
		//这里是与订单总表绑定
		record.setOid(forder.getOid());
		int ret=orderDetilMapper.insertSelective(record);
		if(ret>0) {
			return true;
		}
		return false;
	}
}
