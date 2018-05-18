package com.zrg.ixd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.impl.FlowerService;
import com.zrg.ixd.service.impl.ShopCarService;
import com.zrg.ixd.util.Msg;

@Controller
public class ShopCarController {

	@Autowired
	ShopCarService scService;

	@Autowired
	FlowerService flowerService;
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/goShopping")
	public Msg goShopping(@RequestParam("ids")String ids,HttpSession session){
		System.out.println("我来到你的城市....");
		if(ids==null) {
			return Msg.fail();
		}
		List<ShopCar> ShopCarlist=null;
		if(session.getAttribute("buyCar")==null) {
			ShopCarlist=new ArrayList<ShopCar>();	
			
		}else {
			 ShopCarlist=(List<ShopCar>) session.getAttribute("buyCar");
			 ShopCarlist.clear();//清掉 数据  ShopCarlist是共用的
		}
		double countMoney=0;
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			//组装id的集合
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			//遍历  将这些购物车放入 session 也就是订单 待显示数据 删除表..
			for (Integer itg : del_ids) {
				System.out.println("购物车id"+itg);
				//ShopCar  sc=scService.selectByPrimaryKey(itg);
				ShopCar  sc=scService.selectByPrimaryKeyWithImgCont(itg);
				sc.setFlower(flowerService.getFlowerById(sc.getFid()));
				countMoney+=sc.getFprice();
				System.out.println(sc.getFlower());
				ShopCarlist.add(sc);
			}		
		}else{
			Integer id = Integer.parseInt(ids);
			ShopCar ShopCar=scService.selectByPrimaryKeyWithImgCont(id);
			countMoney+=ShopCar.getFprice();
			ShopCar.setFlower(flowerService.getFlowerById(ShopCar.getFid()));
			ShopCarlist.add(ShopCar);
		}
		
		session.setAttribute("buyCar", ShopCarlist);
		session.setAttribute("countMoney",countMoney);
		return Msg.success();
	}
	
	
	/**
	 * @param session
	 * @return
	 */
	@RequestMapping("/getMyShopCar")
	@ResponseBody
	public Msg getMyShopCar(HttpSession session,@RequestParam(value="pn",defaultValue="1")Integer pn) {
		User u = (User) session.getAttribute("User");
		// 判断 用户是否存在
		if (u == null) {
			return Msg.fail().add("error_msg", "尚未登录");
		}
		PageHelper.startPage(pn, 6);
		List<ShopCar> scLists = scService.getShopCarsByUserWithIMgCont(u);
		PageInfo<ShopCar> page=new PageInfo<ShopCar>(scLists,6);
		if (scLists.size() > 0) {
			System.out.println("购物车....不为空"+scLists.size());
			return Msg.success().add("pageInfo", page);

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

/**+
 * 删除对应的一条购物车记录	
 * @param session
 * @param deletId
 * @return
 */
	@RequestMapping("/deletShopCar")
	@ResponseBody
	public Msg deletShopCar(HttpSession session, @RequestParam("deletId") Integer deletId) {
		User u = (User) session.getAttribute("User");
		if(scService.deletShopCar(u, deletId)) {
			return Msg.success();
		}
		return Msg.fail();
	}

	/**
	 * 这里对应前台页面实时更新购物车
	 * @param session
	 * @param deletId
	 * @return
	 */
	@RequestMapping("/updateShopCar")
	@ResponseBody                                  //gid":gid,"gcount":gcount
	public Msg updateShopCar( @RequestParam("gid") Integer gid,@RequestParam("gcount") Integer gcount) {
		//scService.getByFlowerId(fid, u)
		ShopCar sc=scService.selectByPrimaryKey(gid);
		sc.setCount(gcount);
		sc.setFprice(sc.getCount()*sc.getFmoney());	
		if(scService.updateShopCarByGid(gid, sc)) {
			return Msg.success();
		}
		return Msg.fail();
	}

}
