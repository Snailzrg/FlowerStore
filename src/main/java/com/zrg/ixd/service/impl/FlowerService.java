package com.zrg.ixd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zrg.ixd.bean.Flower;
import com.zrg.ixd.bean.FlowerExample;
import com.zrg.ixd.bean.FlowerExample.Criteria;
import com.zrg.ixd.dao.FlowerMapper;

/**
 * ���ʻ��Ĳ���
 * 
 * @author Snail
 *
 */
@Service
public class FlowerService {

	@Autowired
	FlowerMapper fMapper;
	
	/**
	 * 
	 * @param flower
	 * @return
	 */
	public Boolean addFlower(Flower flower) {
		if(fMapper.insertSelective(flower)>0) {
			return true;
		}
	return false;
	}

	/** 
	 * 删除鲜花  ？所有对应该鲜花的 订单 评价？ 所以 删除 只是设置该鲜花不可见 状态 0
	 * @param flower
	 * @return
	 */
	public Boolean deletedFlowerById(Flower flower) {
		/*if(flower.getFid()==null) {
			return false;
		}
		if(fMapper.deleteByPrimaryKey(flower.getFid())>0) {
			return true;
		}*/
		return false;
	}

	
	public  Flower getFlowerById(Integer fid) {		
		return  fMapper.selectByPrimaryKey(fid);
		
	}
	
	
	/**
	 * 对鲜花的更新操作
	 * @param flower
	 * @return
	 */
	public Boolean updateFlower(Flower flower) {
		if(fMapper.selectByPrimaryKey(flower.getFid())!=null) {
			fMapper.updateByPrimaryKeySelective(flower);
			return true;
		}
	
		return false;
	}

	/**
	 * 查询所有鲜花？
	 * @return
	 */
	public List<Flower> findAllFlowers() {
		FlowerExample fe=new FlowerExample();
		Criteria criteria = fe.createCriteria();		
		List<Flower> flists=fMapper.selectByExample(fe);
		return flists;
	}

	/**测试通过
 * 模糊查询
 * @param fname
 * @return
 */
	public List<Flower> findFlowersByName(String fname) {
		FlowerExample fe=new FlowerExample();
		Criteria criteria = fe.createCriteria();
		if(!fname.equals("请输入关键字")) {
			criteria.andFnameLike("%"+fname+"%");
		}
		
		List<Flower> flists=fMapper.selectByExample(fe);
		return flists;
	}
	
	/** 测试通过
	 * 根据鲜花类型
	 * @param ftype
	 * @return
	 */
	public List<Flower> findFlowersByType(Integer ftypeid) {
		FlowerExample fe=new FlowerExample();
		Criteria criteria = fe.createCriteria();	
		if(ftypeid!=0) {
			criteria.andFtidEqualTo(ftypeid);
		}
		List<Flower> flists=fMapper.selectByExample(fe);
		return flists;
	}
	
	/** 测试通过
	 * 对鲜花排序 
	 * @param param 排序字段 
	 * @param lim 排序条数  查询所有 就让其为0
	 * @param pxtype
	 * @return
	 */
	public List<Flower> selcetByTime(String param,int lim,String pxtype){
		FlowerExample example = new FlowerExample();
		Criteria criteria = example.createCriteria();
		criteria.andCountGreaterThan(0);//数量
		example.setOrderByClause(param+pxtype);
		example.setLim(lim);
		
		List<Flower> flists=fMapper.selectWithPX(example);
		for(Flower f:flists) {
			System.out.println(f);
			
		}
		return flists;
	}
	
	
	


}
