package com.zrg.ixd.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.bean.UserExample;
import com.zrg.ixd.bean.UserExample.Criteria;
import com.zrg.ixd.dao.UserMapper;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.util.MD5Util;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	/**
	 * 新增用户的时候 自动分配头像
	 */
	@Override
	public boolean insertUser(User user) {
		// TODO Auto-generated method stub
		if (user.getSex().trim().equals("男")) {
			user.setUimg("images/userImg/男.jpg");
		}
		if (user.getSex().trim().equals("女")) {
			user.setUimg("images/userImg/女.jpg");
		}

		System.out.println("tupian+ " + user.getUimg());
		if (userMapper.insertSelective(user) == 1) {
			return true;
		}
		return false;
	}

	@Override
	public User findUserById(User user) {
		// TODO Auto-generated method stub
		User u = userMapper.selectByPrimaryKey(user.getUid());
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
		System.out.println(".login..."+user.getUpwd());
		// criteria.andUpwdEqualTo(MD5Util.convertMD5(user.getUpwd()));
		List<User> ulists = userMapper.selectByExample(example);
		if (ulists.size() > 0) {
			System.out.println("222bbb---"+ulists.get(0));
			return ulists.get(0);
			
		} else {
			return new User();
		}
	}

	/**
	 * 不使用
	 */
	@Override
	public boolean delete(User user) {
		// TODO Auto-generated method stub

		int res = 0;
		if (user.getUname() == null && user.getUname() == "") {
			res = userMapper.deleteByPrimaryKey(user.getUid());
		} else {
			UserExample example = new UserExample();
			Criteria criteria = example.createCriteria();
			criteria.andUnameEqualTo(user.getUname());
			res = userMapper.deleteByExample(example);
		}
		if (res == 1) {
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
		List<User> ulist = userMapper.selectByExample(example);
		if (ulist.size() > 0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean insertUserList(List<User> user) {
		// TODO Auto-generated method stub
		for (User u : user) {
			this.insertUser(u);
		}
		return true;
	}


	@Override
	public Boolean updateUser(User u) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(u.getUid());
		if (userMapper.updateByExampleSelective(u, example) > 0) {
			return true;
		}

		return false;
	}

	/**
	 * 传入参数的模糊查询 暂时 性别 和名字
	 */
	@Override
	public List<User> getUserLists(String uname) {
		// TODO Auto-generated method stub
		// 如果 paemas==null 查所有的用户
		// 都用模糊查询
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		if (!uname.equals("kong")) {
		
			criteria.andUnameLike("%" + uname + "%");
		}
		return userMapper.selectByExample(example);
	}

}
