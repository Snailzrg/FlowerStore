package com.zrg.ixd.service;

import java.util.List;

import com.zrg.ixd.bean.User;

public interface UserService {

	public	boolean insertUser(User user);
	public	User findUserById(User user);
	public  User login(User user);
	public  boolean delete(User user);
	public  boolean checkUserByName(String empName);
	public	boolean insertUserList(List<User> user);
}
