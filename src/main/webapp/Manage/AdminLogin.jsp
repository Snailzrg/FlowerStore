<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="login-bg">
<head>
<title>Detail Admin - Sign in</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap -->
<link href="${APP_PATH}/Manage/css/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="${APP_PATH}/Manage/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
<link href="${APP_PATH}/Manage/css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/layout.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/elements.css" />
<link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/icons.css" />

<link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/lib/font-awesome.css" />

<link rel="stylesheet" href="${APP_PATH}/Manage/css/compiled/signin.css" type="text/css"
	media="screen" />

<!-- open sans font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>


	<!-- background switcher -->
	<div class="bg-switch visible-desktop">
		<div class="bgs">
			<%-- <a href="#" data-img="landscape.jpg" class="bg active"> <img
				src="${APP_PATH}/Manage/img/bgs/landscape.jpg" />
			</a> <a href="#" data-img="blueish.jpg" class="bg"> <img
				src="${APP_PATH}/Manage/img/bgs/blueish.jpg" /> </a>--%>
			 <a href="#" data-img="7.jpg" class="bg" class="bg active"> <img
				src="${APP_PATH}/Manage/img/bgs/7.jpg" />
			</a> <a href="#" data-img="8.jpg" class="bg"> <img
				src="${APP_PATH}/Manage/img/bgs/8.jpg" />
			</a> <a href="#" data-img="9.jpg" class="bg"> <img
				src="${APP_PATH}/Manage/img/bgs/9.jpg" />
			</a> <a href="#" data-img="10.jpg" class="bg"> <img
				src="${APP_PATH}/Manage/img/bgs/10.jpg" />
			</a> <a href="#" data-img="11.jpg" class="bg"> <img
				src="${APP_PATH}/Manage/img/bgs/11.jpg" />
			</a>
		</div>
	</div>


	<div class="row-fluid login-wrapper">
		<a href="index.jsp"> <img class="logo" src="${APP_PATH}/Manage/img/logo-white.png" />
		</a>

		<div class="span4 box">
			<form class="content-wrap" id="login_form">
				<h6>管理员 登录</h6>
				<input class="span12" type="text" name="aname"
					placeholder="E-mail address" /> <input class="span12"
					type="password" name="apwd" placeholder="Your password" /> <a
					href="#" class="forgot">忘记密码?</a> <input type="button"
					class="btn-glow primary login" id="login_admin" value="登录" />
			</form>
		</div>

	</div>

	<!-- scripts -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${APP_PATH}/Manage/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/Manage/js/theme.js"></script>


	<script type="text/javascript">
		$(function() {
			// bg switcher
			var $btns = $(".bg-switch .bg");
			$btns.click(function(e) {
				e.preventDefault();
				$btns.removeClass("active");
				$(this).addClass("active");
				var bg = $(this).data("img");

				$("html").css("background-image", "url('img/bgs/" + bg + "')");
			});

		});

		$("#login_admin").click(function() {
			alert('异步');
			$.ajax({
				url : "${APP_PATH}/adLogin",
				type : "POST",
				data : $('#login_form').serialize(),
				success : function(result) {
					if (result.code == 200) {
						alert("登录失败");
					} else {
						window.location.href = "index.jsp";

					}

				}
			});

		});
	</script>
	 <div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div> 
</body>
</html>