<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<title>Detail Admin - Tables showcase</title>

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
<link rel="stylesheet" href="css/compiled/tables.css" type="text/css"
	media="screen" />

<!-- open sans font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css' />

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>

	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<a class="brand"><img src="img/logo.png" /></a>
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
					<!-- <li><a href="new_user.jsp">用户新增</a></li>
					<li><a href="user_profile.jsp">用户信息</a></li> -->
				</ul></li>
			<li><a href="tables.jsp"> <i class="icon-th-large"></i> <span>订单</span>
			</a></li>
	<!-- 		<li><a href="personal_info.jsp"> <i class="icon-cog"></i> <span>My
						Info</span>
			</a></li> -->
			
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

		<!-- settings changer -->
		<div class="skins-nav">
			<a href="#" class="skin first_nav selected"> <span class="icon"></span><span
				class="text">Default</span>
			</a> <a href="#" class="skin second_nav" data-file="css/skins/dark.css">
				<span class="icon"></span><span class="text">Dark skin</span>
			</a>
		</div>

		<div class="container-fluid">
			<div id="pad-wrapper">
				<!-- 订单表 总表 -->
				<div class="table-wrapper orders-table section">
					<div class="row-fluid head">
						<div class="span12">
							<h4>订单</h4>
						</div>
					</div>

					<div class="row-fluid filter-block">
						<div class="pull-right">
							<div class="btn-group pull-right">
								<button class="glow left large" id="all_orders"
									style="color: red;">所有订单</button>
								<button class="glow middle large" id="unPass_orders">未发货</button>
								<button class="glow right large" id="Pass_orders">已发货</button>
							</div>
							<!-- 	<input type="text" class="search order-search"
								placeholder="Search for an order.." /> -->
						</div>
					</div>

					<div class="row-fluid">
						<table class="table table-hover" id="show_order">
							<thead>
								<tr>
									<th class="span2">订单 编号</th>
									<th class="span3">订单 日期</th>
									<th class="span3"><span class="line"></span> 订单 状态</th>
									<th class="span3"><span class="line"></span> 订单 留言</th>
									<th class="span3"><span class="line"></span> 订单 价格</th>
									<th class="span3"><span class="line"></span> 操 作</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>

						<div class="pagination pull-right" id="page_info">
							<div id="page_nav_area"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- scripts -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/theme.js"></script>
	<script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			alert("64555555555555..");
			show_order(1, 0);
		});
		var thispage=null;
		var thisstate=null; 

		$("#all_orders").click(function() {
			$("button").css("color","black");
			$("#all_orders").css("color","red");
			alert("查询");
			show_order(1, 0);
		});

		$("#unPass_orders").click(function() {
			$("button").css("color","black");
			$("#unPass_orders").css("color","red");
			show_order(1, 1);
			
		});
		$("#Pass_orders").click(function() {
			$("button").css("color","black");
			$("#Pass_orders").css("color","red");
			alert("查Pass_orders询");
			show_order(1, 2);
		});

		$(document).on("click",".edit_btn",function(){
			//alert("edit");
			//1、查出部门信息，并显示部门列表
			getDepts("#empUpdateModal select");
			//2、查出员工信息，显示员工信息
			 getEmp($(this).attr("edit-id")); 
			
			//3、把员工的id传递给模态框的更新按钮
			$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
			$("#empUpdateModal").modal({
				backdrop:"static"
			});
		});
		
		
		function show_order(page, parmas) {
			alert(556);
			$.ajax({
				url : "../getOrdersWithType",
				type : "get",
				data : {
					"pn" : page,
					"parmas" : parmas
				},
				success : function(result) {
					if (result.code == 200) {
						alert("失败");
					} else {
						alert("ok");
						showOrders(result);
						showPaages(result);
					}

				}
			});
		}

		function showOrders(result) {
			thispage=result.extend.pageInfo.pageNum;
			$("#show_order tbody").empty();
			var orderList = result.extend.pageInfo.list;
			$.each(orderList, function(index, item) {
				//<span class="label label-success">
				var td1 = $('<td></td>').append(index + 1);
				var td2 = $('<td></td>').append(item.odate);

				var spn = $('<span class="label label-success">');

				/* 	var genderTd = $("<td></td>").append(
							item.gender == 'M' ? "男" : "女"); */
				var state = "代发货";
			   var btnTd = null;
				if (item.state == 1) {
					state = "代发货"
					var send_btn = $("<button></button>").addClass(	"btn btn-primary btn-sm send_btn").append($("<span></span>")
							.addClass("glyphicon glyphicon-pencil")).append("发货");
					send_btn.attr("del-id", item.oid);
					
					var quxiao_btn = $("<button></button>").addClass("btn btn-danger btn-sm quxiao_btn").append($("<span></span>")
							.addClass("glyphicon glyphicon-trash")).append("取消");
					quxiao_btn.attr("del-id", item.oid);
					 btnTd = $("<td></td>").append(send_btn).append("   ").append(quxiao_btn);
				}
				if (item.state == 2) {
					state = "已发货"
						var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")
								.addClass("glyphicon glyphicon-trash")).append("删除");
						delBtn.attr("del-id", item.oid);
						 btnTd = $("<td></td>").append("     ").append(delBtn);
				}
				var td3 = $('<td></td>').append(state);
				var td4 = $('<td></td>').append(item.oadress);
				var td5 = $('<td></td>').append("￥" + item.oprice);//
				
				
				
				$("<tr></tr>").append(td1).append(td2).append(td3).append(td4)
						.append(td5).append(btnTd).appendTo("#show_order tbody");
			});

		}
		
		/**
		*/
		$(document).on("click",".send_btn",function(){
		   alert("11.."+$(this).attr("del-id"));
			updateOrder($(this).attr("del-id"),2);
		});
		
		
		
		$(document).on("click",".quxiao_btn",function(){
			alert("12.."+$(this).attr("del-id"));
			updateOrder($(this).attr("del-id"),0);
		});
		
		
		$(document).on("click",".delete_btn",function(){
			alert("13.."+$(this).attr("del-id"));
			updateOrder($(this).attr("del-id"),0);
		});
		
		/**
		*/
		function updateOrder(oid,parmas){
			$.ajax({
				url : "../updateForder",
				type : "get",
				data : {
					"oid" : oid,
					"parmas" : parmas
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
					getFlowersWithType(p1, 1);
				});
				prePageLi.click(function() {
					getFlowersWithType(p1, result.extend.pageInfo.pageNum - 1);
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