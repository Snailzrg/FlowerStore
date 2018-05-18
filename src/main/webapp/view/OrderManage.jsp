<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单管理</title>
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
	
	getMyOrders()
});

function getMyOrders(){
	$.ajax({
		url : "${APP_PATH}/getMyOrders",
		type : "GET",
		success : function(result) {
			console.log(result);
			if (result.code == 200) {
				alert("error");
			} else {
				alert("success");
				show(result);
			}

		}
	});
	
}


function show(result){
	var myOrderList=result.extend.pageInfo.list;
	$.each(myOrderList,function(index, item) {
		var th=$('<th scope="row" abbr="L2 Cache" class="specalt"></th>').append(index);
		var td1=$('<td class="alt"></td>').append(item.odate);
		var td2=$('<td class="alt"></td>').append(item.oprice);
		var btnTd=null;
		var state = "代发货"
		if (item.state == 1) {
			state = "代发货"
			var quxiao_btn = $("<button></button>").addClass("btn btn-danger btn-sm quxiao_btn").append($("<span></span>")
					.addClass("glyphicon glyphicon-trash")).append("取消");
			quxiao_btn.attr("del-id", item.oid);
			 btnTd = $("<td></td>").append(quxiao_btn);
		}
		if (item.state == 2) {
			state = "已完成"
				var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")
						.addClass("glyphicon glyphicon-trash")).append("删除");
				delBtn.attr("del-id", item.oid);
				 btnTd = $("<td></td>").append(delBtn);
		}
		
		var td3=$('<td class="alt"></td>').append(state);

		var td4=$('<td class="alt"></td>').append(item.oadress);
		
		var td5=$('<td class="alt"></td>').append(btnTd);
		$("<tr></tr>").append(th).append(td1).append(td2).append(td3).append(td4).append(td5).appendTo("#mytable tbody");
			});
}


/**/
 
		$(document).on("click",".quxiao_btn",function(){
			alert("12.."+$(this).attr("del-id"));
			updateOrder($(this).attr("del-id"),0,1);
		});
		
		
		$(document).on("click",".delete_btn",function(){
			alert("13.."+$(this).attr("del-id"));
			updateOrder($(this).attr("del-id"),0,0);
		});
		
		function updateOrder(oid,parmas,isquxiao){
			$.ajax({
				url : "../updateForder",
				type : "get",
				data : {
					"oid" : oid,
					"parmas" : parmas,
					"isquxiao":isquxiao
				},
				success : function(result) {
					if (result.code == 200) {
						alert("error");
					} else {
						alert("ok");
						 show_order(thispage, 0);
					}
				}
		});
}
 
</script>

<body class="index">
	<div class="top_ad">
		<div class="w1200">
		</div>
	</div>
	<div class="top">
		<div class="w1200">
			<div class="left">
				您好，欢迎光临鲜花客！
				
				 <c:if test="${User==null}">
				<a href="login.jsp">[登录]</a>
				</c:if>
				<a href="reg.jsp">[注册]</a>
				<c:if test="${User!=null}">
				<a href="${APP_PATH }/dissLord">[注销]</a>
				</c:if>
			</div>
			<div class="right">
				<a href="member.jsp">我的会员中心</a>|<a href="shopcar.jsp">购物车<b></b>
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
			<p>
					<a href="${APP_PATH }/showFlowers?&&ftid=2">生日</a>|<a href="${APP_PATH }/showFlowers?&&ftid=3">婚礼</a>|<a href="${APP_PATH }/showFlowers?&&ftid=4">祝福</a>|
						<a href="${APP_PATH }/showFlowers?&&ftid=6">友情</a>|<a href="${APP_PATH }/showFlowers?&&ftid=6">周年纪念</a>
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
						客服电话：<b>123-4567-890</b>
					</dd>
				</dl>
			</div>
			<div class="clear"></div>
		</div>
	</div>

	

	<div class="w1200">
		<div class="position">
			<a href="#">首页</a> > <a href="#">会员中心</a> > <a href="#">我的订单</a>
		</div>

		<div class="m_d">
			<div class="left">
				<dl>
					<dt>账户管理</dt>
					<dd>
						<a href="member.jsp">个人资料</a> <a href="pwd.jsp">修改密码</a> <a
							href="OrderManage.jsp" class="on">订单管理</a> <a
							href="AdressManage.jsp">地址管理</a> <a href="ShopCarManage.jsp">购物车管理</a>
					</dd>
				</dl>

			</div>
			<div class="right">
				<dl class="dl02">
					<dt>
						<span>我的订单</span>
					</dt>
					<table id="mytable" cellspacing="0" summary="The technical specifications of the Apple PowerMac G5 series">
						<thread>
						<tr>
							<th scope="col" abbr="Configurations" class="nobg">订单编号</th>
							<th scope="col" abbr="Dual 2">时间</th>
							<th scope="col" abbr="Dual 2.5">价格</th>
							<th scope="col" abbr="Dual 2.5">状态</th>
							<th scope="col" abbr="Dual 2.5">留言</th>
							<th scope="col" abbr="Dual 2.5">操作</th>
						</tr>
						</thread>

					</table>
				</dl>
			</div>
			<div class="clear"></div>
		</div>
	</div>


	<style type="text/css">
/* CSS Document */
body {
	font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica,
		sans-serif;
	color: #4f6b72;
	background: #E6EAE9;
}

a {
	color: #c75f3e;
}

#mytable {
	width: 700px;
	padding: 0;
	margin: 0;
}

caption {
	padding: 0 0 5px 0;
	width: 700px;
	font: italic 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	text-align: right;
}

th {
	font: bold 11px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #4f6b72;
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	border-top: 1px solid #C1DAD7;
	letter-spacing: 2px;
	text-transform: uppercase;
	text-align: left;
	padding: 6px 6px 6px 12px;
	background: #CAE8EA url(images/bg_header.jpg) no-repeat;
}

th.nobg {
	border-top: 0;
	border-left: 0;
	border-right: 1px solid #C1DAD7;
	background: none;
}

td {
	border-right: 1px solid #C1DAD7;
	border-bottom: 1px solid #C1DAD7;
	background: #fff;
	font-size: 11px;
	padding: 6px 6px 6px 12px;
	color: #4f6b72;
}

td.alt {
	background: #F5FAFA;
	color: #797268;
}

th.spec {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #fff url(images/bullet1.gif) no-repeat;
	font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
}

th.specalt {
	border-left: 1px solid #C1DAD7;
	border-top: 0;
	background: #f5fafa url(images/bullet2.gif) no-repeat;
	font: bold 10px "Trebuchet MS", Verdana, Arial, Helvetica, sans-serif;
	color: #797268;
}
/*---------for IE 5.x bug*/
html>body td {
	font-size: 11px;
}
</style>

<div class="footer">
	<div class="f_bz">
    	<div class="w1200">
            <dl class="dl01">
                <dt>正品保证</dt>
                <dd>现摘鲜花 小鲜肉哟</dd>
            </dl>
            <dl class="dl02">
                <dt>你消费 自己买单</dt>
                <dd>除非长得帅 免单</dd>
            </dl>
            <dl class="dl03">
                <dt>品类丰富</dt>
                <dd>品类齐全 轻松购物</dd>
            </dl>
            <dl class="dl04">
                <dt>立足长沙</dt>
                <dd>为您呈现最鲜的鲜花</dd>
            </dl>
            <div class="clear"></div>
        </div>
    </div>
    </div>
</body>
</html>
