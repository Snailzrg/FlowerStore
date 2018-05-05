<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购物车</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
	 $(function() {
		getDate();
	});

	//获得该用户的所有的购物车的数据  按照时间排序 就是按照id排序..生成的顺序//分页？
	function getDate() {
		if (checkUser()) {
			$.ajax({
				url : "${APP_PATH}/getMyShopCar",
				type : "GET",
				success : function(result) {
					if(result.code == 100){
						show_gwcr(result);
					}
				}
			});
		}
	}

	
	//数据展示...

	function show_gwcr(result) {
		var price=0;
		var shopCarList = result.extend.shopCarList;
		var str = "";  //另外一种插入方式
		$.each(shopCarList, function(index, item) {
		//最笨的办法 拼接字符串 
        str+="<tr class='tr_c'>"+"<td><input type='checkbox' checked='checked' onchange='checkSelect("+item.gid+")' name='items' /></td>"
           +"<td colspan='2'> <table width='100%' border='0' cellspacing='0' cellpadding='0'>"
           +" <tr><td width='5%'><img src='../images/ico23.jpg' /></td><td width='35%'> <a href='#' class='title'>"+item.fname+"</a></td></tr></table></td>"
           +"<td class='price'>￥"+item.fmoney+"</td>"
		   +"<td><span class='jian' onclick='jian("+item.gid+",index)'>-</span><input type='text' name='g_count',id=g_count"+index+" value="+item.count+" /><span class='jia' onclick='jia("+item.gid+")'>+</span></td>"
		   +"<td class='price'>￥"+item.fprice+"</td>"
		   +"<td><a href='#'>删除</a></td>"
		   price+=item.fprice;
		});
		
		var f1_tr= "<tr class='tr_t' id='f1_tr'>"+$("#f1_tr").html()+"</tr>";
		var f2_tr= "<tr class='tr_d' id='f2_tr'>"+$("#f2_tr").html()+"</tr>";
		alert('见证奇迹的时刻'+$("#ft_money").text());
	 //	$("#cmoney").html(price)
	 //   $("#ft_money").val(price);
	   
	 // $("ft_money").attr("value",price);
	
	   str=f1_tr+str+f2_tr;
		$("#shopCar_table").html(str);
	}
	
	// 先检查是否登录，是 就拿数据 否则 就直接跳转到登录页
	function checkUser() {
		$.ajax({
			url : "${APP_PATH}/checkUserFromSession",
			type : "GET",
			success : function(result) {
				console.log(result);

				if (result.code == 200) {
					alert('很抱歉 您尚未登录哟...');
					window.location.href="login.jsp";
					return false;
				}
			}
		});
		return true;
	} 
	

	function checkSelect(gid){
		
		alert(gid);
		
		
	}
	
	function jia(gid,index){

		var tt=document.getElementById("g_count6");
		alert(tt);
		alert("周瑞刚3"+$("#g_count6").val());
		alert("zrg"+$("#g_count").text());
	}
	
	function jian(gid){
		alert(gid+"-");
	}
	
	
	/* 	$("#checkedAll_2").click(function(){
			alert(123456789);
			var flag = this.checked;
			$(":checkbox[name='items']").attr("checked", flag);
		});
		
		$(":checkbox[name='items']").click(function(){
			$("#checkedAll_2").attr("checked", 
					$(":checkbox[name='items']").length == 
						$(":checkbox[name='items']:checked").length)
		});
	 */
</script>
<body class="index">
	这个用户${User};
	<div class="top_ad">
		<div class="w1200">
			<a href="#" id="close"></a>
		</div>
	</div>

	<div class="top">
		<div class="w1200">
			<div class="left">
				您好，欢迎光临易易城！<a href="#">[登录]</a> <a href="#">[注册]</a>
			</div>
			<div class="right">
				<a href="#">我的会员中心</a>|<a href="#">收藏夹</a>|<a href="#">服务中心</a>|<a
					href="#">在线客服</a>|<a href="#">购物车<b></b>
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
					<input type="text" value="请输入关键字" name="keyword" class="txt" id="1234567"
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
			<a href="#">首页</a> > <a href="#">购物车</a>
		</div>

		<div class="shopcar">
			<div class="shop_lc">
				<span class="sp01">我的购物车</span><span class="sp02">填写提交信息表单</span><span
					class="sp03">在线支付</span>
			</div>
			<dl>
				<dt>
					<span>我的购物车</span>
				</dt>
				<dd>
					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						id="shopCar_table">
						<tr class="tr_t" id="f1_tr">
							<td width="4%"><input type="checkbox" id="checkedAll_2" /></td>
							<td width="4%">全选</td>
							<td width="35%">商品</td>
							<td width="26%">单价</td>
							<td width="6%">数量</td>
							<td width="14%">小计</td>
							<td width="11%">操作</td>
						</tr>

						<!-- 插入数据 -->

						<tr class="tr_d" id="f2_tr">
							<td colspan="7">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="34%"><span class="del"><a href="#">删除选中商品</a></span></td>
										<td width="35%"><span> <a href="#"> </a>&nbsp;&nbsp;
												<a href="#">上一页</a>&nbsp;&nbsp; <a href="#">下一页</a>&nbsp;&nbsp;
												<a href="#">末页</a>&nbsp;&nbsp;
										</span></td>

										<td width="11%">已选商品 <strong>1</strong> 件
										</td>

										<td width="14%" class="all_price" id="all_price">合计：<font id="ft_money">￥3083.00</font></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<div class="clear"></div>
				</dd>
			</dl>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="go_tb">
				<tr>
					<td width="20%"><a href="${APP_PATH }/showFlowers"
						class="go_buy">继续购物</a></td>
					<td width="63%">&nbsp;</td>
					<td width="17%" align="right"><a href="#" class="code">结 算</a></td>
				</tr>
			</table>
			<div class="clear"></div>
		</div>
	</div>

	<div class="w1200">
		<div class="bottom">
			<a href="#">关于我们</a>|<a href="#">帮助中心</a>|<a href="#">法律声明</a>|<a
				href="#">用户协议</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a
				href="#">站点地图</a>

			<p>
				网络文化经营许可证：粤网文[2015]0295-065号<br />© 2015 深圳易易城科技网络有限公司.
				粤ICP备15042543号
			</p>
			<p class="p02">
				<img src="images/home/ico25.jpg" /><img src="images/home/ico26.jpg" /><img
					src="images/home/ico27.jpg" /><img src="images/home/ico36.jpg" /><img
					src="images/home/ico37.jpg" />
			</p>
		</div>
	</div>

</body>
</html>
