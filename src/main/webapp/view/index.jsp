<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<%
				pageContext.setAttribute("APP_PATH", request.getContextPath());
			%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="css/style.css" type="text/css" rel="stylesheet" />
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/common.js" type="text/javascript"></script>
<script type="text/javascript">
				//这个是 轮播的实现  參考的cdsn實現的
				$(document).ready(
						function(e) {
							$('#slider li').eq(0).show();
							var lenThumb = $('#slider li').length;
							for (var i = 1; i <= lenThumb; i++) {
								$('#num').append('<span>' + i + '</span>');
							}
							$('#num span').eq(0).addClass('on');
							var len = $('#num span').length;
							var index = 0;
			
							$('#num span').click(function() {
								index = $('#num span').index(this);
								picShow(index);
							});
							var playPic = setInterval(function() {
								picShow(index);
								index++;
								if (index == len) {
									index = 0
								}
							}, 3000);
							function picShow(i) {
								$('#slider li').eq(i).stop(true, true).fadeIn().siblings()
										.fadeOut();
								$('#num > span').eq(i).addClass('on').siblings()
										.removeClass('on');
							}
			
						});
				//页面加载的时候渲染 1 异步 加载 数据
				$(function() {
					show_TJflower();
					show_XPflower();
				});
			
				//请求特价花信息
				function show_TJflower() {
					$.ajax({
						url : "${APP_PATH}/discountFlowers",
						type : "GET",
						success : function(result) {
						show_tjFlower(result);
						}
					});
				}
			
				/**显示 特价花（后期改为推荐冷门花）
				*/
				function show_tjFlower(result) {
					var tjflowers = result.extend.discFlowers;
					$.each(tjflowers, function(index, item) {
					 	var p01= $("<p class='p01' id='f_name'></p>").append(item.fname);
							 var ft= $("<font>￥</font>");
							 var bf= $("<b></b>").append(item.price);
							 var sopn= $("<br/><span>火热促销 <br />亏本甩卖</span>");
							  var ah=$("<a href='#' class='buy'>立即抢购 ></a>");
						var p02=$("<p class='p02'></p>").append(ft).append(bf).append(sopn).append(ah);
						var img=$("<img src="+item.fimg+" height='195px' width='205px'  />");//图片暂时先通用					
					 	$("<li class='pic'></li>").append(p01).append(p02).append(img).appendTo("#zrg_ixd");
					});
				}
			
				//请求新花信息
				function show_XPflower() {
					$.ajax({
						url : "${APP_PATH}/newFlowers",
						type : "GET",
						success : function(result) {
							console.log(result);					
							show_newFlower(result);
						}
					});
				}
				
				/**
				<div class="item">
						<a href="#" class="title">Apple/苹果ipad mini2 32GB银7.9英寸平板电脑</a>
						<p>
							<font>￥</font>2658.<font>00</font>
						</p>
						<a href="#" class="buy"></a>
						<img src="images/img/img8.jpg" />
				*/	
				
				/**显示 上市新花
				*/
				function show_newFlower(result) {
					alert(25);
					var newflowers = result.extend.newFlowers;
					$.each(newflowers, function(index, item) {
					 	//超链接暂时未做.......
						var a1= $("<a href='detail?fid="+item.fid+"' class='title'></a>").append(item.fname);
						 var ft= $("<font>￥</font>");
							 var bf= $("<b></b>").append(item.price);
							 var ft2= $("<font>.00</font>");
						var p=$("<p></p>").append(ft).append(bf).append(ft2);
						var ab=$("<a href='detail?fid="+item.fid+"' class='buy'></a>");
						var img=$("<img src="+item.fimg+" height='161px' width='184px'  />");//图片暂时先通用					
						$("<div class='item'></div>").append(a1).append(p).append(ab).append(img).appendTo("#zrg_new_flower");
					
					});
					$("<div class='clear'></div>").appendTo("#zrg_new_flower");
					//  <div class="clear"></div>
				}
				
				
			</script>
</head>
<body class="index" onload="opener.location.reload()">

	当前用户${User.uname}
	<div class="top_ad">
		<div class="w1200">
			<a href="#" id="close"></a>
		</div>
	</div>

	<div class="top">
		<div class="w1200">
			<div class="left">
				您好，欢迎光临易易城！
				<c:if test=""></c:if>
				<a href="${APP_PATH }/view/login.jsp">[登录]</a> <a
					href="${APP_PATH }/reg.jsp">[注册]</a>
			</div>
			<div class="right">
				<a href="#">我的会员中心</a>|<a href="#">收藏夹</a>|<a href="#">服务中心</a>|<a
					href="#">在线客服</a>|<a href="${APP_PATH }/view/product.jsp">购物车<b>0</b>件
				</a>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="head">
		<div class="w1200">
			<div class="logo">
				<a href="index.jsp"></a>
			</div>
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
					<dt>
						<p>
							<a href="shopcar.jsp">购物车</a><span>0</span>
						</p>
					</dt>
					<dd>
						客服电话：<b>123-4567-890</b>
					</dd>
				</dl>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="banner">
		<ul id="slider">
			<li style="background: url(images/home/bgf1.jpg) no-repeat center;"><a
				href="#"></a></li>
			<li style="background: url(images/home/bgf2.jpg) no-repeat center;"><a
				href="#"></a></li>
			<li style="background: url(images/home/bgf3.jpg) no-repeat center;"><a
				href="#"></a></li>
		</ul>

		<div class="w_auto">
			<div class="clearfix"></div>
			<div id="num" class="point"></div>
		</div>
	</div>

	<div class="w1201">
		<a name="a01"></a>
		<div class="idx01">
			<div class="rollBox">
				<dl>
					<dt>
						<b>今日特价</b><span>就是实惠</span>

					</dt>
					<dd id="ind_zrg_ixd">
						<div class="Cont" id="ISL_Cont">
							<div class="ScrCont">
									<ul id="zrg_ixd"></ul>
							</div>
						</div>
					</dd>
				</dl>
			</div>
		</div>

		
     <div class="idx02" id="idx04">
    	<dl>
        	<dt>热销产品</dt>
            <dd id="zrg_new_flower">
          <!--      <div class="item">
                	<a href="#" class="title">Apple/苹果ipad mini2 32GB银7.9英寸平板电脑</a>
                    <p><font>￥</font>2658.<font>00</font></p>
                    <a href="#" class="buy"></a>
                    <img src="images/img/img24.jpg"/>
                </div>
                 -->
               
              
            </dd>
        </dl>
    </div>

		<!--footer-->
		<div class="footer">
			<div class="f_bz">
				<div class="w1200">
					<dl class="dl01">
						<dt>正品保证</dt>
						<dd>正品护航 购物无忧</dd>
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
							<a href="#">注册新用户</a> <a href="#">商品订购流程</a> <a href="#">会员注册协议</a>
						</dd>
					</dl>
					<dl>
						<dt>付款方式</dt>
						<dd>
							<a href="#">支付宝支付</a> <a href="#">网上银行支付</a> <a href="#">货到付款</a>
						</dd>
					</dl>
					<dl>
						<dt>常见问题</dt>
						<dd>
							<a href="#">订单状态</a> <a href="#">发票说明</a>
						</dd>
					</dl>
					<dl>
						<dt>售后服务</dt>
						<dd>
							<a href="#">退换货政策</a> <a href="#">退换货流程</a> <a href="#">退款说明</a>
							<a href="#">退换货申请</a>
						</dd>
					</dl>
					<dl>
						<dt>客服中心</dt>
						<dd>
							<a href="#">常见问题</a> <a href="#">联系客服</a> <a href="#">投诉与建议</a>
						</dd>
					</dl>
					<div class="ewm">
						<img src="images/home/ico35.png" />
					</div>
					<div class="ewm">
						<img src="images/home/ico38.png" />
					</div>
					<div class="clear"></div>
				</div>
			</div>

		</div>
</body>
</html>
