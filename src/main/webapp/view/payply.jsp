<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>选择支付</title>
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
		<div class="left">您好，欢迎光临易易城！<a href="#">[登录]</a> <a href="#">[注册]</a></div>
        <div class="right"><a href="#">我的会员中心</a>|<a href="#">收藏夹</a>|<a href="#">服务中心</a>|<a href="#">在线客服</a>|<a href="#">购物车<b>0</b>件</a></div>
        <div class="clear"></div>
    </div>
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
	<div class="w1200">
    	<div class="item"><a href="#" class="home">商城首页</a></div>
        <div class="item"><a href="#">易易特色</a></div>
        <div class="item"><a href="#">热销产品</a></div>
        <div class="item"><a href="#">新品上市</a></div>
        <div class="item"><a href="#">精品推荐</a></div>
        <div class="item"><a href="#">生活服务</a></div>
    </div>
</div>


<div class="w1200">
	<div class="position"><a href="#">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a></div>
    
    <div class="payply">
    	<div class="pay_lc"><span class="sp01">我的购物车</span><span class="sp02">填写提交信息表单</span><span class="sp03">在线支付</span></div>
        <div class="pay_w"><img src="${APP_PATH }/images/ico13.jpg"/><p>订单已提交成功,我们会尽快为您配送。<br />请保持手机畅通</p></div>
        <dl>
        	<dt><span>请选择您的支付方式(暂时只支持货到付款)</span></dt>
            <dd>
                <div class="title"><input type="radio"  checked="checked" value=""/>货到付款</div>
            </dd>
        </dl>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
