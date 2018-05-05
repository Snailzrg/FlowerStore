package com.zrg.ixd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.impl.ShopCarService;
import com.zrg.ixd.util.Msg;

@Controller
public class ShopCarController {

	@Autowired
	ShopCarService scService;

	
	/**
	 * @param session
	 * @return
	 */
	@RequestMapping("/getMyShopCar")
	@ResponseBody
	public Msg getMyShopCar(HttpSession session) {
		User u = (User) session.getAttribute("User");
		// 判断 用户是否存在
		if (u == null) {
			return Msg.fail().add("error_msg", "尚未登录");
		}
		List<ShopCar> scLists = scService.getShopCarsByUser(u);
		if (scLists.size() > 0) {
			for (ShopCar sc : scLists) {
				System.out.println(sc.getFname() + sc.getFid() + sc.getUid() + sc.getFname() + sc.getCount());
			}
			return Msg.success().add("shopCarList", scLists);

		} 
			// 用户当前购物车里面没有商品 1:?商品后续删除 该条购物车是否可用？ 状态？暂时 数据库中 无....
			System.out.println("当前用户购物车为空");
			return Msg.fail();
	}

	@RequestMapping("/addGowucar")
	@ResponseBody
	public Msg addGowucar(HttpSession session, @RequestParam("fid") Integer fid,
			@RequestParam("fcount") Integer fcount) {

		System.out.println("处理购物车.fid.." + fid + "-----fcount" + fcount);
		User u = (User) session.getAttribute("User");
		System.out.println(u.getUname());
		System.out.println(u.getUid());
		ShopCar sc = new ShopCar();
		sc.setCount(fcount);
		if (scService.addShopCarByFlowerId(u, fid, sc)) {
			return Msg.success();
		}

		return Msg.fail();
	}

	

}
