package com.zrg.ixd.bean;

import java.io.Serializable;

public class ShopCar implements Serializable{
   

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer gid;

    private Integer uid;

    private Integer fid;

    private String fname;

    private Integer count;

    private Double fmoney;

    private Double fprice;
    
    /**
     *鲜花表+用户 和购物车表是一对1的关系？
     * 新增  暂时未使用
     */
    private Flower flower;

	public Flower getFlower() {
		return flower;
	}

	public void setFlower(Flower flower) {
		this.flower = flower;
	}

	
	public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname == null ? null : fname.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Double getFmoney() {
        return fmoney;
    }

    public void setFmoney(Double fmoney) {
        this.fmoney = fmoney;
    }

    public Double getFprice() {
        return fprice;
    }

    public void setFprice(Double fprice) {
        this.fprice = fprice;
    }
}