package com.zrg.ixd.service.impl;

import java.util.List;

import org.aspectj.weaver.NewFieldTypeMunger;
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
	 * @param fid
	 * @return
	 */
	public Boolean deletedFlowerById(Integer fid) {
		Flower flower=this.getFlowerById(fid);
		if(flower==null) {
			return false;
		}
		flower.setFstate(0);
		return this.updateFlower(flower);
	}

	/**
	 * 主键找鲜花
	 * @param fid
	 * @return
	 */
	public  Flower getFlowerById(Integer fid) {		
		return  fMapper.selectByPrimaryKey(fid);
		
	}
	
	/**
	 * 
	 * @param fid
	 * @return
	 */
	public  List<Flower> getFlowerByType(Integer ftid) {
		FlowerExample example =new FlowerExample();
		Criteria criteria=example.createCriteria();
		criteria.andFtidEqualTo(ftid);
		return  fMapper.selectByExample(example);
		
	}
	/**
	 * 减库存
	 * @param fid
	 * @param count
	 * @return
	 */
	public Boolean	cutFlowerbyCount(Integer fid,Integer count) {
		Flower flower=new Flower();
		flower.setFid(fid);
		flower.setCount(count);
	  return this.updateFlowerCount(flower);
	
	}
	
	/**
	 * 对鲜花的更新操作
	 * @param flower
	 * @return
	 */
	public Boolean updateFlowerCount(Flower flower) {
		Flower temp=this.getFlowerById(flower.getFid());
		flower.setCount(temp.getCount()-flower.getCount());
		if(fMapper.selectByPrimaryKey(flower.getFid())!=null) {
			fMapper.updateByPrimaryKeySelective(flower);
			return true;
		}	
		return false;
	}
	
	
/**
 * 减少相应数量的hau
 * @param fid
 * @param count
 * @return
 */
	public Boolean updateFlowerByCount(Integer fid,Integer count) {
		Flower flower=fMapper.selectByPrimaryKey(fid);
		if(flower!=null) {
			flower.setCount(flower.getCount()-count);
			fMapper.updateByPrimaryKeySelective(flower);
			return true;
		}
	
		return false;
	}

	
	/**
	 * 鲜花更新
	 * @param flower
	 * @return
	 */
	public Boolean updateFlower(Flower flower) {
		FlowerExample example=new FlowerExample();
		Criteria criteri=example.createCriteria();
		criteri.andFidEqualTo(flower.getFid());
		if(fMapper.updateByExampleSelective(flower, example)>0){
			return true;
		}
	
		return false;
	}
	/**
	 * 查询所有鲜花？
	 * 默认查状态为1的..
	 * @return
	 */
	public List<Flower> findAllFlowers() {
		FlowerExample fe=new FlowerExample();
		Criteria criteria = fe.createCriteria();
		criteria.andFstateEqualTo(1);
		List<Flower> flists=fMapper.selectByExample(fe);
		return flists;
	}

	
	/**测试通过
 * 模糊查询 查询条件都加上fstate=1 默认查状态为1的..
 * @param fname
 * @return
 */
	public List<Flower> findFlowersByName(String fname,Integer ftid) {
		FlowerExample fe=new FlowerExample();
		Criteria criteria = fe.createCriteria();
		criteria.andFstateEqualTo(1);
		if(!fname.equals("请输入关键字")) {
			criteria.andFnameLike("%"+fname+"%");
		}
		if(ftid!=0) {
			criteria.andFtidEqualTo(ftid);
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
		criteria.andFstateEqualTo(1);
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
		criteria.andFstateEqualTo(1);
		example.setOrderByClause(param+pxtype);
		example.setLim(lim);
		
		List<Flower> flists=fMapper.selectWithPX(example);
		for(Flower f:flists) {
			System.out.println(f);
			
		}
		return flists;
	}
	
	
	


}
