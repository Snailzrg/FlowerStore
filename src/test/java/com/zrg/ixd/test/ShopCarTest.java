package com.zrg.ixd.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.ShopCarExample;
import com.zrg.ixd.bean.ShopCarExample.Criteria;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.dao.ShopCarMapper;
import com.zrg.ixd.service.impl.OrderService;
import com.zrg.ixd.service.impl.ShopCarService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class ShopCarTest {

	@Autowired
	ShopCarService shopCarService;
	
	@Autowired
	ShopCarMapper scMapper;
	
	@Autowired
	OrderService oservice;
	
	
	/**
	 * 生成
	 */
	@Test
	public void TestOrderService() {
		Forder order=new Forder();
		User u = new User();
		u.setUid(20);
		order.setUid(u.getUid());

		System.out.println(oservice.addFlowerOrder(order));
		
	}
	
	
	
	
	@Test
	public void TestMapperInsert() {
		ShopCar sc=new ShopCar();
		sc.setCount(1211);
		scMapper.insertSelective(sc);
		
	}
	
	/**
	 * 曲綫救國。。表設計的問題
	 */
	@Test
	public  void testselectByExampleWithImgCont() {
		ShopCarExample example=new ShopCarExample();
		Criteria criteria=example.createCriteria();
		criteria.andUidEqualTo(20);
	/*	criteria.andFidEqualTo(2);*/
		ShopCar temp=null;
		List<ShopCar> sclist=scMapper.selectByExampleWithImgCont(example);
		for(ShopCar sc:sclist ) {
			if(sc.getFid()==2) {
				temp=sc;
			}
			
		}
		System.out.println(temp.getFlower().getFimg());
	}
	
	@Test
	public  void selectByPrimaryKeyWithImgCont() {
		
	ShopCar temp=shopCarService.selectByPrimaryKeyWithImgCont(16);
		
		System.out.println(temp.getFlower().getFimg());
	}
	
	
	@Test
	public void testUpdate() {
		//shopCarService.selectByPrimaryKey(1);
		//shopCarService.
		User u =new User();
		u.setUid(1);	
	//	ShopCar sc=shopCarService.getByFlowerId(1, u);
		ShopCar sc=new ShopCar();
		sc.setCount(285);
		
		//shopCarService.updateShopCar(u, 3,sc);
		System.out.println(shopCarService.updateShopCarByGid(20, sc));
	}
	
	
	
	@Test
	public void testAdd() {
		User u =new User();
		u.setUid(1);	
		ShopCar sc=new ShopCar();
		sc.setCount(105);
		shopCarService.addShopCarByFlowerId(u, 6, sc);
	}
	
	@Test
	public void testS() {
		User u =new User();
		u.setUid(2);	
		//uid 2 fid 1
		ShopCar sc=shopCarService.getByFlowerId(5, u);
		System.out.println(sc.getGid()!=null);
	}
	
	@Test
	public  void Test121() {
		User u=new User();
		u.setUid(80);
		boolean b=shopCarService.deletShopCar(u, 21);
		System.out.println(b);
	}
}
