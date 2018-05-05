package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.bean.UserExample;
import com.zrg.ixd.bean.UserExample.Criteria;
import com.zrg.ixd.dao.UserMapper;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.util.MD5Util;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;

	@Override
	public boolean insertUser(User user) {
		// TODO Auto-generated method stub
		if(userMapper.insertSelective(user)==1) {
			return true;
		}
		return false;
	}

	@Override
	public User findUserById(User user) {
		// TODO Auto-generated method stub
		User u=userMapper.selectByPrimaryKey(user.getUid());
		return u;
	}
/**
 * 
 */
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
	
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(user.getUname());
		
		criteria.andUpwdEqualTo(user.getUpwd());
		//criteria.andUpwdEqualTo(MD5Util.convertMD5(user.getUpwd()));
		List<User> ulists=userMapper.selectByExample(example);
		if(ulists.size()>0) {
			return ulists.get(0);
		}else {
			return new User();
		}
	}

	@Override
	public boolean delete(User user) {
		// TODO Auto-generated method stub
		
		int res=0;
		if(user.getUname()==null&&user.getUname()=="") {
			res=userMapper.deleteByPrimaryKey(user.getUid());
		}else {
			UserExample example = new UserExample();
			Criteria criteria = example.createCriteria();
			criteria.andUnameEqualTo(user.getUname());
			res=userMapper.deleteByExample(example);
		}
		if(res==1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkUserByName(String empName) {
		// TODO Auto-generated method stub
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(empName);
		List<User> ulist=userMapper.selectByExample(example);
		if(ulist.size()>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertUserList(List<User> user) {
		// TODO Auto-generated method stub
	
		for (User u:user) {
			this.insertUser(u);
		}
		return true;
	}
	
	
}
