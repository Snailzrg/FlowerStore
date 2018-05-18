package com.zrg.ixd.test;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.jws.soap.SOAPBinding;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.FlowerType;
import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.bean.UserAdress;
import com.zrg.ixd.bean.UserExample;
import com.zrg.ixd.bean.UserExample.Criteria;
import com.zrg.ixd.dao.UserMapper;
import com.zrg.ixd.service.UserService;
import com.zrg.ixd.service.impl.FlowerService;
import com.zrg.ixd.service.impl.FlowerTypeService;
import com.zrg.ixd.service.impl.ShopCarService;
import com.zrg.ixd.service.impl.UserAdressService;
import com.zrg.ixd.util.MD5Util;

/**
 * @author Snail
 *
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class ServiceTest {

	@Autowired
	UserService userService;

	@Autowired
	FlowerService flowerService;

	@Autowired
	ShopCarService shopcarService;

	@Autowired
	FlowerTypeService flowerTypeService;

	@Autowired
	UserMapper userMapper;

	@Autowired
	UserAdressService userAdressService;

	@Test
	public void Testkl() {
		UserAdress record = new UserAdress();
		record.setAdress("地址");
		record.setRecevname("zrg");
		record.setRecevphone("1353535353");
		User u = new User();
		u.setUid(20);
		System.out.println(userAdressService.addUserAdress(u, record));
	}

	@Test
	public void Testk2() {

		User u = new User();
		u.setUid(850);
		List<UserAdress> uAdlist = userAdressService.getAllAdressByUser(u);

		System.out.println(uAdlist.size());
		for (UserAdress ua : uAdlist) {
			System.out.println(ua.getAdress() + "--" + ua.getRecevname());
		}
	}

	/*
	 * @Test public void test2() { UserExample example=new UserExample(); Criteria
	 * criteria=example.createCriteria(); HashMap<String, Object> parmas=new
	 * HashMap<>(); parmas.put("uname", "测");
	 * 
	 * 
	 * 
	 * for (User user : ulists) { System.out.println(user.getUname()); } }
	 */

	@Test
	public void getUserLists() {
		/*
		 * System.out.println(12346559); List<User> ulists =
		 * userService.getUserLists("cesd"); for (User user : ulists) {
		 * System.out.println(user.getUname()); }
		 */

		UserExample userExample = new UserExample();
		Criteria criteria = userExample.createCriteria();
		criteria.andUnameLike("%" + "测试" + "%");// "%"+fname+"%"
		List<User> ulists = userMapper.selectByExample(userExample);

		for (User user : ulists) {
			System.out.println(user.getUname());
		}
	}

	@Test
	public void testHashMap() {

		HashMap<String, Object> parmas = new HashMap<>();
		parmas.put("name", "zs");
		parmas.put("age", 15);
		parmas.put("pwd", "z123");
		parmas.put("email", "152");
		for (String key : parmas.keySet()) {
			System.out.println(parmas.get(key));
		}

	}

	@Test
	public void TestUseradd() {

		for (int i = 0; i < 20; i++) {
			User u = new User(null, "测试账号" + i, "123", "test" + i + "@163.com", "男", "13588888888", 1, 1, "testimg");
			userService.insertUser(u);
		}

	}

	@Test
	public void TestFlowerTypeService() {
		/*
		 * List<FlowerType> fTypeLists= flowerTypeService.getAllFtypes(); for(FlowerType
		 * ft:fTypeLists) { System.out.println(ft.getFtname());
		 * 
		 * }
		 */
		List<Flower> ls = flowerService.findAllFlowers();
		System.out.println(ls.size());
	}

	@Test
	public void testShopCarServices() {
		User u = new User();
		u.setUid(1);
		List<ShopCar> shopCarLists = shopcarService.getShopCarsByUser(u);
		for (ShopCar s : shopCarLists) {
			System.out.println(s.getFprice());

		}
	}

	@Test
	public void testUserService() throws ParseException {
		// System.out.println(userService);
		// 1 System.out.println(userService.checkUserByName("����33��2"));
		// 1 userService.findUserById(u
		//
		// User u=new User();
		// u.setUid(123);
		// User target=userService.findUserById(u);
		// System.out.println(target);
		// userService.insertUser(user);

		Date date = new Date();
		//
		// Flower flower =new
		// Flower(null,3,"������","test�ʻ�",100,188.0,"��ɫ",date,"tupian","����");
		// flowerService.addFlower(flower);

		for (int i = 0; i < 20; i++) {
			String sjs = UUID.randomUUID().toString().substring(0, 5) + i;
			int x = 3;
			if (i < 10) {
				x = 2;

			}
			// null,x,Integer fid, Integer ftid, String fname, String fdetil, Integer count,
			// Double price, String color,
			// Date creatdate, String fimg, String ftype
			Flower flower = new Flower(null, x, sjs, "test" + i, 100, 188.0, "��ɫ", date, "tupian", "����");
			flowerService.addFlower(flower);
		}

	}

	@Test
	public void TestLogin() {
		User u = new User();
		u.setUname("张三");
		u.setUpwd("123");
		User ut = userService.login(u);
		System.out.println(ut);
	}

	/*
	 * 
	 * System.out.println("好的" + s);
	 * System.out.println("MD5加密" + string2MD5(s)); 
	 * System.out.println("开始" +convertMD5(s));
	 * System.out.println("结束" + convertMD5(convertMD5(s)));
	 */

	@Test
	public void TestAdd2() {
		User u = new User();
		u.setUname("账号测试2s");
		u.setUpwd(MD5Util.convertMD5("123"));
	//	u.setUpwd("123");
	
		
		User ut = userService.login(u);
		System.out.println("解密2"+MD5Util.convertMD5(ut.getUpwd()));
		System.out.println("解密5"+MD5Util.convertMD5(MD5Util.convertMD5(ut.getUpwd())));
		System.out.println(ut);
	}
	

	@Test
	public void TestInsertMd5() {
		User u = new User();
		u.setUname("账号测试2s");
		String s = new String("123");	
		u.setUpwd(MD5Util.convertMD5(s));
		
		u.setSex("男");
		System.out.println(userService.insertUser(u));
	}
	

}
