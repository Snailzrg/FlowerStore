package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.Forder;
import com.zrg.ixd.bean.ForderExample;
import com.zrg.ixd.bean.ForderExample.Criteria;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.dao.ForderMapper;
/**
 * 订单表 .. 目前只做 查看所有订单 （联合查询）
 * 新增订单 这个是订单 总表
 * @author Snail
 *
 */
@Service
public class OrderService {

	@Autowired
	ForderMapper orderMapper;
	
	/**
	 * 新增订单总表 用户id 商品 价格
	 *详表 就是对于商品
	 * @param forder
	 * @return
	 */
	public boolean  addFlowerOrder(Forder forder) {
		
		if(orderMapper.insertSelective(forder)>0) {
			return true;
		}
		return false;
	}
	
	public boolean  updateOrder(Forder forder) {
	/*	
		if(orderMapper.insertSelective(forder)>0) {
			return true;
		}*/
		return false;
	}
	
	/**
	 * 从数据库得到对应的信息（只要订单主表）按照时间排序（查询就要排序..）
	 * @param forder
	 * @return
	 */
       public Forder getForder(Forder forder) {
    	   ForderExample example=new ForderExample();
    	   Criteria criteria= example.createCriteria();
    	   criteria.andOadressEqualTo(forder.getOadress());
    	   criteria.andUidEqualTo(forder.getUid());
    	   forder.getUid();
    	   example.setOrderByClause("uid ");
    	   List<Forder> forderLists=orderMapper.selectByExample(example);
    	   if(forderLists.size()>0) {
    		   return forderLists.get(0);
    	   }
    	   
    	   return null;
	}
	
       /**
        * 获得用户的所有订单表
        * 订单 状态  ？ 1：未发货 2：已发货 0：已取消 
        * @param u
        * @return
        */
       public List<Forder> getForders(User u) {
   		
    	   
    	  return null;
	}
       
}
