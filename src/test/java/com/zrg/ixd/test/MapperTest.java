package com.zrg.ixd.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zrg.ixd.bean.User;
import com.zrg.ixd.bean.UserExample;
import com.zrg.ixd.bean.UserExample.Criteria;
import com.zrg.ixd.dao.UserMapper;
import com.zrg.ixd.util.MD5Util;

/**
 *��Spring�ĵ�Ԫ����
 * @author Snail
 *���� Mybits��xxMpper
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {

	@Autowired
	UserMapper userMapper;


//	@Autowired
//	UserExample UserExample;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testDept() {

		System.out.println(userMapper);		
		//�ӽ��� MD5Util
		User newU=new User(null,"����һ������","123","zrg@163.com","��","13585858585",2,1,"test..");
		System.out.println("���1"+newU.getUpwd());
		
    	newU.setUpwd(MD5Util.convertMD5(newU.getUpwd()));

		System.out.println("���2"+newU.getUpwd());
		
	  //   userMapper.insertSelective(newU);
		
		User iu=userMapper.selectByPrimaryKey(17);
		System.out.println(iu.getUpwd());
		System.out.println(MD5Util.convertMD5(iu.getUpwd()));
		
//		String s="123";
//			System.out.println("ԭʼ��" + s);  
//    //  System.out.println("MD5��" + MD5Util.string2MD5(s));  
//      System.out.println("���ܵģ�" + MD5Util.convertMD5(s));  
//      System.out.println("���ܵģ�" + MD5Util.convertMD5(MD5Util.convertMD5(s)));  
		
	}
	
	
	@Test
	public void TestInsert() {
		User newU=new User();
//		System.out.println("���1"+newU.getUpwd());
//		
//    	newU.setUpwd(MD5Util.convertMD5(newU.getUpwd()));
//
//		System.out.println("���2"+newU.getUpwd());
//		
//	  System.out.println("���أ�"+userMapper.insertSelective(newU));

		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo("b6ug");
		List<User> ulist=userMapper.selectByExample(example);
		System.out.println(ulist.size());
	 
	}
	
	
	@Test
	public void TestSelect() {
		//��ѯ���� ���� �����û���������
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
//		
//		//ģ����ѯ����
//		criteria.andUnameLike("%"+"����"+"%");
//		
//	//	userMapper.s
		List<User> ulists=userMapper.selectByExample(example);
		System.out.println("��֤"+ulists.size());
//		for(User uu:ulists) {
//			
//			System.out.println(uu.getUname()+".."+uu.getUpwd());
//		}
		User u=userMapper.selectByPrimaryKey(22222);
		System.out.println(u);
	}
	
	
	@Test
	public void TestDelete() {
		
//		int x=userMapper.deleteByPrimaryKey(17);
//		System.out.println("xxx"+x);
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		
		criteria.andUnameLike("����");
		//criteria.andUnameEqualTo("���ܰ�");
	//	System.out.println("����"+userMapper.deleteByExample(example));
		
	}
	
	@Test
	public void TestUpdate() {
		//���Դ������ĸ��²���
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		User u=new User();
	//	u.setUid(20);
		u.setEmail("19test@email");
		u.setPhone("12222222222");
		System.out.println(u.getUid());
		
	//	criteria.andEmailEqualTo("test@email");
		
		// ���� ֻ���� �ı������
		//1 �Ȼ�� uid �ٸ���uid ���û� ��� ����
   // User utemp=userMapper.selectByPrimaryKey(u.getUid());
		//ѭ������ ���Բ�Ϊ�� ��ӵ�Cri �С�����
//    if(u.getEmail()!=null) {
//    	criteria.andEmailEqualTo(u.getEmail());
//    }  if(u.getPhone()!=null) {
//    	criteria.andPhoneEqualTo(u.getPhone());
//    }  if(u.getSex()!=null) {
//    	criteria.andEmailEqualTo(u.getSex());
//    }  if(u.getState()!=null) {
//    	criteria.andEmailEqualTo(u.getEmail());
//    }  if(u.getEmail()!=null) {
//    	criteria.andEmailEqualTo(u.getEmail());
//    }
//    
    
    System.out.println(userMapper.updateByPrimaryKeySelective(u));
	
	//System.out.println("FANHUI"+userMapper.updateByPrimaryKey(utemp));	
		
	}
	
	
	
	
	
	
}
