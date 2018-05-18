package com.zrg.ixd.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.util.MD5Util;
import com.zrg.ixd.util.Msg;

@Controller
public class UserController {

	@Autowired
	UserService userService;

	/**
	 * 管理员获得用户。。。
	 * @param model
	 * @param session
	 * @param uname
	 * @param pn
	 * @return
	 */
	@RequestMapping("/getUsers")
	@ResponseBody
	public Msg getUsers(@RequestParam(value="parmas",defaultValue="kong")String parmas,@RequestParam(value="pn",defaultValue="1")Integer pn) {
  //获取所有的用户...  用户
		System.out.println("here.getUsers.."+pn+"-------"+parmas);
   	  	
		PageHelper.startPage(pn, 10);
		List<User> ulists=userService.getUserLists(parmas);
		PageInfo<User> page=new PageInfo<User>(ulists,10);	
		List<User> zlist=page.getList();
		System.out.println(zlist.size());
		return Msg.success().add("pageInfo", page).add("parmas", parmas);
	}
	
	
	
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
		System.out.println(u.getUname()+"--"+u.getUpwd());
		//MD5加密 解密...
		u.setUpwd(MD5Util.convertMD5(u.getUpwd())); //暂时 不做加密
		System.out.println(u.getUname()+"--"+u.getUpwd());
		User user=userService.login(u);
		System.out.println(user);
		if (user.getUid() == null) {
			
			return Msg.fail().add("var_msg", "登录失败，用户不存在");
		}
		
	
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

		System.out.println("這裏處理快速注冊。。。");
		System.out.println(u.getUname());
		
		System.out.println(u.getUpwd());
		
		u.setUpwd(MD5Util.convertMD5(u.getUpwd()));
		System.out.println(u.getUpwd());
		System.out.println(u.getEmail());
		
		if(userService.insertUser(u)) {
			return Msg.success();
		}
		return Msg.fail();
		
	}

	/**
	 * 
	 * @param u
	 * @return
	 */
		@RequestMapping("/updatePwd")
		@ResponseBody
		public Msg userUpdate(@RequestParam("upwd") String upwd,@RequestParam("newPwd") String newPwd,HttpSession session) {
			System.out.println("userUpdate......");
			User u = (User) session.getAttribute("User");
			System.out.println(u.getUpwd());
			if(u.getUpwd().equals(MD5Util.convertMD5(upwd.trim()))) {
				u.setUpwd(MD5Util.convertMD5(newPwd));
				System.out.println("改密码....");
				userService.updateUser(u);
				session.setAttribute("User", null);
				return Msg.success();
			}
			return Msg.fail();
		}

	/**
	 * 
	 * @param u
	 * @return
	 */
	@RequestMapping("/dissLord")
	public String getAllUser(HttpSession session) {
		session.setAttribute("User", null);
		return "/view/index";
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
