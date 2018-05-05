package com.zrg.ixd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.service.impl.FlowerService;
import com.zrg.ixd.util.Msg;

@Controller
public class FlowerController {

	@Autowired
	FlowerService flowerService;
	
	/**
	 * 后台管理员要显示的鲜花
	 * @param ftypeid
	 * @return
	 */
	@RequestMapping("/getFlowersAdmin")
	@ResponseBody
	public Msg getFlowersAdmin(@RequestParam(value="FlowerType")Integer ftypeid,@RequestParam(value="pn",defaultValue="1")Integer pn) {
		System.out.println("这是后台获得鲜花."+ftypeid);
		PageHelper.startPage(pn, 10);
		List<Flower> flowerList=flowerService.findFlowersByType(ftypeid);
		PageInfo<Flower> page=new PageInfo<Flower>(flowerList,10);
	
		List<Flower> zlist=page.getList();
		for(Flower f:zlist) {
			System.out.println(f.getFname()+"--"+f.getFid()+"-"+f.getPrice());
			
		}
		return Msg.success().add("pageInfo", page);
	}

	
	@RequestMapping("/deletFlower")
	@ResponseBody
	 public Msg deletFlower(@RequestParam(value="FlowerType")Integer ftypeid) {
		System.out.println("这是将要删除的鲜花."+ftypeid);
	
		
		return Msg.success();
	}

	/**
	 * 展示鲜花 
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/showFlowers")
	public String showFlowers(@RequestParam(value="pn",defaultValue="1")Integer pn,
			@RequestParam(value="keyword",defaultValue="请输入关键字")String keyword, Model model) {
		
		PageHelper.startPage(pn, 10);
		List<Flower> flowerList=flowerService.findFlowersByName(keyword);
		PageInfo<Flower> page=new PageInfo<Flower>(flowerList,10);
		model.addAttribute("pageInfo",page);
		model.addAttribute("keyword",keyword);
		List<Flower> zlist=page.getList();
		for(Flower f:zlist) {
			System.out.println(f.getFname()+"--"+f.getFid()+"-"+f.getPrice());
			
		}
		return "view/product";
	}
	
	

	/**
	 * 鲜花详细...
	 * @param fid
	 * @param model
	 * @return
	 */
	@RequestMapping("/detail")
	public String detail(@RequestParam(value="fid")Integer fid,
			 Model model) {
		Flower  flower=flowerService.getFlowerById(fid);
		model.addAttribute("Flower",flower );
		return "view/product_show";
	}
	
	
	
	
	
	/**
	 * 首页展示.
	 * 特价花 也就是将数据库中 添加了很久的数据显示
	 * 暂未做 特价规则
	 * @return
	 */
	
	@RequestMapping("/discountFlowers")
	@ResponseBody
	public Msg DiscountFlowers() {
		System.out.println("特价花");
		List<Flower> flists=flowerService.selcetByTime("creatdate ", 3, "ASC");
		for(Flower f:flists) {
			
			System.out.println(f);
			
		}
		System.out.println(flists.size());
		return Msg.success().add("discFlowers", flists);
	}
	
	
	/**
	 * 新品推荐  时间 降序 8条数据
	 * @return
	 */
	@RequestMapping("/newFlowers")
	@ResponseBody
	public Msg NewFlowers() {
		System.out.println("新花推荐");
		List<Flower> flists=flowerService.selcetByTime("creatdate ", 8, "DESC");
		for(Flower f:flists) {
			
			System.out.println(f);
			
		}
		System.out.println(flists.size());
		return Msg.success().add("newFlowers", flists);
	}
	
	
	
	/**
	 * 测试
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/test")
	public String test(@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model) {
		
		//PageHelper.startPage(1, 10);
		List<Flower> flowerList=flowerService.findAllFlowers();
	
		
//		model.addAttribute("flowerList",flowerList);
		
		PageInfo paeg=new PageInfo(flowerList,10);
		model.addAttribute("pageInfo",paeg);
	//	model.addAttribute("flowerList",flowerList);
		List<Flower> zlist=paeg.getList();
		for(Flower f:zlist) {
			System.out.println(f.getFname()+"--"+f.getFid()+"-"+f.getPrice());
			
		}
		model.addAttribute("zlist",zlist);
		
		return "product";
	}
	@RequestMapping("/allFlowers")
	public String getAllFlowers(@RequestParam(value="pn",defaultValue="1")Integer pn,
			Model model) {
		
		//PageHelper.startPage(1, 10);
		List<Flower> flowerList=flowerService.findAllFlowers();
		PageInfo paeg=new PageInfo(flowerList,10);
		model.addAttribute("pageInfo",paeg);
	//	model.addAttribute("flowerList",flowerList);
		List<Flower> zlist=paeg.getList();
		for(Flower f:zlist) {
			System.out.println(f.getFname()+"--"+f.getFid()+"-"+f.getPrice());
			
		}
		return "product";
	}
	
	
	
}
