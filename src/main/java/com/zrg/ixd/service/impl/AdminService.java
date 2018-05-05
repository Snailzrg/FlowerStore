package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.Adim;
import com.zrg.ixd.bean.AdimExample;
import com.zrg.ixd.bean.User;

import com.zrg.ixd.bean.AdimExample.Criteria;
import com.zrg.ixd.dao.AdimMapper;
import com.zrg.ixd.util.MD5Util;

@Service
public class AdminService {

	@Autowired
	AdimMapper adMapper;

	public Adim Login(Adim ad) {
		
		AdimExample example = new AdimExample();
		Criteria criteria = example.createCriteria();
		criteria.andAnameEqualTo(ad.getAname());
		criteria.andApwdEqualTo(ad.getApwd());
		
		
		List<Adim> ulists=adMapper.selectByExample(example);
		if(ulists.size()>0) {
			return ulists.get(0);
		}else {
			return new Adim();
		}
		
	}
	
}
