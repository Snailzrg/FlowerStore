<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登陆</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
</head>
<body class="member">
	<div class="w1185">
		<div class="logo">
			<a href="#"></a>
		</div>
		<div class="font-d">欢迎登陆</div>

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
			<img src="${APP_PATH }/images/tel.jpg" />
		</div>
		<div class="clear"></div>
	</div>

	<div class="m_bg">
		<div class="w1185">
			<form class="form" id="login_form">
				<p class="p01">
					<span>会员登录</span><a href="reg.jsp">快速注册</a>
				</p>
				<p class="p02">
					<input type="text" value="账户名" name="uname" class="txt"
						onfocus="if(value=='账户名') {value=''}"
						onblur="if(value=='') {value='账户名'}" />
				</p>
				<p class="p03">
					<input type="password" value="密码" name="upwd" class="txt"
						onfocus="if(value=='密码') {value=''}"
						onblur="if(value=='') {value='密码'}" />
				</p>
				<%-- <p class="li03">
					<input type="text" name="" class="txt txt2" /><img
						src="${APP_PATH }/images/code.jpg" /><a href="#">看不清?换一张</a>
				</p> --%>
				<p class="p04">
					<span class="sp01"><input type="checkbox" name="" />自动登录</span><span
						class="sp02">忘记密码？点击<a href="pwd.jsp">找回密码</a></span>
				</p>
				<p class="p05">
					<input type="button" id="login_btn" value="立即登陆" class="sub" />
				</p>
			</form>
		</div>
	</div>

</body>

<script type="text/javascript">
	/**
	 * 处理查找的逻辑..
	 */
	$("#flower_search").click(function() {
		var dt = $("#flower_search_text").val();
		alert(dt);
	});

	/**
	 * 异步登录 处理
	 */

	$("#login_btn").click(function() {
		alert(1);

		$.ajax({
			url : "${APP_PATH}/userLord",
			type : "POST",
			data : $('#login_form').serialize(),
			success : function(result) {
				console.log(result);
				if (result.code == 100) {
					//登陆成功 回到上一页
					//history.back() 或 history.go(-1) 
					//window.history.back();
					window.location.href=document.referrer;
				} else {
					alert(result.msg);
					
				}

			}
		});

	});
</script>


</html>
