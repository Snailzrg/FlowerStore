package com.zrg.ixd.test;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.FlowerType;
import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.service.impl.FlowerService;
import com.zrg.ixd.service.impl.FlowerTypeService;
import com.zrg.ixd.service.impl.ShopCarService;

/**
 * @author Snail
 *
 */


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class ServiceTest {

	@Autowired
	UserService userService;
	
	@Autowired
	FlowerService  flowerService;
	
	@Autowired
	ShopCarService shopcarService;
	
	@Autowired
	FlowerTypeService flowerTypeService;
	
	@Test
	public void TestFlowerTypeService() {
		/*
		List<FlowerType> fTypeLists= flowerTypeService.getAllFtypes();
		for(FlowerType ft:fTypeLists) {
			System.out.println(ft.getFtname());
			
		}*/
		List<Flower> ls=flowerService.findAllFlowers();
		System.out.println(ls.size());
	}
	
	
	@Test
	public void testShopCarServices() {
		User u=new User();
		u.setUid(1);
		List<ShopCar>  shopCarLists=shopcarService.getShopCarsByUser(u);
		for(ShopCar s:shopCarLists) {
			System.out.println(s.getFprice());
			
		}
	}
	
	
	@Test
	public void testUserService() throws ParseException {
		//System.out.println(userService);
		//1 System.out.println(userService.checkUserByName("����33��2"));
		//1 userService.findUserById(u
//		
//		User u=new User();
//		u.setUid(123);
//		User target=userService.findUserById(u);
//	     System.out.println(target);
		//userService.insertUser(user);
		
		
		  Date date = new Date();  
//
//	        Flower flower =new Flower(null,3,"������","test�ʻ�",100,188.0,"��ɫ",date,"tupian","����");
//			flowerService.addFlower(flower);
	        
	        for (int i = 0; i <20; i++) {
			String sjs=UUID.randomUUID().toString().substring(0,5)+i;
			int x=3;
			if(i<10) {
				x=2;
				
			}
			//null,x,Integer fid, Integer ftid, String fname, String fdetil, Integer count, Double price, String color,
		//	Date creatdate, String fimg, String ftype
			Flower flower =new Flower(null,x,sjs,"test"+i,100,188.0,"��ɫ",date,"tupian","����");
			flowerService.addFlower(flower);
		}
		
	}
	
	
	@Test
	public void TestLogin() {
		User u=new User();
		u.setUname("test1");
		u.setUpwd("12358");
		User ut=userService.login(u);
		System.out.println(ut);
	}
}
