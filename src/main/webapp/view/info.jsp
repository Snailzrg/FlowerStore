<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>提交订单信息</title>


<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js" type="text/javascript"></script>

</head>
<body class="index">

	<div class="top_ad">
		<div class="w1200">
			
		</div>
	</div>

	购物信息页面${buyCar.size()};
	<div class="top">
		<div class="w1200">
			<div class="left">
				您好，欢迎光临鲜花客！
				
				 <c:if test="${User==null}">
				<a href="view/login.jsp">[登录]</a>
				</c:if>
				<a href="view/reg.jsp">[注册]</a>
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
			</div>

			<div class="search">
				<form action="${APP_PATH }/showFlowers" class="form">
					<input type="text" value="请输入关键字" name="keyword" class="txt"
						onfocus="if(value=='请输入关键字') {value=''}"
						onblur="if(value=='') {value='请输入关键字'}" /> <input type="submit"
						value="搜索" class="sub" />
				</form>
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
			<a href="#">首页</a> > <a href="#">购物车</a>
		</div>

		<div class="shopcar">
			<div class="info_lc">
				<span class="sp01">我的购物车</span><span class="sp02">填写提交信息表单</span><span
					class="sp03">在线支付</span>
			</div>

			<dl class="info">
				<dt>
					<span>确认收货地址</span>
				</dt>

				<dd>
					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						id="userAdress_table">
						<thead>
							<tr class="tr_t">
								<td width="4%">选择</td>
								<td width="38%">地址</td>
								<td width="20%">收货人</td>
								<td width="20%">电话</td>
								<td width="18%">操作</td>
							</tr>
						</thead>

						<tbody style="text-align: center;" id="zrg_usid">
						</tbody>

					</table>
				</dd>

				<dd>
					<div class="item">
						<span><font>*</font>所在地区：</span><select><option
								value="湖南省">湖南省</option></select><select><option value="长沙市">长沙市</option></select>
								<select id="area-zrg" name="area-zrg">
								<option value="芙蓉区">芙蓉区</option>
								<option value="天心区">天心区</option>
								<option value="岳麓区">岳麓区</option>
								<option value="开福区">开福区</option>
								<option value="雨花区">雨花区</option>
								<option value="望城区">望城区</option>
								<option value="长沙县">长沙县</option>
								</select>
							<!-- 芙蓉区、天心区、岳麓区、开福区、雨花区、望城区、长沙县、宁乡县、浏阳市 -->
					</div>
					<div class="item">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8%"><span><font>*</font>详细地址：</span></td>
								<td width="92%"><textarea id="detail_area"></textarea></td>
							</tr>
						</table>
					</div>
					<div class="item">
						<span><font>*</font>收货人姓名：</span><input type="tex" id="recevname" class="txt" />
					</div>
					<div class="item">
						<span><font>*</font>手机：</span><input type="tex" id="phone" class="txt" />
					</div>
					<div class="item">
						<input type="button" id="save_rec" class="sub" value="保存收货人信息" />
					</div>
				</dd>
			</dl>

			<dl>
				<dt>
					<span>确认订单信息</span>
				</dt>
				<dd>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr class="tr_t">
							<td width="2%">&nbsp;</td>
							<td width="48%">商品</td>
							<td width="25%">单价</td>
							<td width="13%">数量</td>
							<td width="12%">小计</td>
						</tr>

						<c:forEach items="${buyCar }" var="shopcar">
							<tr class="tr_c">
								<td>&nbsp;</td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="15%"><img
												src="${APP_PATH }/${shopcar.getFlower().getFimg()}" /></td>
											<td width="85%"><a href="#" class="title">${shopcar.flower.fname }</a></td>
										</tr>
									</table>
								</td>
								<td class="price">￥${shopcar.flower.price }</td>
								<td>${shopcar.count }</td>
								<td class="price">￥${shopcar.fprice }</td>
							</tr>
						</c:forEach>

						<tr class="tr_d">
							<td colspan="7">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td width="3%">&nbsp;</td>
										<td width="6%">买家留言：</td>
										<td width="75%"><input type="text" id="zrg_leaveMsg"
											value="来给本店留言吧" class="msg" /></td>
										<td width="6%">应付金额：</td>
										<td width="10%" class="all_price"><font>￥${countMoney }</font></td>
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
					<td width="20%"><button id="zrg_quxiao" class="go_buy">取消
						</button></td>
					<td width="63%">&nbsp;</td>
					<td width="17%" align="right"><button id="zrg_buy"
							class="code">购 买</button></td>
				</tr>
			</table>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript">
$(document).ready(function(){
	//这里 后面添加地址表...
	getAllAdress();
});

 
function getAllAdress(){
	if(checkUser()){
	$.ajax({
		url : "${APP_PATH}/getAllAdress",
		type : "GET",
		success : function(result) {
		if(result.code==100){
			//綁定數據
			bindData(result);
		}
		
		}
	});	
}}

/**
 * 数据bind
 */
function bindData(result){
	var adresss=result.extend.userAdress;
	$("#userAdress_table tbody").empty();
	$.each(adresss, function(index, item) {
		//userAdress_table
		var rdo=$("<input type='radio' name='radio' checked='checked' value="+item.adid+" class=''/>'");
		var td1=$("<td width='4%'></td>").append(rdo);
		var td2=$('<td width="38%"></td>').append(item.adress);
		var td3=$('<td  width="20%"></td>').append(item.recevname);
		var td4=$('<td  width="20%" ></td>').append(item.recevphone);
		var btn=$('<button></button>').addClass("del_btn").append("删除");
		     btn.attr("delet-id", item.adid);
		var td5=$('<td  width="18%">').append(btn);
		
		$('<tr class="tr_t"></tr>').append(td1).append(td2)
		.append(td3).append(td4).append(td5).appendTo("#userAdress_table tbody");
	});
}




//保存收貨地址..
$("#save_rec").click(function(){
	alert("新增收货地址");
	var area = $('#area-zrg').children('option:selected').val();//这就是selected的值 
	var detail_area=$("#detail_area").val();
	var phone=$("#phone").val();
	var recevname=$("#recevname").val();
    area="湖南省长沙市"+area+detail_area;
	 if(!(detail_area==""||phone==""||recevname=="")){
		 $.ajax({
				url : "${APP_PATH}/addUserAdress",
				type : "GET",
				data: {"recevName":recevname,"recevPhone" : phone,"adress":area},
				success : function(result) {
					console.log(result);					
					if(result.code==100){
						//綁定數據
						getAllAdress();
					}
				}
			}); 
	} 
}); 

$(document).on("click",".del_btn",function(){
	//1、弹出是否确认删除对话框
	var adid = $(this).attr("delet-id");
	alert("adid:"+adid);
	if(confirm("确认删除该条地址吗？")){
		//确认，发送ajax请求删除即可
	    $.ajax({
			url:"${APP_PATH}/deletAllAdress",
			type:"GET",
			data:"adid="+adid,
			success : function(result) {
				if (result.code == 200) {
					
				} else {
					//回到本页
				getAllAdress();
				}
			}
		});  
   } 
});




//结算 生成订单..
$("#zrg_buy").click(function(){	
	//结算 收货地址 rodio 就是那个地址的id
	var adid = $("#zrg_usid input[name='radio']:checked").val();
    var note=$("#zrg_leaveMsg").val();
	$.ajax({
		url : "${APP_PATH}/balance",
		type : "GET",
		data:{"adid":adid,"note":note},
		success : function(result) {
			if(result.code==100){
				window.location.href = "payply.jsp";
			}
		}
	}); 
	
});

//先检查是否登录，是 就拿数据 否则 就直接跳转到登录页
function checkUser() {
	$.ajax({
		url : "${APP_PATH}/checkUserFromSession",
		type : "GET",
		success : function(result) {
			console.log(result);

			if (result.code == 200) {
				alert('很抱歉 您尚未登录哟...');
				window.location.href = "login.jsp";
				return false;
			}
		}
	});
	return true;
}
</script>
	<!--footer-->

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
