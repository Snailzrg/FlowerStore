package com.zrg.ixd.service;

import java.util.HashMap;
import java.util.List;

import com.zrg.ixd.bean.User;

public interface UserService {

	public	boolean insertUser(User user);
	public	User findUserById(User user);
	public  User login(User user);
	public  boolean delete(User user);
	public  boolean checkUserByName(String empName);
	public	boolean insertUserList(List<User> user);
	//根据 参数 获得用户
	public List<User> getUserLists(String uname);
	/**
	 * 这个其实是修改用户
	 * @param u
	 * @return
	 */
	public Boolean updateUser(User u);
}
