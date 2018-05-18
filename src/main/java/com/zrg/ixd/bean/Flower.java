package com.zrg.ixd.bean;

import java.io.Serializable;
import java.util.Date;

public class Flower implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer fid;

	private Integer ftid;

	private String fname;

	private String fdetil;

	private Integer count;

	private Double price;

	private String color;

	private Date creatdate;

	private String fimg;

	private Integer fstate;
	// **新增

	private String ftype;

	private boolean isUse;

	public Flower() {
		super();
		// TODO Auto-generated constructor stub
		this.setUse(true);
	}

	public boolean isUse() {
		return isUse;
	}

	public void setUse(boolean isUse) {
		this.isUse = isUse;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "fid:" + fid + "ftid:" + ftid + "fname:" + fname + "fdetil:" + fdetil + "-creatdate:-" + creatdate;
	}

	public String getFtype() {
		return ftype;
	}

	public void setFtype(String ftype) {
		this.ftype = ftype;
	}

	public Flower(Integer fid, Integer ftid, String fname, String fdetil, Integer count, Double price, String color,
			Date creatdate, String fimg, String ftype) {
		super();
		this.fid = fid;
		this.ftid = ftid;
		this.fname = fname;
		this.fdetil = fdetil;
		this.count = count;
		this.price = price;
		this.color = color;
		this.creatdate = new Date();
		this.fimg = fimg;
		this.ftype = ftype;
		this.isUse = true;// 默认可用
		this.fstate=1;//默认为1
	}

	public Integer getFid() {
		return fid;
	}

	public void setFid(Integer fid) {
		this.fid = fid;
	}

	public Integer getFtid() {
		return ftid;
	}

	public void setFtid(Integer ftid) {
		this.ftid = ftid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname == null ? null : fname.trim();
	}

	public String getFdetil() {
		return fdetil;
	}

	public void setFdetil(String fdetil) {
		this.fdetil = fdetil == null ? null : fdetil.trim();
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color == null ? null : color.trim();
	}

	public Date getCreatdate() {
		return creatdate;
	}

	public void setCreatdate(Date creatdate) {
		this.creatdate = creatdate;
	}

	public String getFimg() {
		return fimg;
	}

	public void setFimg(String fimg) {
		this.fimg = fimg == null ? null : fimg.trim();
	}

	public Integer getFstate() {
		return fstate;
	}

	public void setFstate(Integer fstate) {
		this.fstate = fstate;
	}
}