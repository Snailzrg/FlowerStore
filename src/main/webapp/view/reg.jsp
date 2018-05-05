<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<style>
	.w1185 {
		display: flex;	
	}
	.info-site {
		line-height: 1.5;
		padding-right: 50px;
	}

</style>

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
					<a href="${APP_PATH }/birth">生日</a>|<a href="${APP_PATH }/wedding">婚礼</a>|<a href="${APP_PATH }/blessing">祝福</a>|
						<a href="${APP_PATH }/love">爱意表达</a>|<a href="${APP_PATH }/friendShop">友情</a>|<a
						href="${APP_PATH }/yearMemory">周年纪念</a>
				</p>
			</div>
		<div class="s_r">
			<img src="${APP_PATH }/images/tel.jpg" />
		</div>
		<div class="clear"></div>
	</div>

	<div class="reg">
		<div class="w1185">
			<div class="left">
				<p>
					<b>快速注册</b>
				</p>
				<form class="form" id="reg_form">
					<ul>
						<li><span><font>*</font> 用户名：</span><input type="text"
							id="reg_uanme" placeholder="用户名可以是2-5位中文或者6-16位英文和数字的组合"
							name="uname" class="txt" /> <label id="uname_wrong_message"
							name="uname_wrong_message" class="txt2"></label></li>
						<li><span><font>*</font> 请设置密码：</span><input type="password"
							id="reg_upwd1" name="upwd" class="txt" /><label
							id="upwd_wrong_message" name="upwd_wrong_message" class="txt2"></label></li>
						<li><span><font>*</font> 请确认密码：</span><input type="password"
							id="reg_upwd2" class="txt" /><label id="upwd_wrong_message2"
							class="txt2"></label></li>
						<li><span><font>*</font> 请輸入邮箱：</span><input type="text"
							id="reg_email" name="email" class="txt" /><label
							id="uemail_wrong_message" name="uemail_wrong_message"
							class="txt2"></label></li>
						<%--   <li class="li03"><span><font>*</font> 验证码：</span><input type="text" name="" class="txt txt2"/><img src="${APP_PATH }/images/code.jpg"/><a href="#">看不清?换一张</a></li> --%>
						<li class="li01"><input type="checkbox" readonly="readonly"
							value="1" id="checkboxty" name="checkboxty" />我已阅并同意<a rel="#"
							id="reg_zrg">《鲜花客用户注册协议》</a></li>
						<li class="li02"><input type="button" id="reg_button"
							value="立即注册" class="sub" /></li>
					</ul>
				</form>
			</div>
			<div class="right">
				<p>
					<b>网站规则</b>
				</p>
				<div>

					<div class="info-site">您即将注册 本网站 请看清楚 出问题 我们 不负责的哦
				7.1 用户明确同意其1使用本站网络服务所存在的风险及一切后果将完全由用户本人承担，保宝网对此不承担任何责任。
				7.2 本站无法保证网络1服务一定能满足用户的要求，也不保证网络服务的及时性、安全性、准确性。
				7.3 本站不保证为方便用户而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本站实际控制的任何网页上的内容，本站不承担任何责任。
				7.4 对于因不可抗力或本站不能控制的原因造成的网络服务中断或其它缺陷，本站不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。  </textarea>
				</div>

			</div>

		</div>
	</div>

	<div class="bottom">
		<a href="#">关于我们</a>|<a href="#">帮助中心</a>|<a href="#">法律声明</a>|<a
			href="#">用户协议</a>|<a href="#">联系我们</a>|<a href="#">人才招聘</a>|<a
			href="#">站点地图</a>

		<p>
			网络文化经营许可证：粤网文[2015]0295-065号<br />© 2015 深圳易易城科技网络有限公司.
			粤ICP备15042543号
		</p>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		//	alert(1213);
	});

	/**校验 1：先格式验证，再内容？
	 */
	$("#reg_button").click(function() {

		if (!validate_reg_form()) {
			return false;
		}
		if ($("#reg_button").attr("ajax-va") == "error") {
			return false;
		}

		//当校验通过 此时就可以 执行 新增了
		//此处待改进.....
		var b = true;
		$.each($('input:checkbox'), function() {
			if (!this.checked) {
				alert("您还没勾选同意哟");
				b = false;
			}
		});
		if (b) {
			/**注册......
			*/
			$.ajax({
				url : "${APP_PATH}/userReg",
				type : "POST",
				data : $('#reg_form').serialize(),
				success : function(result) {
					if (result.code == 100) {
						$(location).attr('href', "${APP_PATH}/view/login.jsp");
					} else {
						alert('注册失败,请重新注册');
					}

				}
			});
		}

	});

	//校验用户名是否可用
	$("#reg_uanme").change(
			function() {
				var uName = $("#reg_uanme").val();
				$.ajax({
					url : "${APP_PATH}/checkuserName",
					data : "uname=" + uName,
					type : "POST",
					success : function(result) {
						if (result.code == 100) {
							$("#reg_button").attr("ajax-va", "success");
							show_validate_msg("#uname_wrong_message",
									"success", "用户不存在");
						} else {
							$("#reg_button").attr("ajax-va", "error");
							show_validate_msg("#uname_wrong_message", "error",
									"用户已存在");
						}
					}
				});
			});

	//校验表单数据
	function validate_reg_form() {
		//1、拿到要校验的数据，使用正则表达式
		var bl = true;
		var uName = $("#reg_uanme").val();
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		if (!regName.test(uName)) {
			show_validate_msg("#uname_wrong_message", "error", "用户名格式不正确");
			bl = false;
		}

		//2、校验邮箱信息
		var email = $("#reg_email").val();
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if (!regEmail.test(email)) {
			//应该清空这个元素之前的样式
			show_validate_msg("#uemail_wrong_message", "error", "邮箱格式不正确");
			bl = false;
		}

		//3校验 两次输入的密码内容
		var upwd1 = $("#reg_upwd1").val();
		var upwd2 = $("#reg_upwd2").val();
		if (upwd1 != upwd2) {
			show_validate_msg("#upwd_wrong_message2", "error", "两次输入的密码不一致");
			bl = false;
		}
		return bl;
	}

	//显示校验结果的提示信息
	function show_validate_msg(ele, status, msg) {
		//清除当前元素的校验状态
		$("label").text("");
		if ("success" == status) {

		} else if ("error" == status) {
			$(ele).text(msg);
		}
	}
</script>

</html>
