package com.zrg.ixd.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.OrderDetil;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.dao.ForderMapper;
import com.zrg.ixd.service.impl.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class ForderMapperTest {

	@Autowired
	ForderMapper forderMapper;

	@Autowired
	OrderService oservice;

	@Test
	public void getTheNewForder() {
		/*
		 * Forder Forder = oservice.getTheNewForder(20, 5, "kong");
		 * 
		 * System.out.println(Forder.getOprice());
		 */

		/*Forder forder = oservice.getForderById(4);
		System.out.println(forder==null);
		forder.setState(0);
	System.out.println(oservice.updateOrder(forder));*/
	
		User u=new User();
		u.setUid(20);
	List<Forder> olist = oservice.getFordersByUser(u);
    System.out.println(olist.size());
	}

	@Test
	public void test() {
		System.out.println(forderMapper);
		List<Forder> olists = forderMapper.getAllListsByUser(10);

		for (Forder d : olists) {
			System.out.println(d.getOadress() + "--" + d.getUid() + "--" + d.getOdate() + "----");
			List<OrderDetil> odlists = d.getOrderdetails();
			for (OrderDetil od : odlists) {
				System.out.println(od.getOdprice() + "++++" + od.getCountprice() + "+++" + od.getOdid() + "+++");
			}
			System.out.println(d.getUid() + "--------------------------------------------------------");
		}
		// and t.uid=#{uid,jdbcType=INTEGER}
		System.out.println(olists.size());
	}

}
