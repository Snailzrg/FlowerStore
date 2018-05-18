package com.zrg.ixd.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.impl.FlowerService;
import com.zrg.ixd.util.MD5Util;
import com.zrg.ixd.util.Msg;

@Controller
public class FlowerController {

	@Autowired
	FlowerService flowerService;

	/**
	 * 后台管理员要显示的鲜花
	 * 
	 * @param ftypeid
	 * @return
	 */
	@RequestMapping("/getFlowersAdmin")
	@ResponseBody
	public Msg getFlowersAdmin(@RequestParam(value = "FlowerType") Integer ftypeid,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		System.out.println("这是后台获得鲜花." + ftypeid);
		PageHelper.startPage(pn, 10);
		List<Flower> flowerList = flowerService.findFlowersByType(ftypeid);
		PageInfo<Flower> page = new PageInfo<Flower>(flowerList, 10);

		List<Flower> zlist = page.getList();
		for (Flower f : zlist) {
			System.out.println(f.getFname() + "--" + f.getFid() + "-" + f.getPrice());
		}
		return Msg.success().add("pageInfo", page);
	}

	@RequestMapping(value = "/addnewFlower", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public String addnewFlower(Flower flower, @RequestParam(value = "file") MultipartFile file, HttpSession session,
			HttpServletRequest request) {

		System.out.println("这里是鲜花增加..addnewFlower.");
		System.out.println(
				flower.getFname() + "---" + flower.getCount() + "---" + flower.getFtid() + "--" + flower.getColor());
		if (null == file || file.isEmpty()) {
			return "Manage/new_flower";
		}
		// 创建一个文件夹，网上代码很多
		String path = request.getSession().getServletContext().getRealPath("flowerimg");
		String fileName = file.getOriginalFilename();
		System.out.println("图片名称 images/userImg" + fileName + "上传路径path" + path);

		flower.setFimg("images/flowerimg/" + fileName);
		File dir = new File("D:\\Workspaces\\Eclipes2018\\FlowerStore\\src\\main\\webapp\\images\\flowerimg", fileName);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			file.transferTo(dir);
			flowerService.addFlower(flower);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return "Manage/new_flower";
		}

		return "Manage/index";
	}

	/**
	 * 刪除鮮花
	 * 
	 * @param flowerid
	 * @return
	 */
	@RequestMapping("/deletFlower")
	@ResponseBody
	public Msg deletFlower(@RequestParam(value = "flowerid") Integer flowerid) {
		System.out.println(123456 + "删除");
		System.out.println("这是将要删除的鲜花." + flowerid);
		if (flowerService.deletedFlowerById(flowerid)) {
			return Msg.success();
		}
		return Msg.fail();
	}


	
	@RequestMapping("/updateFlower")
	@ResponseBody
	public Msg updateFlower(Flower flower) {
		System.out.println(123456 + "鲜花更新...");
		System.out.println(flower.getFname());
		if(flowerService.updateFlower(flower)) {
			return Msg.success();
		}
		return Msg.fail();
	}

	
	/**
	 * 要更改的鮮花的信息
	 * 
	 * @param flowerid
	 * @param model
	 * @return
	 */
	@RequestMapping("/vaildateFlower")
	public String getVaildateFlower(@RequestParam(value = "flowerid") Integer flowerid, Model model) {
		Flower flower = flowerService.getFlowerById(flowerid);
		if (flower != null) {
			model.addAttribute("vaildateFlower", flower);
			return "Manage/vaildateFlower";
		}
		return "Manage/index";
	}

	@RequestMapping("/getFlowerType")
	public String getFlowerType(@RequestParam(value = "ftid") Integer ftid,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {
		System.out.println("}/getFlowerType&&ftid=6");
		PageHelper.startPage(pn, 10);
		List<Flower> flowerList = flowerService.getFlowerByType(ftid);
		PageInfo<Flower> page = new PageInfo<Flower>(flowerList, 10);
		model.addAttribute("pageInfo", page);
		List<Flower> zlist = page.getList();
		for (Flower f : zlist) {
			System.out.println(f.getFname() + "--" + f.getFid() + "-" + f.getPrice());

		}
		return "view/product";

	}

	/**
	 * 展示鲜花
	 * 
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping("/showFlowers")
	public String showFlowers(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			@RequestParam(value = "keyword", defaultValue = "请输入关键字") String keyword,@RequestParam(value = "ftid" ,defaultValue = "0") Integer ftid, Model model) {
		
		PageHelper.startPage(pn, 10);
		
		 List<Flower> flowerList = flowerService.findFlowersByName(keyword,ftid);
	 
		PageInfo<Flower> page = new PageInfo<Flower>(flowerList, 10);
		model.addAttribute("pageInfo", page);
		model.addAttribute("keyword", keyword);
		model.addAttribute("ftid", ftid);
		List<Flower> zlist = page.getList();
		for (Flower f : zlist) {
			System.out.println(f.getFname() + "--" + f.getFid() + "-" + f.getPrice());

		}
		return "view/product";
	}

	/**
	 * 鲜花详细...
	 * 
	 * @param fid
	 * @param model
	 * @return
	 */
	@RequestMapping("/detail")
	public String detail(@RequestParam(value = "fid") Integer fid, Model model) {
		Flower flower = flowerService.getFlowerById(fid);
		model.addAttribute("Flower", flower);
		return "view/product_show";
	}

	/**
	 * 实时检查鲜花的库存
	 * 
	 * @param fid
	 * @return
	 */
	@RequestMapping("/checkFlowerCount")
	@ResponseBody
	public Msg checkFlowerCount(@RequestParam(value = "fid") Integer fid) {
		Flower flower = flowerService.getFlowerById(fid);
		if (flower != null) {
			return Msg.success().add("count", flower.getCount());
		}
		return Msg.fail();
	}

	/**
	 * 首页展示. 特价花 也就是将数据库中 添加了很久的数据显示 暂未做 特价规则
	 * 
	 * @return
	 */

	@RequestMapping("/discountFlowers")
	@ResponseBody
	public Msg DiscountFlowers() {
		System.out.println("特价花");
		List<Flower> flists = flowerService.selcetByTime("creatdate ", 3, "ASC");
		for (Flower f : flists) {

			System.out.println(f);

		}
		System.out.println(flists.size());
		return Msg.success().add("discFlowers", flists);
	}

	/**
	 * 新品推荐 时间 降序 8条数据
	 * 
	 * @return
	 */
	@RequestMapping("/newFlowers")
	@ResponseBody
	public Msg NewFlowers() {
		System.out.println("新花推荐");
		List<Flower> flists = flowerService.selcetByTime("creatdate ", 8, "DESC");
		for (Flower f : flists) {

			System.out.println(f);

		}
		System.out.println(flists.size());
		return Msg.success().add("newFlowers", flists);
	}

}
