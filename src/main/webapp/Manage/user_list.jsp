<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Detail Admin - User list</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- bootstrap -->
<link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
<link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
<link href="css/bootstrap/bootstrap-overrides.css" type="text/css"
	rel="stylesheet" />

<!-- global styles -->
<link rel="stylesheet" type="text/css" href="css/layout.css" />
<link rel="stylesheet" type="text/css" href="css/elements.css" />
<link rel="stylesheet" type="text/css" href="css/icons.css" />

<!-- libraries -->
<link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />

<!-- this page specific styles -->
<link rel="stylesheet" href="css/compiled/user-list.css" type="text/css"
	media="screen" />
<script src="../js/jquery-1.7.min.js" type="text/javascript"></script>
<!-- open sans font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css' />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<!-- navbar -->
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
		</div>
	</div>

	<div id="sidebar-nav">
		<ul id="dashboard-menu">
			<li class="active">
				<div class="pointer">
					<div class="arrow"></div>
					<div class="arrow_border"></div>
				</div> <a href="index.jsp"> <i class="icon-home"></i> <span>主页</span>
			</a>
			</li>
			<li><a class="dropdown-toggle" href="#"> <i
					class="icon-group"></i> <span>网站用户</span> <i
					class="icon-chevron-down"></i>
			</a>
				<ul class="submenu">
					<li><a href="user_list.jsp">用户列表</a></li>
				</ul></li>
			<li><a href="tables.jsp"> <i class="icon-th-large"></i> <span>订单</span>
			</a></li>
			
			<li><a class="dropdown-toggle" href="#"> <i
					class="icon-share-alt"></i> <span>管理</span> <i
					class="icon-chevron-down"></i>
			</a>
				<ul class="submenu">
					<li><a href="AdminLogin.jsp">管理登录</a></li>
					<li><a href="${APP_PATH}/adLogout">管理退出</a></li>
				</ul></li>
		</ul>
	</div>


	<!-- main container -->
	<div class="content">
		<div class="container-fluid">
			<div id="pad-wrapper" class="users-list">
				<div class="row-fluid header">
					<h3>本站用户</h3>
					<div class="span10 pull-right">
						<input type="text" class="span5 search"
							placeholder="Type a user's name..."  id="text_name"/> <input type="button"
							class="btn-flat success pull-right" id="seach_user" value="查询">

					</div>
				</div>

				<!-- Users table -->
				<!-- 显示表格数据 -->
				<div class="row-fluid table">
					<table class="table table-hover" id="user_table">
						<thead>
							<tr>
								<th class="span4 sortable">用戶名</th>
								<th class="span3 sortable"><span class="line"></span>电话</th>
								<th class="span2 sortable"><span class="line"></span>性别</th>
								<th class="span3 sortable align-right"><span class="line"></span>邮箱
								</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="pagination pull-right" id="page_info">
						<div id="page_nav_area"></div>
					</div>
				</div>
				<!-- end users table -->
			</div>
		</div>
	</div>
	<!-- scripts -->
<!-- 	<script src="http://code.jquery.com/jquery-latest.js"></script> -->
	<!-- <script src="js/bootstrap.min.js"></script> -->
	<script src="js/theme.js"></script>

	<script type="text/javascript">
		$(function() {

			alert("页面加载..");
			getData(1, "");
		});

		$("#seach_user").click(function(){
			var text=$("#text_name").val();
			alert("查询"+text);
			getData(1, text);
			
		});
		
		function getData(page, uname) {
			$.ajax({
				url : "${APP_PATH}/getUsers",
				type : "get",
				data : {
					"parmas" : uname,
					"pn" : page
				},
				success : function(result) {
					if (result.code == 200) {
						alert("失败");
					} else {
						alert("ok");
						showUsers(result);
						showPaages(result);
					}

				}
			});
		}


		function showUsers(result) {
			$("#user_table tbody").empty();
			var userList = result.extend.pageInfo.list;
			$
					.each(
							userList,
							function(index, item) {
								///FlowerStore/images/flowerimg/default.jpg
								var img1 = $("<img src='${APP_PATH}/"+item.uimg+"' class='img-circle avatar hidden-phone'/>");
								var p = $("<p class='name'></p>").append(
										item.uname);
								var spn = $("<span class='subtext'></span>")
										.append(item.upwd);
								var td1 = $("<td></td>").append(img1).append(p)
										.append(spn);
								var td2 = $("<td></td>").append(item.phone);
								var td3 = $("<td></td>").append(item.sex);
								var td4 = $("<td class='align-right'></td>")
										.append(item.email);
								$("<tr></tr>").append(td1).append(td2).append(
										td3).append(td4).appendTo(
										"#user_table tbody");
							});

		}

		//展示分页信息
		function showPaages(result) {
			//解析显示分页条,点击分页要可以去下一页....
			$("#page_nav_area").empty();
			var ul = $("<ul></ul>");

			//构建元素
			var firstPageLi = $("<li></li>").append(
					$("<a></a>").append("首页").attr("href", "#"));
			var prePageLi = $("<li></li>").append(
					$("<a></a>").append("&laquo;"));
			if (result.extend.pageInfo.hasPreviousPage == false) {
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				//为元素添加点击翻页的事件
				firstPageLi.click(function() {
					getData(p1, 1);
				});
				prePageLi.click(function() {
					getData(p1, result.extend.pageInfo.pageNum - 1);
				});
			}
			var nextPageLi = $("<li></li>").append(
					$("<a></a>").append("&raquo;"));
			var lastPageLi = $("<li></li>").append(
					$("<a></a>").append("末页").attr("href", "#"));
			if (result.extend.pageInfo.hasNextPage == false) {
				//如果没有下一页
				nextPageLi.addClass("disabled");
				lastPageLi.addClass("disabled");
			} else {
				nextPageLi.click(function() {
					getData(result.extend.pageInfo.pageNum + 1, "");
				});
				lastPageLi.click(function() {
					getData(result.extend.pageInfo.pages, "");
				});
			}
			//添加首页和前一页 的提示
			ul.append(firstPageLi).append(prePageLi);
			//1,2，3遍历给ul中添加页码提示
			$.each(result.extend.pageInfo.navigatepageNums, function(index,
					item) {
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if (result.extend.pageInfo.pageNum == item) {
					numLi.addClass("active");
				}
				numLi.click(function() {
					getData(item, "");
				});
				ul.append(numLi);
			});
			//添加下一页和末页 的提示
			ul.append(nextPageLi).append(lastPageLi);

			//把ul加入到nav
			var navEle = $("<nav></nav>").append(ul);
			navEle.appendTo("#page_nav_area");
		}
		
		
	</script>
</body>
</html>