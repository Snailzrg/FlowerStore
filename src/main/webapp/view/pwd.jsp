<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改密码</title>


<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js"  type="text/javascript"></script>

<script type="text/javascript" >
	$(function() {
	
		$("#submit_btn").click(function(){
			var pwd=$("input[name='upwd']").val(); 
			var newupwd1=$("input[name='newupwd1']").val(); 
			var newupwd2=$("input[name='newupwd2']").val();
			//简单规则.....限制输入长度未做
			alert(!(pwd==""||newupwd1==""||newupwd2==""));
			 if((!(pwd==""||newupwd1==""||newupwd2==""))){
				if(newupwd1==newupwd2){
					$.ajax({
						url : "${APP_PATH}/updatePwd",
						data :{"upwd":pwd,"newPwd":newupwd1},
						type : "get",
						success : function(result) {
							if (result.code == 100) {
								alert("修改成功");
								windows.location.href="login.jsp";
							} else {
								alert("修改shibai1");
							}
						}
					});
				}
			} 
			});
	});
/**
 * 用户检查
 */
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

</head>
<body class="index">
<div class="top_ad"><div class="w1200"><a href="#" id="close"></a></div></div>
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
    	<div class="logo"><a href="#"></a></div>
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
            	<dt><p>购物车<span></span></p></dt>
                <dd>客服电话：<b>123-4567-890</b></dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>

<div class="menu">
	
</div>

<div class="w1200">
	<div class="position"><a href="index.jsp">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a></div>
    
    <div class="m_d">
    	<div class="left">
        	<dl><dt>账户管理</dt>
          <dd>
            	<a href="member.jsp" >个人资料</a>
                <a href="pwd.jsp" class="on">修改密码</a>
                <a href="OrderManage.jsp">订单管理</a>
                <a href="AdressManage.jsp">地址管理</a>
                <a href="ShopCarManage.jsp">购物车管理</a>
            </dd>
            </dl>
         
        </div>
        <div class="right">
        	
            <dl class="dl02">
            	<dt>
                	<span>修改密码</span>
                </dt>
                <dd>
                	<div class="item"><span><font>*</font>原密码：</span><input type="password" name="upwd" class="txt"/></div>
                    <div class="item"><span><font>*</font>新密码：</span><input type="password" name="newupwd1" class="txt"/></div>
                    <div class="item"><span><font>*</font>确认密码：</span><input type="password" name="newupwd2" class="txt"/></div>
                    <div class="item"><input type="button" id="submit_btn" class="sub" value="确认修改"/></div>
                </dd>
            </dl>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
