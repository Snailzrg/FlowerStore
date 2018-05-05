package com.zrg.ixd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.impl.OrderService;
import com.zrg.ixd.service.impl.ShopCarService;
import com.zrg.ixd.util.Msg;

@Controller
public class FlowerOrderController {

	@Autowired
	ShopCarService scService;

	@Autowired
	OrderService orderService;
	
	
	/**
	 * 商品直接购买 将 这些 待结账的商品放入session中  不要放到数据库 等 结账时 再从session中 拿出对应的 再
	 * @param session
	 * @param fid
	 * @param fcount
	 * @return
	 */
	@RequestMapping("/buyOne")
//	@ResponseBody
	public Msg buyOne(HttpSession session, @RequestParam("fid") Integer fid, @RequestParam("fcount") Integer fcount) {
		System.out.println("购买+" + fid + "--" + fcount);
		List<ShopCar> ShopCarlist=null;
		if(session.getAttribute("ShopCarlist")==null) {
			ShopCarlist=new ArrayList<ShopCar>();	
			
		}else {
			 ShopCarlist=(List<ShopCar>) session.getAttribute("ShopCarlist");
		}
		User u = (User) session.getAttribute("User");
		ShopCar sc = new ShopCar();
		sc.setCount(fcount);
		scService.addShopCarByFlowerId(u, fid, sc);
		ShopCar newcar=scService.getByFlowerId(fid, u);
		ShopCarlist.add(newcar);
		session.setAttribute("ShopCarlist", "ShopCarlist");
		return Msg.success();
	}

	
	
	/**
	 * 
	 * 结算 ..生成订单 ..对应的库存数量 减少 状态 为代发1 用户取消订单，对应的鲜花 数量增加
	 * 
	 * 
	 * @param session
	 * @param fid
	 * @param fcount
	 * @return
	 */
	@RequestMapping("/balance")
	//@ResponseBody
	public Msg balance(HttpSession session, @RequestParam("fid") Integer fid, @RequestParam("fcount") Integer fcount,@RequestParam String stress) {
		//订单生成策略  先生成总的订单 再生成详单 再改变订单
		List<ShopCar> ShopCarlist=null;
		if(session.getAttribute("ShopCarlist")==null) {
			return Msg.fail();
			
		}else {
			 ShopCarlist=(List<ShopCar>) session.getAttribute("ShopCarlist");
		}
		if(ShopCarlist.size()<1) {
			return Msg.fail();
		}
		
		//现生成订单总表，再循环生成 订单 详细表 后面更改 订单总表(价格)
		Forder order=new Forder();
		User u = (User) session.getAttribute("User");
		order.setUid(u.getUid());
		order.setOadress(stress);
		orderService.addFlowerOrder(order);
		//怎样 唯一得到 刚刚新建的订单表..？用户+地址？再排序选最新的？
		
		for(ShopCar sc:ShopCarlist) {
			
			
		}
		
		//生成订单后 再 查看 对应的数据来源 1 直接购买 2通过购物车 通过购物车的 需要 在订单提交后删除购物车对应的数据
		
		
		
		
		
		
		return Msg.success();
	}
}
