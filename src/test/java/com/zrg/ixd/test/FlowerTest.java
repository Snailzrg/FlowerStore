package com.zrg.ixd.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.FlowerExample;
import com.zrg.ixd.bean.FlowerExample.Criteria;
import com.zrg.ixd.dao.FlowerMapper;
import com.zrg.ixd.service.impl.FlowerService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class FlowerTest {

	@Autowired
	FlowerMapper flowerMapper;
	
	@Autowired
	FlowerService flowerService;
	
	@Test
	public void testdesc() {
		/**
		 * fid:29ftid:4fname:a198c19fdetil:test19-creatdate:-Sat Apr 21 00:00:00 CST 2018
fid:18ftid:5fname:811498fdetil:test8-creatdate:-Sat Apr 21 00:00:00 CST 2018
fid:19ftid:5fname:d21fd9fdetil:test9-creatdate:-Sat Apr 21 00:00:00 CST 2018
fid:20ftid:4fname:4944110fdetil:test10-creatdate:-Sat Apr 21 00:00:00 CST 2018
		 */
		FlowerExample example = new FlowerExample();
		Criteria criteria = example.createCriteria();
		criteria.andCountGreaterThan(0);
		example.setOrderByClause("creatdate desc");
		example.setLim(0);
//		
		List<Flower> lists=flowerMapper.selectWithPX(example);
		for(Flower f:lists) {
			System.out.println(f);
			
		}
		
	}
	
	@Test
	public void testmhc() {
		/**
		 * fid:29ftid:4fname:a198c19fdetil:test19-creatdate:-Sat Apr 21 00:00:00 CST 2018
fid:18ftid:5fname:811498fdetil:test8-creatdate:-Sat Apr 21 00:00:00 CST 2018
fid:19ftid:5fname:d21fd9fdetil:test9-creatdate:-Sat Apr 21 00:00:00 CST 2018
fid:20ftid:4fname:4944110fdetil:test10-creatdate:-Sat Apr 21 00:00:00 CST 2018
		 */
		/*FlowerExample example = new FlowerExample();
		Criteria criteria = example.createCriteria();
		criteria.andCountGreaterThan(0);
		example.setOrderByClause("creatdate desc");
		example.setLim(0);*/
//		
		
		
		List<Flower> lists=flowerService.findFlowersByName(null);
		for(Flower f:lists) {
			System.out.println(f);
			
		}
		
	}
	
	@Test
	public void findFlowersByType() {
		flowerService.findFlowersByType(1);
		
	}
	
}
