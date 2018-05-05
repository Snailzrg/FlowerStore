package com.zrg.ixd.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.dao.ShopCarMapper;
import com.zrg.ixd.service.impl.ShopCarService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class ShopCarTest {

	@Autowired
	ShopCarService shopCarService;
	
	@Autowired
	ShopCarMapper scMapper;
	
	
	@Test
	public void TestMapperInsert() {
		ShopCar sc=new ShopCar();
		sc.setCount(1211);
		scMapper.insertSelective(sc);
		
	}
	
	
	@Test
	public void testUpdate() {
		//shopCarService.selectByPrimaryKey(1);
		//shopCarService.
		User u =new User();
		u.setUid(1);	
	//	ShopCar sc=shopCarService.getByFlowerId(1, u);
		ShopCar sc=new ShopCar();
		sc.setFname("zrg");
		System.out.println(sc.getFname());
		shopCarService.updateShopCar(u, 3,sc);
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
}
