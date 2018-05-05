package com.zrg.ixd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.util.Msg;

@Controller
public class TestController {
	@Autowired
	UserService userService;
	
	/**
	 * 测试登...
	 * @param u
	 * @return
	 */
	@RequestMapping("/testZrg")
	@ResponseBody //加上这个 处理异步 美滋滋
	public Msg userRegist(User u) {

		System.out.println("异步来了2....");
		
		System.out.println(u.getUname());
		String utname=u.getUname().trim();
	
		if("账户名".equals(utname)) {
			//自定义失败类型...
			System.out.println("fail");
			 return Msg.fail();
		}
		 return Msg.success();
	}

	
	@RequestMapping("/user2Test")
	public String user2Test(User u) {

		System.out.println("跳转....");
		
		
	
		 return "test";
	}

	
	
	
}
