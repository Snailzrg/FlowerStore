<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品列表</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js" type="text/javascript"></script>
</head>
</head>
<body class="index">
	<div class="top_ad">
		<div class="w1200">
			<a href="#" id="close"></a>
		</div>
	</div>

	关键字${keyword}
	</br> ${pageInfo.pages}; 这个用户${User};

	<div class="top">
		<div class="w1200">
			<div class="left">
				您好，欢迎光临易易城！<a href="${APP_PATH }/view/login.jsp">[登录]</a> <a
					href="reg.jsp">[注册]</a>
			</div>
			<div class="right">
				<a href="#">我的会员中心</a>|<a href="#">收藏夹</a>|<a href="#">服务中心</a>|<a
					href="#">在线客服</a>|<a href="#">购物车<b>0</b>件
				</a>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="head">
		<div class="w1200">
			<div class="logo">
				<a href="#"></a>
			</div>
			<div class="search">
				<form action="${APP_PATH }/showFlowers" class="form">
					<input type="text" value="请输入关键字" name="keyword" class="txt"
						onfocus="if(value=='请输入关键字') {value=''}"
						onblur="if(value=='') {value='请输入关键字'}" /> <input type="submit"
						value="搜索" class="sub" />
				</form>
				<p>
					<a href="${APP_PATH }/birth">生日</a>|<a href="${APP_PATH }/wedding">婚礼</a>|<a
						href="${APP_PATH }/blessing">祝福</a>| <a href="${APP_PATH }/love">爱意表达</a>|<a
						href="${APP_PATH }/friendShop">友情</a>|<a
						href="${APP_PATH }/yearMemory">周年纪念</a>
				</p>
			</div>
			<div class="s_r">
				<dl>
					<dt>
						<p>
							购物车<span>0</span>
						</p>
					</dt>
					<dd>
						客服电话：<b>400-0139-038</b>
					</dd>
				</dl>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	<div class="menu">
		<div class="w1200">

			<div class="item">
				<a href="#" class="home">商城首页</a>
			</div>
			<div class="item">
				<a href="#">易易特色</a>
			</div>
			<div class="item">
				<a href="#">热销产品</a>
			</div>
			<div class="item">
				<a href="#">新品上市</a>
			</div>
			<div class="item">
				<a href="#">精品推荐</a>
			</div>
			<div class="item">
				<a href="#">生活服务</a>
			</div>
		</div>
	</div>

	<div class="w1200">
		<div class="position">
			<a href="#">首页</a> > <a href="#">这可是鲜花啊</a>
		</div>


		<div class="order">
			<a href="#" class="cur">综合排序</a><a href="#">销量</a><a href="#">价格</a><a
				href="#">评论数</a><span><font>共1889件商品 <strong><b>1</b>/50</strong></font><a
				href="#">></a><a href="#"><</a></span>
			<div class="clear"></div>
		</div>

		<div class="pro_cont">

			<c:forEach items="${pageInfo.list }" var="flower">
				<div class="item">
					<dl>
						<dt>
							<img src="${flower.fimg }" />
						</dt>
						<dd>
							<img class="on" src="${flower.fimg }" /><img
								src="images/img/img40.jpg" /><img src="images/img/img39.jpg" />
						</dd>
					</dl>
					<p class="p01">
						<font>￥</font>${flower.price }</font>
					</p>
					<p class="p02">
						<a href="${APP_PATH }/detail?fid=${flower.fid}">${flower.fname }</a>
					</p>
				</div>

			</c:forEach>
			<div class="clear"></div>
		</div>
		<div class="page">

			<c:if test="${pageInfo.hasPreviousPage }">
				<a
					href="${APP_PATH}/showFlowers?pn=${pageInfo.pageNum-1}&&keyword=${keyword}"
					class="pre">上一页</a>
			</c:if>
			<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
				<c:if test="${page_Num == pageInfo.pageNum }">
					<a
						href="${APP_PATH }/showFlowers?pn=${page_Num }&&keyword=${keyword}"
						class="on">${page_Num }</a>
				</c:if>
				<c:if test="${page_Num != pageInfo.pageNum }">
					<a
						href="${APP_PATH }/showFlowers?pn=${page_Num }&&keyword=${keyword}">${page_Num }</a>
				</c:if>

			</c:forEach>
			..

			<c:if test="${pageInfo.hasNextPage }">
				<a
					href="${APP_PATH }/showFlowers?pn=${pageInfo.pageNum+1}&&keyword=${keyword}"
					class="next">下一页</a>
			</c:if>

			共${pageInfo.pages}页
			<!-- 到第<input type="text" value="1" />页 <a href="#" class="sub">确定</a> -->
		</div>

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
			<div class="w1200"></div>
		</div>
		<div class="w1200"></div>
	</div>


</body>
</html>
