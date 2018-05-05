package com.zrg.ixd.bean;

public class FlowerImg {
    private Integer fiid;

    private Integer fid;

    private String fisrc;

    public Integer getFiid() {
        return fiid;
    }

    public void setFiid(Integer fiid) {
        this.fiid = fiid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public String getFisrc() {
        return fisrc;
    }

    public void setFisrc(String fisrc) {
        this.fisrc = fisrc == null ? null : fisrc.trim();
    }
}