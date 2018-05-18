package com.zrg.ixd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.bean.UserAdress;
import com.zrg.ixd.service.impl.UserAdressService;
import com.zrg.ixd.util.Msg;

@Controller
public class UserAdressController {

	@Autowired
	UserAdressService userAdressService;
	
	/**
	 * 增加地址
	 * @param recevName
	 * @param recevPhone
	 * @param adress
	 * @param session
	 * @return
	 */
	@RequestMapping("/addUserAdress")
	@ResponseBody
	public Msg addUserAdress(@RequestParam("recevName")String recevName,
			@RequestParam("recevPhone")String recevPhone,@RequestParam("adress")String adress,HttpSession session) {
		System.out.println("addUserAdress..........");
		User u = (User) session.getAttribute("User");
		UserAdress record=new UserAdress();
		record.setAdress(adress);
		record.setRecevname(recevName);
		record.setRecevphone(recevPhone);
		if(userAdressService.addUserAdress(u, record)) {
			return Msg.success();
		}
		return Msg.fail();
	}
	
	/**
	 * 获取所有的地址
	 * @param session
	 * @return
	 */
	@RequestMapping("/getAllAdress")
	@ResponseBody
	public Msg getAllAdress(HttpSession session) {
		System.out.println("getAllAdress..........");
		User u = (User) session.getAttribute("User");	
		if(u==null) {
			return Msg.fail();
		}
		List<UserAdress> uAdlist = userAdressService.getAllAdressByUser(u);
		if(uAdlist.size()>0) {
			return Msg.success().add("userAdress", uAdlist);
		}
		return Msg.fail();
	}
	
	/**
	 * 删除地址
	 * @param session
	 * @param adid
	 * @return
	 */
	@RequestMapping("/deletAllAdress")
	@ResponseBody
	public Msg deletAllAdress(HttpSession session,@RequestParam("adid")Integer adid) {
		System.out.println("deletAllAdress..........");
		User u = (User) session.getAttribute("User");		
 
		if(userAdressService.deletUserAdressById(adid)) {
			return Msg.success();
		}
		return Msg.fail();
	}
}
