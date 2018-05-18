package com.zrg.ixd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zrg.ixd.bean.Admin;
import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.FlowerType;
import com.zrg.ixd.service.impl.AdminService;
import com.zrg.ixd.service.impl.FlowerService;
import com.zrg.ixd.service.impl.FlowerTypeService;
import com.zrg.ixd.util.Msg;

@Controller
public class AdminController {

	@Autowired
	AdminService adService;
	
	@Autowired
	FlowerTypeService flowerTypeService;
	
	@Autowired
	FlowerService flowerService;
	
	@RequestMapping("/adLogin")
	@ResponseBody
	public Msg AdminLogin(Admin ad,HttpSession session,Model model) {
		System.out.println("管理员登录..."+ad.getAname()+"--miam--"+ad.getApwd());
		Admin admin=adService.Login(ad);
		System.out.println(admin.getAname()==null);
		if(admin.getAname()!=null) {
			session.setAttribute("Admin", admin);
			//为index准备 鲜花的所有种类的信息  将种类转发 以及所有的鲜花信息
			List<FlowerType> fTypeLists=flowerTypeService.getAllFtypes();
			session.setAttribute("flowerTypeList",fTypeLists);
			
			List<Flower> flowerList=flowerService.findAllFlowers();
			
			model.addAttribute("flowerList",flowerList);
			return Msg.success();	
		}
		return Msg.fail();
	}
	
	@RequestMapping("/adLogout")
	public String AdminLogout(HttpSession session) {
		session.setAttribute("Admin", null);
		return "Manage/AdminLogin";
	}
	
	@RequestMapping("/check_admin")
	@ResponseBody
	public Msg check_admin(HttpSession session) {
		Admin ad=(Admin) session.getAttribute("Admin");
		if(ad!=null) {
			return Msg.success();
		}
		return Msg.fail();
	}
}
