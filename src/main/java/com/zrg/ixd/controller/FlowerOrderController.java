package com.zrg.ixd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.OrderDetil;
import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.impl.FlowerService;
import com.zrg.ixd.service.impl.OrderDetilService;
import com.zrg.ixd.service.impl.OrderService;
import com.zrg.ixd.service.impl.ShopCarService;
import com.zrg.ixd.util.Msg;

@Controller
public class FlowerOrderController {

	@Autowired
	ShopCarService scService;

	@Autowired
	OrderService orderService;

	@Autowired
	FlowerService flowerService;

	@Autowired
	OrderDetilService orderDetilService;

	/**
	 * 商品直接购买 将 这些 待结账的商品放入session中 不要放到数据库 等 结账时 再从session中 拿出对应的 再
	 * 
	 * @param session
	 * @param fid
	 * @param fcount
	 * @return
	 */
	@RequestMapping("/buyOne")
	@ResponseBody
	public Msg buyOne(HttpSession session, @RequestParam("fid") Integer fid, @RequestParam("fcount") Integer fcount) {
		System.out.println("购买+" + fid + "--" + fcount);
		List<ShopCar> ShopCarlist = null;
		if (session.getAttribute("buyCar") == null) {
			ShopCarlist = new ArrayList<ShopCar>();

		} else {
			ShopCarlist = (List<ShopCar>) session.getAttribute("buyCar");
			ShopCarlist.clear();// 清掉 数据 ShopCarlist是共用的
		}
		User u = (User) session.getAttribute("User");
		if (u == null) {
			return Msg.fail();
		}
		ShopCar newcar = new ShopCar();
		newcar.setCount(fcount);
		newcar.setFid(fid);
		newcar.setUid(u.getUid());
		// 設置。。

		newcar.setFlower(flowerService.getFlowerById(fid));
		newcar.setFprice(fcount * flowerService.getFlowerById(fid).getPrice());
		session.setAttribute("countMoney", flowerService.getFlowerById(fid).getPrice() * fcount);
		ShopCarlist.add(newcar);
		session.setAttribute("buyCar", ShopCarlist);
		return Msg.success();
	}

	/**
	 * 
	 * 结算 ..生成订单 ..对应的库存数量 减少 状态 为代发1 用户取消订单，对应的鲜花 数量增加
	 * 
	 * @param session
	 * @param fid
	 * @param fcount
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/balance")
	@ResponseBody // "adid":adid,"note":note
	public Msg balance(HttpSession session, @RequestParam("adid") Integer adid,
			@RequestParam(value = "note", defaultValue = "kong") String note) {
		// 订单生成策略 先生成总的订单 再生成详单 再改变订单V

		System.out.println("结账..............");
		List<ShopCar> ShopCarlist = null;
		if (session.getAttribute("buyCar") == null) {
			return Msg.fail();

		} else {
			ShopCarlist = (List<ShopCar>) session.getAttribute("buyCar");
		}
		if (ShopCarlist.size() < 1) {
			return Msg.fail();
		}
		double countMoney = (double) session.getAttribute("countMoney");
		System.out.println(".........结账....");
		// 现生成订单总表，再循环生成 订单 详细表 后面更改 订单总表(价格)
		Forder order = new Forder();
		User u = (User) session.getAttribute("User");
		order.setUid(u.getUid());
		order.setOprice(countMoney);
		order.setOadress(note);
		order.setAdid(adid);
		orderService.addFlowerOrder(order);
		// 怎样 唯一得到 刚刚新建的订单表..？用户+adid？再排序选最新的？bingo
		Forder temporder = orderService.getTheNewForder(u.getUid(), adid, note);

		for (ShopCar sc : ShopCarlist) {
			OrderDetil odetil = new OrderDetil();
			if (sc.getGid() != null) {
				// 表里面的购物车id不为空 来自购物表
				System.out.println("i am from table....");
				// scService.deletShopCar(u, sc.getGid());
				odetil.setFid(sc.getFid());
				odetil.setOdcount(sc.getCount());
				odetil.setOdprice(sc.getFmoney());
				odetil.setCountprice(sc.getFprice());

				scService.deletShopCar(u, sc.getGid());

				flowerService.cutFlowerbyCount(sc.getFid(), sc.getCount());

			} else {
				System.out.println("i am not from table....");
				odetil.setFid(sc.getFid());
				odetil.setOdcount(sc.getCount());
				odetil.setOdprice(sc.getFmoney());
				odetil.setCountprice(sc.getFprice());
				//不是来自与
				
			}
			orderDetilService.addOrderDetil(temporder, odetil);
		}

		// 生成订单后 再 查看 对应的数据来源 1 直接购买 2通过购物车 通过购物车的 需要 在订单提交后删除购物车对应的数据 清掉
		ShopCarlist.clear();
		return Msg.success();
	}

	// 查看所有的订单 查看订单状态为1

	@RequestMapping("/getMyOrders")
	@ResponseBody // "adid":adid,"note":note
	public Msg getMyOrder(HttpSession session, @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		System.out.println("查看我的所有订单吧...");
		User u = (User) session.getAttribute("User");
		if (u == null) {
			return Msg.fail();
		}
		PageHelper.startPage(pn, 10);
		List<Forder> olist = orderService.getFordersByUser(u);
		System.out.println(olist.size());
		PageInfo<Forder> page = new PageInfo<Forder>(olist, 10);
		return Msg.success().add("pageInfo", page);
	}

	/**
	 * 
	 * @param pn
	 * @param parmas
	 * @return
	 */
	@RequestMapping("/getOrdersWithType")
	@ResponseBody
	public Msg getOrdersWithType(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "parmas", defaultValue = "0") Integer parmas) {
		System.out.println("查看訂單。。。。。。。。。。。。。s...");
		List<Forder> olist = null;
		PageHelper.startPage(pn, 10);
		if (parmas == 0) {
			// 这里只是方便查询 传入的参数为o 默认查询所有 状态大于0 的订单 等于0 的订单 是要设置为不可见的
			olist = orderService.getFordersAll();
		} else {
			olist = orderService.getFordersByType(parmas);
		}
		PageInfo<Forder> page = new PageInfo<Forder>(olist, 10);
		return Msg.success().add("pageInfo", page);
	}

	/***
	 * 更新订单 状态
	 * 
	 * @param oid
	 * @param parmas
	 * @return
	 */
	@RequestMapping("/updateForder")
	@ResponseBody
	public Msg updateForder(@RequestParam(value = "oid") Integer oid, @RequestParam(value = "parmas") Integer parmas 
			,@RequestParam(value = "isquxiao",defaultValue="0") Integer isquxiao) {
		System.out.println("更新订单吧..." + oid + "----" + (parmas - 1));
		Forder forder = orderService.getForderById(oid);
		if (forder == null) {
			return Msg.fail();
		}
		
		//取消订单 则 所有的详单对应的商品的数量加上去
		if(isquxiao==1) {
			List<OrderDetil> odLists=orderDetilService.getOdLists(forder.getOid());
			for(OrderDetil o: odLists) {
				Flower temp=flowerService.getFlowerById(o.getFid());
				System.out.println("这个订单的x详细0..."+temp.getFname());
				temp.setCount(temp.getCount()+o.getOdcount());
				flowerService.updateFlower(temp);
			}
		}
		forder.setState(parmas);
		if (!orderService.updateOrder(forder)) {
			return Msg.fail();
		}
		return Msg.success();
	}

}
