<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品详情</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js" type="text/javascript"></script>
<!-- <SCRIPT LANGUAGE="JavaScript">
 Hide
function killErrors() {
return true;
}


</SCRIPT> -->
</head>


<body class="index">

	<div class="top_ad">
		<div class="w1200">
			<a href="#" id="close"></a>
		</div>
	</div>

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
					<a href="${APP_PATH }/showFlowers?&&ftid=2">生日</a>|<a href="${APP_PATH }/showFlowers?&&ftid=3">婚礼</a>|<a href="${APP_PATH }/showFlowers?&&ftid=4">祝福</a>|
						<a href="${APP_PATH }/showFlowers?&&ftid=6">友情</a>|<a href="${APP_PATH }/showFlowers?&&ftid=6">周年纪念</a>
				</p>
			</div>
			<div class="s_r">
				<dl>
					<dt>
						<p>
							购物车<span></span>
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


	<div class="w1200 product">
		<div class="position">
			<a href="#">首页</a> > <a href="#">商品信息</a>
		</div>

		<link rel="stylesheet" href="css/detail.css" type="text/css" />
		<script src="js/jquery-1.5.1.js" type="text/javascript"></script>
		<script src="js/jquery.jqzoom.js" type="text/javascript"></script>
		<script src="js/use_jqzoom.js" type="text/javascript"></script>

		<script src="js/jquery.livequery.js" type="text/javascript"></script>
		<script src="js/switchImg.js" type="text/javascript"></script>
		<!--one-->
		<div class="one">
			<div class="left">
				<!--放大镜-->
				<div class="pro_detail">
					<div class="pro_detail_left">
						<div class="jqzoom">
							<img src="${Flower.fimg}" class="fs" alt=""
								jqimg="images/pro.jpg" id="bigImg" />
						</div>
						<span>
							<ul class="imgList">
								<li class="on"><img src="${Flower.fimg}" alt="" /></li>
								<li><img src="${Flower.fimg}" alt="" /></li>
								<li><img src="${Flower.fimg}" alt="" /></li>
								<li><img src="${Flower.fimg}" alt="" /></li>
								<li><img src="${Flower.fimg}" alt="" /></li>
								<li class="last"><img src="${Flower.fimg}" alt="" /></li>
							</ul>
						</span>
					</div>
				</div>
				<!--放大镜-->
			</div>
			<div class="right">
				<div class="title">${Flower.fname}</div>
				<div class="info">${Flower.fdetil}</div>

				<div class="price">
					<table width="100%" height="61" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="8%">售价：</td>
							<td width="41%"><b>${Flower.price}0</b></td>
						</tr>
					</table>
				</div>
				<div class="number">
					<small>数量：</small><input type="text" class="num" value=1
						onblur="check_quality(${Flower.count})" id="quantity" /><span
						class="jian" onclick="numAdd(${Flower.count})"></span><span
						class="jia" onclick="numDec(${Flower.count})"></span>
					<div class="ku">
						<p>库存&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${Flower.count}件</p>
					</div>
					<div class="clear"></div>
				</div>
				<!-- <div class="sale"><small>销量：</small><span class="on">21212</span><div class="clear"></div></div>
                   <div class="sub"><a class="btn01" id="btn01"></a>  <a  class="btn02" /></div> -->
				<div class="sub">
					<a class="btn01"
						onclick="goumai(${Flower.count},${Flower.fid},${User==null})"
						id="btn01" /> <a class="btn02"
						onclick="gowucar(${Flower.count},${Flower.fid},${User==null})"
						id="btn01" />
				</div>

			</div>
			<div class="clear"></div>
		</div>



		<!--two-->
		<div class="two">
			<div class="left">
				<dl>
					<dt>今日推荐</dt>
					<dd>
						<div class="item">
							<ul>
								<li><img src="images/ico36.jpg" width="160" height="160" /></li>
								<li class="title"><a href="#">西铁城citizen石英表</a></li>
								<li class="price">￥6542.00</li>
							</ul>
						</div>
					</dd>
				</dl>
			</div>
			<div class="right">
				<div class="shenmin">
					<p>
						<b>安全提示：</b>交易中请勿使用阿里旺旺以外的聊天工具沟通，不要接收可疑文件和不要点击不明来源的链接，支付前核实好域名和支付详情。
						淘宝不会以订单有问题，让您提供任何银行卡、密码、手机验证码！遇此情况请终止通话或举报到淘宝网 常见骗术<br />推荐安全软件：
						阿里钱盾阿里钱盾 UC浏览器UC浏览器 腾讯电脑管家腾讯电脑管家 360网盾360网盾 安全软件中心
					</p>

					<p>
						<b>内容申明：</b>淘宝为第三方交易平台及互联网信息服务提供者，淘宝（含网站、客户端等）所展示的商品/服务的标题、价格、详情等信息内容系由店铺经营者发布，其真实性、准确性和合法性均由店铺经营者负责。淘宝提醒用户购买商品/服务前注意谨慎核实。如用户对商品/服务的标题、价格、详情等任何信息有任何疑问的，请在购买前通过阿里旺旺与店铺经营者沟通确认；淘宝存在海量店铺，如用户发现店铺内有任何违法/侵权信息，请立即向淘宝举报并提供有效线索。
					</p>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>

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
    
</div>

	<script type="text/javascript">
  $(function(){
  var imgWid = 0 ;
  var imgHei = 0 ; //变量初始化
  var big = 6.2;//放大倍数
  $(".pj_item .two2 p img").hover(function(){
  $(this).stop(true,true);
  var imgWid2 = 0;var imgHei2 = 0;//局部变量
  imgWid = $(this).width();
  imgHei = $(this).height();
  imgWid2 = imgWid * big;
  imgHei2 = imgHei * big;
  $(this).css({"z-index":2,"position":"relative"});
  $(this).animate({"width":imgWid2,"height":imgHei2,"margin-left":-imgWid2/3,"margin-top":-imgWid2/3});
  },function(){$(this).stop().animate({"width":imgWid,"height":imgHei,"margin-left":0,"margin-top":0,"z-index":1});
  });
})

//直接跳转到购买的页面 不用到 购物车哪一步
function goumai(count,fid,user){
	  alert(count)
	 if(count<=0){	
		return fasle;
	}
    var quantity = parseInt($("#quantity").val());	
	if(user){
		window.location.href="view/login.jsp";
		return false;
	}
	$.ajax({
		url : "${APP_PATH}/buyOne",
		type : "GET",
		data :{"fid":fid,'fcount':quantity},
        success : function(result) {
	    console.log(result);					
	    window.location.href="view/info.jsp";
		     } 
		});
	
	//alert(count);
};

//ajax 請求

/* function show_XPflower() {
			$.ajax({
			url : "${APP_PATH}/vaildeat",
			type : "GET",
			success : function(result) {
		    console.log(result);					
			show_newFlower(result);
			     }
			});
	}
			 */	
				
	function gowucar(count,fid,user){
	if(user){
		window.location.href="view/login.jsp";
		return false;
	}
    var quantity = parseInt($("#quantity").val());	
    alert('加入购物车');
	$.ajax({
		url : "${APP_PATH}/addGowucar",
		type : "GET",
		data :{"fid":fid,'fcount':quantity},
		success : function(result) {
	    console.log(result);					
	//加入購物車 成功后 就請求獲得所有的购物车内容 默认按照时间排序
	
	 if(result.code==100){
		 window.location.href="view/shopcar.jsp";
	}
		     } 
		});
	
}	
/*检查数量输入合法*/
function check_quality(count){
	 var quantity = parseInt($("#quantity").val());  
	var vaid = /^[1-9]\d*$/;
	 if (!vaid.test(quantity)) {
		$("#quantity").val('1');
		return false;
	}
	if(quantity>count){
		$("#quantity").val(count);
		
	} 
	
}	


/*商品数量+1*/  
function numAdd(count){  
    var num_add = parseInt($("#quantity").val())+1;  
    if(num_add>count){
    	 $("#quantity").val(count); 
    	 return false;
    }
    if($("#quantity").val()==""){  
        num_add = 1;  
    }  
    $("#quantity").val(num_add);  
    var total = parseFloat($("#price").val())*parseInt($("#quantity").val());  
    $("#totalPrice").html(total.toFixed(2));  
}  
  
/*商品数量-1*/  
function numDec(){  
    var num_dec = parseInt($("#quantity").val())-1;  
    if(num_dec<1){  
        //购买数量必须大于或等于1  
    }else{  
        $("#quantity").val(num_dec);  
        var total = parseFloat($("#price").val())*parseInt($("#quantity").val());  
        $("#totalPrice").html(total.toFixed(2));  
    }  
}  
</script>
</body>
</html>
