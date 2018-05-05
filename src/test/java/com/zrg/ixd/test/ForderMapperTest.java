package com.zrg.ixd.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.OrderDetil;
import com.zrg.ixd.dao.ForderMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class ForderMapperTest {

	@Autowired
	ForderMapper forderMapper;
	
	
	/**
	 * 測試 聯合 通過。。
	 */
	@Test
	public void test() {
		System.out.println(forderMapper);
		Forder  f=forderMapper.getForderWithOdLists(1);
		
		System.out.println(f);
		
		List<OrderDetil> olists=f.getOdetilLists();
		
		for(OrderDetil orderDetil:olists) {
			System.out.println(orderDetil.getOdprice());
		
		}
		
	
	}
		}
	
