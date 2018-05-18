package com.zrg.ixd.bean;

public class OrderDetil {
    private Integer odid;

    private Integer fid;

    private Integer oid;

    private Integer odcount;

    private Double odprice;

    private Double countprice;

    public Integer getOdid() {
        return odid;
    }

    public void setOdid(Integer odid) {
        this.odid = odid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public Integer getOdcount() {
        return odcount;
    }

    public void setOdcount(Integer odcount) {
        this.odcount = odcount;
    }

    public Double getOdprice() {
        return odprice;
    }

    public void setOdprice(Double odprice) {
        this.odprice = odprice;
    }

    public Double getCountprice() {
        return countprice;
    }

    public void setCountprice(Double countprice) {
        this.countprice = countprice;
    }
}