package com.zrg.ixd.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.util.MD5Util;
import com.zrg.ixd.util.Msg;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	// @ResponseBody
	@RequestMapping("/userLord")
	@ResponseBody
	public Msg checkuser(User u,Model model,HttpSession session) {
		System.out.println("处理登陆");
		if (u.getUname() == null && u.getUname() == "") {
			return Msg.fail().add("var_msg", "用户名为空");
		}
		if (u.getUpwd() == null && u.getUpwd() == "") {
			return Msg.fail().add("var_msg", "密码为空");
		}
		User user=userService.login(u);
		if (user.getUid() == null) {
			
			return Msg.fail().add("var_msg", "登录失败，用户不存在");
		}
		// u.setUpwd(MD5Util.convertMD5(u.getUpwd())); 暂时 不做加密
	
		session.setAttribute("User", user);
		return  Msg.fail().success().add("var_msg", "登录成功");

	}

	/**
	 * 注册！！！！！
	 * @param u
	 * @return
	 */
	@RequestMapping("/userReg")
	@ResponseBody
	public Msg userRegist(@Valid User u) {

		System.out.println("這裏處理注冊。。。");
		System.out.println(u.getUname());
		
		System.out.println(u.getUpwd());
		
		u.setUpwd(MD5Util.convertMD5(u.getUpwd()));
		System.out.println(u.getUpwd());
		System.out.println(u.getEmail());
		
	/*	if(userService.insertUser(u)) {
			
		}*/
		
		return Msg.success();
	}

	/**
	 * 
	 * @param u
	 * @return
	 */
	@RequestMapping("/userUpdate")
	public String userUpate(User u) {

		return "view/";
	}

	/**
	 * 
	 * @param u
	 * @return
	 */
	@RequestMapping("/getAllUser")
	public String getAllUser(User u) {

		return "";
	}

	@RequestMapping("/checkuserName")
	@ResponseBody
	public Msg checkUserName(User u) {
	 if(!userService.checkUserByName(u.getUname())) {
		 //有 true 
		 return Msg.success();
	 }
	 
		return Msg.fail();
	}
	
	
	/**
	 * 通过session拿用户
	 * @return
	 */
	@RequestMapping("/checkUserFromSession")
	@ResponseBody
	public Msg checkUserFromSession(HttpSession session) {
		
		User u=(User) session.getAttribute("User");
		try{
			System.out.println("用戶的id"+u.getUid());
			 return Msg.success();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("失敗。。");
			 return Msg.fail();
		}
	
	}
	
}
