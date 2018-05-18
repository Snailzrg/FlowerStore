<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员中心</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js" type="text/javascript"></script>
<!-- ajax图片上传的js文件 -->
<script src="../js/ajaxfileupload.js" type="text/javascript"></script>
</head>

<script type="text/javascript">

	$(function() {

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

		$("#headPic").click(function() {
			$("#upload").click(); //隐藏了input:file样式后，点击头像就可以本地上传
			$("#upload").on("change", function() {
				var objUrl = getObjectURL(this.files[0]); //获取图片的路径，该路径不是图片在本地的路径
				if (objUrl) {
					$("#headPic").attr("src", objUrl); //将图片路径存入src中，显示出图片
				}
			});
		});

		//图片上传
		$("#submit_btn").click(function() {
							var imgurl = document.getElementById("upload").value;
							alert("上传.." + imgurl);
							$.ajaxFileUpload({
										url : "../uploadHeadPic",
										fileElementId : "upload", //文件上传域的ID，这里是input的ID，而不是img的
										dataType : 'json', //返回值类型 一般设置为json
										contentType : "application/x-www-form-urlencoded; charset=utf-8",
										success : function(result) {
											console.log(result);
											if (result.code == 200) {
												// $("#headPic").attr("src","/market/images/image.png");
												//将图片换成默认的+图片
											}
										}
									});
						});

	});


	//建立一個可存取到該file的url
	function getObjectURL(file) {
		var url = null;
		if (window.createObjectURL != undefined) { // basic
			url = window.createObjectURL(file);
		} else if (window.URL != undefined) { // mozilla(firefox)
			url = window.URL.createObjectURL(file);
		} else if (window.webkitURL != undefined) { // webkit or chrome
			url = window.webkitURL.createObjectURL(file);
		}
		return url;
	}

	//先检查是否登录，是 就拿数据 否则 就直接跳转到登录页
	function checkUser() {
		$.ajax({
			url : "../checkUserFromSession",
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

<body class="index">
	这个用户${User};
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
				</form>
				<p>
					<a href="${APP_PATH }/showFlowers?&&ftid=2">生日</a>|<a
						href="${APP_PATH }/showFlowers?&&ftid=3">婚礼</a>|<a
						href="${APP_PATH }/showFlowers?&&ftid=4">祝福</a>| <a
						href="${APP_PATH }/showFlowers?&&ftid=6">友情</a>|<a
						href="${APP_PATH }/showFlowers?&&ftid=6">周年纪念</a>
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

	<div class="menu">
		<div class="w1200">
		</div>
	</div>


	<div class="w1200">
		<div class="position">
			<a href="#">首页</a> > <a href="#">会员中心</a> > <a href="#">个人资料</a>
		</div>

		<div class="m_d">
			<div class="left">
				<dl>
					<dt>账户管理</dt>
					<dd>
						<a href="member.jsp" class="on">个人资料</a> <a href="pwd.jsp">修改密码</a>
						<a href="OrderManage.jsp">订单管理</a> <a href="info.jsp">地址管理</a>
						<a href="shopcar.jsp">购物车管理</a>
					</dd>
				</dl>

			</div>
			<div class="right">
				<dl class="dl01">
					<dt>
						<img src="../images/ico04.jpg" />
					</dt>
					<dd>
						<table width="725" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="416" class="td01">尊敬的，<font>${User.uname}</font>
									您好！<span>(普通会员)</span></td>
							</tr>
							<tr>
								<td>嫌弃头像太丑-- </>点击
									<button id="submit_btn" type="submit">修改图片</button> <a
									class="save" href="#">保存</a>
								</td>
							</tr>
						</table>
						<img id="headPic" width="120px" height="118px"
							src="${APP_PATH }/${User.uimg};" style="padding: 5px" /> <input
							id="upload" name="file" accept="image/*" type="file"
							style="display: none" />
					</dd>
				</dl>
				<dl class="dl02">
					<dt>
						<span>个人资料</span>
					</dt>
					<dd>
						<!--  <div class="item"><span><font>*</font>头像：</span><img width="117px" height="118px"  src="../images/flowerimg/相守永恒.jpg"/></div> -->
						<div class="item">
							<span><font>*</font>用户名：</span><input type="tex"
								value="${User.uname}" class="txt" />
						</div>
						<div class="item">
							<span><font>*</font>电话：</span><input type="tex"
								value="${User.phone}" class="txt" />
						</div>
						<div class="item">
							<span><font>*</font>性别：</span>${User.sex}
							<%--  <c:if test="${User.sex}==男">
                           <input type="radio" value="" name="sex" checked/> 男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" value="" name="sex"/> 女</div>
                           </c:if>
                     --%>

							<div class="item">
								<span><font>*</font>邮箱：</span><input type="tex"
									value="${User.email}" class="txt" />
								<!--  <em>请输入邮箱地址，邮箱将用于找回密码。</em> -->
							</div>

							<!-- <div class="item"><input type="submit" class="sub" value="保存"/></div> -->
					</dd>
				</dl>
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
</body>
</html>
