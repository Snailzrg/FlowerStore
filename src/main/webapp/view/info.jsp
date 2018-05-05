<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交订单信息</title>
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

购物信息页面${ShopCarlist};
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
	<div class="position"><a href="#">首页</a> > <a href="#">购物车</a></div>
    
    <div class="shopcar">
    	<div class="info_lc"><span class="sp01">我的购物车</span><span class="sp02">填写提交信息表单</span><span class="sp03">在线支付</span></div>
      	
        <dl class="info">
        	<dt><span>确认收货地址</span></dt>
            <dd>
            	<div class="item"><span><font>*</font>所在地区：</span><select><option value="湖南省">湖南省</option></select><select><option value="长沙市">长沙市</option></select><input type="tex" class="txt"/></div>
                <div class="item">
                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="8%"><span><font>*</font>详细地址：</span></td>
                        <td width="92%"><textarea></textarea></td>
                      </tr>
                    </table>
                </div>
                <div class="item"><span><font>*</font>收货人姓名：</span><input type="tex" class="txt"/></div>
                <div class="item"><span><font>*</font>手机：</span><input type="tex" class="txt"/></div>
                <div class="item"><input type="submit" class="sub" value="保存收货人信息"/></div>
            </dd>
        </dl>
        
        <dl>
        	<dt><span>确认订单信息</span></dt>
            <dd>
            	<table width="100%" cellpadding="0" cellspacing="0" border="0">
                  <tr class="tr_t">
                  	<td width="2%">&nbsp;</td>
                    <td width="48%">商品</td>
                    <td width="25%">单价</td>
                    <td width="13%">数量</td>
                    <td width="12%">小计</td>
                  </tr>
                  <tr class="tr_c">
                  	<td>&nbsp;</td>
                    <td>
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%"><img src="images/ico23.jpg"/></td>
                            <td width="85%"><a href="#" class="title">头层牛皮真皮沙发 客厅家具 FPSF0814 进口中厚皮 双人位+单人位+贵妃位</a></td>
                          </tr>
                        </table>
                    </td>
                    <td class="price">￥3083.00</td>
                    <td>1</td>
                    <td class="price">￥3083.00</td>
                  </tr>
                  
                  <tr class="tr_c">
                  	<td>&nbsp;</td>
                    <td>
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="15%"><img src="images/ico23.jpg"/></td>
                            <td width="85%"><a href="#" class="title">头层牛皮真皮沙发 客厅家具 FPSF0814 进口中厚皮 双人位+单人位+贵妃位</a></td>
                          </tr>
                        </table>
                    </td>
                    <td class="price">￥3083.00</td>
                    <td>1</td>
                    <td class="price">￥3083.00</td>
                  </tr>
                  
                  <tr class="tr_d">
                    <td colspan="7">
                    	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                          	<td width="3%">&nbsp;</td>
                            <td width="6%">买家留言：</td>
                            <td width="75%"><input type="text" value="" class="msg"/></td>
                            <td width="6%">应付金额：</td>
                            <td width="10%" class="all_price"><font>￥3083.00</font></td>
                          </tr>
                        </table>
                    </td>
                  </tr>
                </table>
                <div class="clear"></div>
                
   		  </dd>
        </dl>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="go_tb">
         <tr>
           <td width="20%"><a href="#" class="go_buy">继续购物</a></td>
           <td width="63%">&nbsp;</td>
           <td width="17%" align="right"><a href="#" class="code">结 算</a></td>
         </tr>
        </table>
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
	<div class="f_nav">
    	<div class="w1200">
            <dl>
                <dt>新手指南</dt>
                <dd>
                    <a href="#">注册新用户</a>
                    <a href="#">商品订购流程</a>
                    <a href="#">会员注册协议</a>
                </dd>
            </dl>
            <dl>
                <dt>付款方式</dt>
                <dd>
                    <a href="#">支付宝支付</a>
                    <a href="#">网上银行支付</a>
                    <a href="#">货到付款</a>
                </dd>
            </dl>
            <dl>
                <dt>常见问题</dt>
                <dd>
                    <a href="#">订单状态</a>
                    <a href="#">发票说明</a>
                </dd>
            </dl>
            <dl>
                <dt>售后服务</dt>
                <dd>
                    <a href="#">退换货政策</a>
                    <a href="#">退换货流程</a>
                    <a href="#">退款说明</a>
                    <a href="#">退换货申请</a>
                </dd>
            </dl>
            <dl>
                <dt>客服中心</dt>
                <dd>
                    <a href="#">常见问题</a>
                    <a href="#">联系客服</a>
                    <a href="#">投诉与建议</a>
                </dd>
            </dl>
            <div class="ewm"><img src="images/home/ico35.png"/></div>
            <div class="ewm"><img src="images/home/ico38.png"/></div>
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
