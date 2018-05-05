<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>
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
    	<div class="item" id="nav"><a href="#" class="nav">全部商品分类</a>
        </div>
    	<div class="item"><a href="#" class="home">商城首页</a></div>
        <div class="item"><a href="#">易易特色</a></div>
        <div class="item"><a href="#">热销产品</a></div>
        <div class="item"><a href="#">新品上市</a></div>
        <div class="item"><a href="#">精品推荐</a></div>
        <div class="item"><a href="#">生活服务</a></div>
    </div>
</div>


<div class="w1200">
	<div class="position"><a href="index.jsp">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a></div>
    
    <div class="m_d">
    	<div class="left">
        	<dl><dt>账户管理</dt>
            <dd>
            	<a href="#">个人资料</a>
                <a href="#" class="on">修改密码</a>
                <a href="#">绑定会员卡</a>
                <a href="#">绑定银行卡</a>
                <a href="#">升级管理</a>
                <a href="#">账单列表</a>
                <a href="#">提现申请</a>
            </dd>
            </dl>
          <!--   <dl><dt class="dt02">排队管理</dt>
            <dd>
            	<a href="#">参与排队</a>
                <a href="#">全国排队详情</a>
                <a href="#">23通道排队列表</a>
                <a href="#">12通道排队列表</a>
                <a href="#">6通道排队列表</a>
            </dd>
            </dl> -->
        </div>
        <div class="right">
        	<!-- <dl class="dl01">
            	<dt><img src="images/ico04.jpg"/></dt>
                <dd>
					<table width="725" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="416" class="td01">尊敬的，<font>张三</font> 您好！<span>(普通会员)</span></td>
                        <td width="44">余额：</td>
                        <td width="122"><span>0.000元</span></td>
                        <td width="56" align="right">可用：</td>
                        <td width="87"><span>0.000元</span></td>
                      </tr>
                      <tr>
                        <td>还没有上传头像？ 点击<a href="#">上传头像</a><a class="save" href="#">保存</a></td>
                        <td>冻结：</td>
                        <td><span>0.000元</span></td>
                        <td align="right">已提现：</td>
                        <td><span>0.000元</span></td>
                      </tr>
                    </table>
                    <img src="images/face.jpg"/>
                </dd>
            </dl> -->
            <dl class="dl02">
            	<dt>
                	<span>修改密码</span>
                </dt>
                <dd>
                	<div class="item"><span><font>*</font>原密码：</span><input type="tex" class="txt"/></div>
                    <div class="item"><span><font>*</font>新密码：</span><input type="tex" class="txt"/></div>
                    <div class="item"><span><font>*</font>确认密码：</span><input type="tex" class="txt"/></div>
                    <div class="item"><input type="submit" class="sub" value="确认修改"/></div>
                </dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>

<!--footer-->
<div class="footer">
	<div class="f_bz">
    	<div class="w1200">
            <dl class="dl01">
                <dt>正品保证</dt>
                <dd>正品护航  购物无忧</dd>
            </dl>
            <dl class="dl02">
                <dt>你消费 我买单</dt>
                <dd>返现购物商城</dd>
            </dl>
            <dl class="dl03">
                <dt>品类丰富</dt>
                <dd>品类齐全 轻松购物</dd>
            </dl>
            <dl class="dl04">
                <dt>特色服务体验</dt>
                <dd>为您呈现不一样的服务</dd>
            </dl>
            <div class="clear"></div>
        </div>
    </div>
	
    <div class="w1200">
        <div class="bottom">
            <a href="#">关于我们</a>|<a href="#">帮助中心</a>|<a href="#">法律声明</a>|<a href="#">用户协议</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a href="#">站点地图</a>
           
            <p>网络文化经营许可证：粤网文[2015]0295-065号<br />© 2015 深圳易易城科技网络有限公司. 粤ICP备15042543号</p>
            <p class="p02"><img src="images/home/ico25.jpg"/><img src="images/home/ico26.jpg"/><img src="images/home/ico27.jpg"/><img src="images/home/ico36.jpg"/><img src="images/home/ico37.jpg"/></p>
        </div>
    </div>
</div>



</body>
</html>
