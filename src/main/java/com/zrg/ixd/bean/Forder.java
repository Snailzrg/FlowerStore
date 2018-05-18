package com.zrg.ixd.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Forder implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer oid;

    private Integer uid;

    private Date odate;

    private Double oprice;

    //   0---订单不显示(删除订单 ) 1--- 未发货 2 --- 已发货   3--- 已收货    
    private Integer state;

    //这个adress当做附加留言....
    private String oadress;

    private Integer adid;

    /**
     * 订单表 关联 用户表 地址表
     * @return
     */
    
    private User user;
    //  订单明细
    private List<OrderDetil> orderdetails;
    
    public List<OrderDetil> getOrderdetails() {
		return orderdetails;
	}

	public void setOrderdetails(List<OrderDetil> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

	public Forder() {
		super();
		this.state = 1;
		this.odate = new Date();
	}

	public Forder(Integer oid, Integer uid, Date odate, Double oprice, Integer state, String oadress, Integer adid,
			User user) {
		super();
		this.oid = oid;
		this.uid = uid;
		this.odate = odate;
		this.oprice = oprice;
		this.state = 1;
		this.oadress = oadress;
		this.adid = adid;
		this.user = user;
	}

	public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
    
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    public Date getOdate() {
        return odate;
    }

    public void setOdate(Date odate) {
        this.odate = odate;
    }

   
    public Double getOprice() {
        return oprice;
    }

    public void setOprice(Double oprice) {
        this.oprice = oprice;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getOadress() {
        return oadress;
    }

    public void setOadress(String oadress) {
        this.oadress = oadress == null ? null : oadress.trim();
    }

    public Integer getAdid() {
        return adid;
    }

    public void setAdid(Integer adid) {
        this.adid = adid;
    }
}