package com.zrg.ixd.bean;

import java.io.Serializable;

public class FlowerType implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer ftid;

    private String ftname;

    public Integer getFtid() {
        return ftid;
    }

    public void setFtid(Integer ftid) {
        this.ftid = ftid;
    }

    public String getFtname() {
        return ftname;
    }

    public void setFtname(String ftname) {
        this.ftname = ftname == null ? null : ftname.trim();
    }
}