package com.zrg.ixd.bean;

import java.util.Date;
import java.util.List;

public class Forder {
    private Integer oid;

    private Integer uid;

    private Date odate;

    private Double oprice;

    private Integer state;

    private String oadress;

    private List<OrderDetil> odetilLists;
    
    public List<OrderDetil> getOdetilLists() {
		return odetilLists;
	}

	public void setOdetilLists(List<OrderDetil> odetilLists) {
		this.odetilLists = odetilLists;
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
}