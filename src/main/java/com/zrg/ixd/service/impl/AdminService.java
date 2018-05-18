package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.Admin;
import com.zrg.ixd.bean.AdminExample;

import com.zrg.ixd.bean.AdminExample.Criteria;
import com.zrg.ixd.dao.AdminMapper;
import com.zrg.ixd.util.MD5Util;

@Service
public class AdminService {

	@Autowired
	AdminMapper AdminMapper;

	public Admin Login(Admin ad) {
		
		AdminExample example = new AdminExample();
		Criteria criteria = example.createCriteria();
		criteria.andAnameEqualTo(ad.getAname());
		criteria.andApwdEqualTo(ad.getApwd());
		
		
		List<Admin> ulists=AdminMapper.selectByExample(example);
		if(ulists.size()>0) {
			return ulists.get(0);
		}else {
			return new Admin();
		}
		
	}
	
}
