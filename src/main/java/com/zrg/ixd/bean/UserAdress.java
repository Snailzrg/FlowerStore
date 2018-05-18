package com.zrg.ixd.bean;

import java.io.Serializable;

public class UserAdress implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer adid;

    private Integer uid;

    private String adress;

    private String recevname;

    private String recevphone;

    private String note;

    public Integer getAdid() {
        return adid;
    }

    public void setAdid(Integer adid) {
        this.adid = adid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress == null ? null : adress.trim();
    }

    public String getRecevname() {
        return recevname;
    }

    public void setRecevname(String recevname) {
        this.recevname = recevname == null ? null : recevname.trim();
    }

    public String getRecevphone() {
        return recevphone;
    }

    public void setRecevphone(String recevphone) {
        this.recevphone = recevphone == null ? null : recevphone.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}