package com.zrg.ixd.bean;

public class Rating {
    private Integer rid;

    private Integer fid;

    private Integer uid;

    private String rdetil;

    private Integer rtype;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getRdetil() {
        return rdetil;
    }

    public void setRdetil(String rdetil) {
        this.rdetil = rdetil == null ? null : rdetil.trim();
    }

    public Integer getRtype() {
        return rtype;
    }

    public void setRtype(Integer rtype) {
        this.rtype = rtype;
    }
}