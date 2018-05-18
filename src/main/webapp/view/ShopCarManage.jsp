<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车管理</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js"  type="text/javascript"></script>

</head>
<body class="index">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>
<div class="top">
		<div class="w1200">
			<div class="left">
				您好，欢迎光临鲜花客！<a href="login.jsp" id="show_login">[登录]</a> <a href="reg.jsp">[注册]</a>
			</div>
			<div class="right">
				<a href="member.jsp">我的会员中心</a>|<a href="shopcar.jsp">购物车<b></b>
				</a>
			</div>
			<div class="clear"></div>
		</div>
	</div>>
</div>

<div class="head">
	<div class="w1200">
    	<div class="logo"><a href="#"></a></div>
      <div class="search">
				<form action="${APP_PATH }/showFlowers" class="form">
					<input type="text" value="请输入关键字" name="keyword" class="txt"
						onfocus="if(value=='请输入关键字') {value=''}"
						onblur="if(value=='') {value='请输入关键字'}" /> <input type="submit"
						value="搜索" class="sub" />
				</form>
				<p>
					<a href="${APP_PATH }/birth">生日</a>|<a href="${APP_PATH }/wedding">婚礼</a>|<a href="${APP_PATH }/blessing">祝福</a>|
						<a href="${APP_PATH }/love">爱意表达</a>|<a href="${APP_PATH }/friendShop">友情</a>|<a
						href="${APP_PATH }/yearMemory">周年纪念</a>
				</p>
			</div>
        <div class="s_r">
        	<dl>
            	<dt><p>购物车<span>0</span></p></dt>
                <dd>客服电话：<b>400-0139-038</b></dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="menu">
	
</div>


<div class="w1200">
	<div class="position"><a href="#">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a></div>
    
    <div class="m_d">
    	<div class="left">
        	<dl><dt>账户管理</dt>
            <dd>
            	<a href="member.jsp" >个人资料</a>
                <a href="pwd.jsp">修改密码</a>
                <a href="OrderManage.jsp">订单管理</a>
                <a href="AdressManage.jsp">地址管理</a>
                <a href="ShopCarManage.jsp" class="on">购物车管理</a>
            </dd>
            </dl>
           
        </div>
        <div class="right">
        	
            <dl class="dl02">
            	<dt>
                	<span>购物车管理</span>
                </dt>
                <dd>
                 
                   
                    
                </dd>
                 <div class="item"><input type="submit" class="sub" value="保存"/></div>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>


</body>
</html>
