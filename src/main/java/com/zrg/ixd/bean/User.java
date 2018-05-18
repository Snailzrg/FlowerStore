package com.zrg.ixd.bean;

import java.io.Serializable;

public class User implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;





	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd + ", email=" + email + ", sex=" + sex
				+ ", phone=" + phone + ", state=" + state + ", utype=" + utype + ", uimg=" + uimg + "]";
	}

	private Integer uid;

    private String uname;

    private String upwd;

    private String email;

    private String sex;

    private String phone;

    private Integer state;

    private Integer utype;

    private String uimg;

    
    
    
    
    public User() {
		super();
		// TODO Auto-generated constructor stub
		this.setState(1);
		this.setUtype(1);
	}

	public User(Integer uid, String uname, String upwd, String email, String sex, String phone, Integer state,
			Integer utype, String uimg) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.email = email;
		this.sex = sex;
		this.phone = phone;
		this.state = 1;//默认 新增 用户 状态为1 //不存在删除用户 只有 改变用户的 状态 1 为可用 0 为禁止使用
		this.utype = 1;//默认 1 为普通会员 2 为黄金会员 ?暂时未做
		this.uimg = uimg;
	}

	public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname == null ? null : uname.trim();
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd == null ? null : upwd.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getUtype() {
        return utype;
    }

    public void setUtype(Integer utype) {
        this.utype = utype;
    }

    public String getUimg() {
        return uimg;
    }

    public void setUimg(String uimg) {
        this.uimg = uimg == null ? null : uimg.trim();
    }
}