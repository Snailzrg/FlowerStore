package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zrg.ixd.bean.ShopCar;
import com.zrg.ixd.bean.ShopCarExample;
import com.zrg.ixd.bean.ShopCarExample.Criteria;
import com.zrg.ixd.bean.User;
import com.zrg.ixd.dao.ShopCarMapper;

@Service
public class ShopCarService {

	@Autowired
	ShopCarMapper shopCarMapper;
	
	@Autowired
	FlowerService flowerService;

	
	
	
	
	
	
	
	
	/**
	 * 
	 * @param ix
	 * @return
	 */
	public ShopCar selectByPrimaryKeyWithImgCont(Integer ix) {
		ShopCar sc = shopCarMapper.selectByPrimaryKeyWithImgCont(ix);
		return sc;
	}
	
	
	public List<ShopCar> getShopCarsByUserWithIMgCont(User u) {
		ShopCarExample example = new ShopCarExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(u.getUid());
		return shopCarMapper.selectByExampleWithImgCont(example);
	}
	
	
	/*****************************帶參數的****************************************************************/
	/**
	 * 不帶參數的
	 * @param u
	 * @return
	 */
	public List<ShopCar> getShopCarsByUser(User u) {
		ShopCarExample example = new ShopCarExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(u.getUid());
		return shopCarMapper.selectByExample(example);
	}

	/**
	 * 数量 传入的时候 设置
	 * @param u
	 * @param fid
	 * @param sc
	 * @return
	 */
	public boolean addShopCarByFlowerId(User u, Integer fid, ShopCar sc) {
		/**
		 * 加入购物车1 该商品 是否存在 存在 则 增加数量 并且 校验 库存数量 2 不存在 增加 fid==商品
		 * 
		 */
		sc.setFid(fid);
		sc.setUid(u.getUid());
		/*鲜花的名称 与鲜花的价格 这里做的 是冗余..*/
		sc.setFname(flowerService.getFlowerById(fid).getFname());
		sc.setFmoney(flowerService.getFlowerById(fid).getPrice());
		
		ShopCar stemp = this.getByFlowerId(fid, u);
		if (stemp.getGid() != null) {
			// 購物車中存在该对应的记录。。就 更新 暫未 做 這裏 還需要 驗證 庫存
			sc.setCount(sc.getCount() +  stemp.getCount());
			sc.setFprice(sc.getFmoney()*sc.getCount());
			return this.updateShopCar(u, fid, sc);
		}
		if (stemp.getGid()== null ){
			System.out.println("yes");
			sc.setFprice(sc.getFmoney()*sc.getCount());
			if (shopCarMapper.insertSelective(sc) > 0) 
			return true;
		}
		return false;
	}

	/**
	 * 删除购物车
	 * @param u
	 * @param sc
	 * @return
	 */
	public boolean deletShopCar(User u, Integer gid) {
		ShopCarExample example = new ShopCarExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(u.getUid());
		criteria.andGidEqualTo(gid);
		if(shopCarMapper.deleteByExample(example)>0) {
			return true;
		}
		return false;
	}

	/**
	 * 更新 购物车某一条的数据 根据 用户id 鲜花id 确定
	 * 
	 * @param u
	 * @param fid
	 * @param sc
	 * @return
	 */
	public boolean updateShopCar(User u, Integer fid, ShopCar sc) {
		ShopCarExample example = new ShopCarExample();
		Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(u.getUid());
		criteria.andFidEqualTo(fid);
		// 这个方法 ：更新购物车..
		//return ((shopCarMapper.updateByExampleSelective(sc, example) > 0) ? true : false);
		if(shopCarMapper.updateByExampleSelective(sc, example) > 0) {
			return true;
		}
		return false;
	}

	
	
	/**
	 * 根据id更新 购物车
	 * @param gid
	 * @param sc
	 * @return
	 */
	public boolean updateShopCarByGid( Integer gid, ShopCar sc) {
		ShopCarExample example = new ShopCarExample();
		Criteria criteria = example.createCriteria();
		criteria.andGidEqualTo(gid);
		// 这个方法 ：更新购物车..
		//return ((shopCarMapper.updateByExampleSelective(sc, example) > 0) ? true : false);
		if(shopCarMapper.updateByExampleSelective(sc, example) > 0) {
			return true;
		}
		return false;
	}

	
	
	/***
	 * 更新多条数据..
	 * @param u
	 * @param scs
	 * @return
	 */
	public boolean updateShopCarList(User u, List<ShopCar> scs) {

		return false;
	}

	/**
	 * 獲取原始的。。。
	 * @param ix
	 * @return
	 */
	public ShopCar selectByPrimaryKey(Integer ix) {
		ShopCar sc = shopCarMapper.selectByPrimaryKey(ix);
		return sc;
	}

	/**
	 * 某用戶的特定的商品 的動物車
	 * 
	 * @param ix
	 * @param u
	 * @return
	 */
	public ShopCar getByFlowerId(Integer fid, User u) {
		ShopCarExample example = new ShopCarExample();
		Criteria criteria = example.createCriteria();
		criteria.andFidEqualTo(fid);
		criteria.andUidEqualTo(u.getUid());
		List<ShopCar> sclists = shopCarMapper.selectByExample(example);
	
		if(sclists.size()>0) {
			return sclists.get(0);
			
		}
		return new ShopCar();
	}

}
