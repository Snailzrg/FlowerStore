<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<body>
	<title>Detail Admin - Home</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- bootstrap -->
	<link href="${APP_PATH}/Manage/css/bootstrap/bootstrap.css"
		rel="stylesheet" />
	<link href="${APP_PATH}/Manage/css/bootstrap/bootstrap-responsive.css"
		rel="stylesheet" />
	<link href="${APP_PATH}/Manage/css/bootstrap/bootstrap-overrides.css"
		type="text/css" rel="stylesheet" />

	<!-- libraries -->
	<link href="${APP_PATH}/Manage/css/lib/jquery-ui-1.10.2.custom.css"
		rel="stylesheet" type="text/css" />
	<link href="${APP_PATH}/Manage/css/lib/font-awesome.css"
		type="text/css" rel="stylesheet" />

	<!-- global styles -->
	<link rel="stylesheet" type="text/css"
		href="${APP_PATH}/Manage/css/layout.css" />
	<link rel="stylesheet" type="text/css"
		href="${APP_PATH}/Manage/css/elements.css" />
	<link rel="stylesheet" type="text/css"
		href="${APP_PATH}/Manage/css/icons.css" />

	<!-- this page specific styles -->
	<link rel="stylesheet" href="${APP_PATH}/Manage/css/compiled/index.css"
		type="text/css" media="screen" />

	<!-- open sans font -->
	<link
		href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
		rel='stylesheet' type='text/css' />

	<!-- lato font -->
	<link
		href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic'
		rel='stylesheet' type='text/css' />

	<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
	<!-- navbar -->
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<button type="button" class="btn btn-navbar visible-phone"
				id="menu-toggler">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="brand" href="index.jsp"><img src="img/logo.png" /></a>

			<ul class="nav pull-right">
				<li class="hidden-phone"><input class="search" type="text" />
				</li>
				<li class="notification-dropdown hidden-phone"><a href="#"
					class="trigger"> <i class="icon-warning-sign"></i> <span
						class="count">8</span>
				</a>
					<div class="pop-dialog">
						<div class="pointer right">
							<div class="arrow"></div>
							<div class="arrow_border"></div>
						</div>
						<div class="body">
							<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
							<div class="notifications">
								<h3>You have 6 new notifications</h3>
								<a href="#" class="item"> <i class="icon-signin"></i> New
									user registration <span class="time"><i
										class="icon-time"></i> 13 min.</span>
								</a> <a href="#" class="item"> <i class="icon-signin"></i> New
									user registration <span class="time"><i
										class="icon-time"></i> 18 min.</span>
								</a> <a href="#" class="item"> <i class="icon-envelope-alt"></i>
									New message from Alejandra <span class="time"><i
										class="icon-time"></i> 28 min.</span>
								</a> <a href="#" class="item"> <i class="icon-signin"></i> New
									user registration <span class="time"><i
										class="icon-time"></i> 49 min.</span>
								</a> <a href="#" class="item"> <i class="icon-download-alt"></i>
									New order placed <span class="time"><i class="icon-time"></i>
										1 day.</span>
								</a>
								<div class="footer">
									<a href="#" class="logout">View all notifications</a>
								</div>
							</div>
						</div>
					</div></li>
				<li class="notification-dropdown hidden-phone"><a href="#"
					class="trigger"> <i class="icon-envelope-alt"></i>
				</a>
					<div class="pop-dialog">
						<div class="pointer right">
							<div class="arrow"></div>
							<div class="arrow_border"></div>
						</div>
						<div class="body">
							<a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
							<div class="messages">
								<a href="#" class="item"> <img src="img/contact-img.png"
									class="display" />
									<div class="name">Alejandra Galván</div>
									<div class="msg">There are many variations of available,
										but the majority have suffered alterations.</div> <span class="time"><i
										class="icon-time"></i> 13 min.</span>
								</a> <a href="#" class="item"> <img src="img/contact-img2.png"
									class="display" />
									<div class="name">Alejandra Galván</div>
									<div class="msg">There are many variations of available,
										have suffered alterations.</div> <span class="time"><i
										class="icon-time"></i> 26 min.</span>
								</a> <a href="#" class="item last"> <img
									src="img/contact-img.png" class="display" />
									<div class="name">Alejandra Galván</div>
									<div class="msg">There are many variations of available,
										but the majority have suffered alterations.</div> <span class="time"><i
										class="icon-time"></i> 48 min.</span>
								</a>
								<div class="footer">
									<a href="#" class="logout">View all messages</a>
								</div>
							</div>
						</div>
					</div></li>
				<li class="dropdown"><a href="#"
					class="dropdown-toggle hidden-phone" data-toggle="dropdown">
						Your account <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="personal_info.jsp">Personal info</a></li>
						<li><a href="#">Account settings</a></li>
						<li><a href="#">Billing</a></li>
						<li><a href="#">Export your data</a></li>
						<li><a href="#">Send feedback</a></li>
					</ul></li>
				<li class="settings hidden-phone"><a href="personal_info.jsp"
					role="button"> <i class="icon-cog"></i>
				</a></li>
				<li class="settings hidden-phone"><a href="AdminLogin.jsp"
					role="button"> <i class="icon-share-alt"></i>
				</a></li>
			</ul>
		</div>
	</div>
	<!-- end navbar -->

	<!-- sidebar -->
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
					class="icon-group"></i> <span>用户管理</span> <i
					class="icon-chevron-down"></i>
			</a>
				<ul class="submenu">
					<li><a href="user_list.jsp">用户列表</a></li>
					<li><a href="new_user.jsp">用户新增</a></li>
					<li><a href="user_profile.jsp">用户信息</a></li>
				</ul></li>
			<li><a href="tables.jsp"> <i class="icon-th-large"></i> <span>订单</span>
			</a></li>
			<li><a href="personal_info.jsp"> <i class="icon-cog"></i> <span>My
						Info</span>
			</a></li>
			<li><a class="dropdown-toggle" href="#"> <i
					class="icon-share-alt"></i> <span>管理</span> <i
					class="icon-chevron-down"></i>
			</a>
				<ul class="submenu">
					<li><a href="AdminLogin.jsp">管理登录</a></li>
					<li><a href="AdminLogout.jsp">管理退出</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- end sidebar -->


	<!-- main container -->
	<div class="content">

		<!-- settings changer -->
		<div class="skins-nav">
			<a href="#" class="skin first_nav selected"> <span class="icon"></span><span
				class="text">Default skin</span>
			</a> <a href="#" class="skin second_nav"
				data-file="${APP_PATH}/Manage/css/skins/dark.css"> <span
				class="icon"></span><span class="text">Dark skin</span>
			</a>
		</div>

		<div class="container-fluid">

			<!-- upper main stats -->
			<div id="main-stats">
				<div class="row-fluid stats-row">
					<div class="span3 stat">
						<div class="data">
							<span class="number">2457</span> 访问量
						</div>
						<span class="date">Today</span>
					</div>
					<div class="span3 stat">
						<div class="data">
							<span class="number">3240</span> 网站会员
						</div>
						<span class="date">February 2014</span>
					</div>
					<div class="span3 stat">
						<div class="data">
							<span class="number">322</span> 订单数量
						</div>
						<span class="date">This week</span>
					</div>
					<div class="span3 stat last">
						<div class="data">
							<span class="number">$2,340</span> 销量统计
						</div>
						<span class="date">last 30 days</span>
					</div>
				</div>
			</div>
			<!-- end upper main stats -->

			<div id="pad-wrapper">
				<div class="table-products section">
					<div class="row-fluid head">
						<div class="span12">
							<h4>
								鲜花列表 <small>Table sample</small>
							</h4>
						</div>
					</div>

					<div class="row-fluid filter-block">
						<div class="pull-right">
							<div class="ui-select">
								<select id="myselect">
									<option value=0>鲜花种类</option>
									<c:forEach items="${flowerTypeList }" var="flowerType">

										<option value="${flowerType.ftid}">${flowerType.ftname}</option>
									</c:forEach>
								</select>
							</div>
							<!-- <input type="text" class="search" /> --> <a
								class="btn-flat new-product" href="new_flower.jsp">+ 新增鲜花</a>
						</div>
					</div>

					<!-- 显示表格数据 -->
					<div class="row-fluid">
						<table class="table table-hover" id="flower_table">
							<thead>
								<tr>
									<!--  <th><input type="checkbox" id="check_all" /></th> -->
									<th>编号</th>
									<th>鲜花图片</th>
									<th>鲜花名称</th>
									<th>鲜花介绍</th>
									<th>库存数量</th>
									<th>售价</th>
									<th>操作</th>
								</tr>
							</thead>

							<tbody>

							</tbody>

						</table>
						<!-- 显示分页信息 -->
						<!-- <div class="pagination" id="page_info">
                        <ul>
                        
                        </ul>
                        </div> -->

						<div class="pagination" id="page_info">
							<div id="page_nav_area"></div>
						</div>
						<!-- end table sample -->


					</div>
				</div>
			</div>
		</div>

		<!-- scripts -->
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery-ui-1.10.2.custom.min.js"></script>
		<!-- knob -->
		<script src="js/jquery.knob.js"></script>
		<!-- flot charts -->
		<script src="js/jquery.flot.js"></script>
		<script src="js/jquery.flot.stack.js"></script>
		<script src="js/jquery.flot.resize.js"></script>
		<script src="js/theme.js"></script>

		<script type="text/javascript">
			//异步请求的  请求 鲜花 按照 	
			var currentPage;//本页面
			function getFlowersWithType(ftype, fn) {
				$.ajax({
					url : "${APP_PATH}/getFlowersAdmin",
					type : "POST",
					data : {
						"FlowerType" : ftype,
						"pn" : fn
					},
					success : function(result) {
						if (result.code == 200) {
							alert("失败");
						} else {
							showFlows(result);
							showPaages(result);
						}

					}
				});
			}

			/**鲜花数据绑定  还要传页数
			 */
			function showFlows(result) {
				$("#flower_table tbody").empty();
				var flowerList = result.extend.pageInfo.list;
				currentPage=result.extend.pageInfo.pageNum;//本页面
				$.each(flowerList,function(index, item) {
						var indexNo = $("<td></td>").append(
							index + 1);
						var img = $("<td> <img src=../"+item.fimg+"  height='50px' width='50px'></td>");
						var flowerNmaeTd = $("<td></td>").append(
							item.fname);
					var fdetilTd = $("<td></td>").append(item.fdetil);
					var fcountTd = $("<td></td>").append(item.count);
					var fpriceTd = $("<td></td>").append(item.price);
					var editBtn = $("<button></button>").addClass(	"btn btn-primary btn-sm edit_btn").append($("<span></span>")
							.addClass("glyphicon glyphicon-pencil")).append("编辑");
					editBtn.attr("edit-id", item.fid);
					var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>")
							.addClass("glyphicon glyphicon-trash")).append("删除");
					delBtn.attr("del-id", item.fid);
					var btnTd = $("<td></td>").append(editBtn).append("   ").append(delBtn);
						//apend方法执行完成后 还是 返回原来的元素
					$("<tr></tr>").append(indexNo).append(img)	.append(flowerNmaeTd).append(fdetilTd).append(fcountTd).append(fpriceTd).append(btnTd).appendTo("#flower_table tbody");
						});

			}

			//展示分页信息
			function showPaages(result) {
				//解析显示分页条,点击分页要可以去下一页....
				var p1 = $("#myselect").children('option:selected').val();
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
						getFlowersWithType(p1, result.extend.pageInfo.pageNum + 1);
					});
					lastPageLi.click(function() {
						getFlowersWithType(p1, result.extend.pageInfo.pages);
					});
				}
				//添加首页和前一页 的提示
				ul.append(firstPageLi).append(prePageLi);
				//1,2，3遍历给ul中添加页码提示
				$.each(result.extend.pageInfo.navigatepageNums, function(index,
						item) {
					var numLi = $("<li></li>")
							.append($("<a></a>").append(item));
					if (result.extend.pageInfo.pageNum == item) {
						numLi.addClass("active");
					}
					numLi.click(function() {
						
						getFlowersWithType(p1, item);
					});
					ul.append(numLi);
				});
				//添加下一页和末页 的提示
				ul.append(nextPageLi).append(lastPageLi);

				//把ul加入到nav
				var navEle = $("<nav></nav>").append(ul);
				navEle.appendTo("#page_nav_area");
			}

			//下拉列表赋值
			$('#myselect').change(function() {
				var p1 = $(this).children('option:selected').val();//这就是selected的值 
				getFlowersWithType(p1, 1);
			});

			//单个删除
			$(document).on("click",".delete_btn",function(){
				//1、弹出是否确认删除对话框
				var fname = $(this).parents("tr").find("td:eq(2)").text();
				var flowerId = $(this).attr("del-id");
				alert(flowerId);
				if(confirm("确认删除【"+fname+"】吗？")){
					//确认，发送ajax请求删除即可
					alert('flowerId'+flowerId);
					 $.ajax({
						url:"${APP_PATH}/deletFlower",
						type:"GET",
						date:"flowerId"+flowerId,
						success:function(result){
							alert(result.msg);
							//回到本页
						getFlowersWithType($(this).children('option:selected').val(), currentPage);
						}
					}); 
				}
			});
			
			$(function() {
				getFlowersWithType(0, 1);//加载时 为0 查所有
				// jQuery Knobs
				$(".knob").knob();

				// jQuery UI Sliders
				$(".slider-sample1").slider({
					value : 100,
					min : 1,
					max : 500
				});
				$(".slider-sample2").slider({
					range : "min",
					value : 130,
					min : 1,
					max : 500
				});
				$(".slider-sample3").slider({
					range : true,
					min : 0,
					max : 500,
					values : [ 40, 170 ],
				});

				// jQuery Flot Chart
				var visits = [ [ 1, 50 ], [ 2, 40 ], [ 3, 45 ], [ 4, 23 ],
						[ 5, 55 ], [ 6, 65 ], [ 7, 61 ], [ 8, 70 ], [ 9, 65 ],
						[ 10, 75 ], [ 11, 57 ], [ 12, 59 ] ];
				var visitors = [ [ 1, 25 ], [ 2, 50 ], [ 3, 23 ], [ 4, 48 ],
						[ 5, 38 ], [ 6, 40 ], [ 7, 47 ], [ 8, 55 ], [ 9, 43 ],
						[ 10, 50 ], [ 11, 47 ], [ 12, 39 ] ];

				var plot = $.plot($("#statsChart"), [ {
					data : visits,
					label : "Signups"
				}, {
					data : visitors,
					label : "Visits"
				} ], {
					series : {
						lines : {
							show : true,
							lineWidth : 1,
							fill : true,
							fillColor : {
								colors : [ {
									opacity : 0.1
								}, {
									opacity : 0.13
								} ]
							}
						},
						points : {
							show : true,
							lineWidth : 2,
							radius : 3
						},
						shadowSize : 0,
						stack : true
					},
					grid : {
						hoverable : true,
						clickable : true,
						tickColor : "#f9f9f9",
						borderWidth : 0
					},
					legend : {
						// show: false
						labelBoxBorderColor : "#fff"
					},
					colors : [ "#a7b5c5", "#30a0eb" ],
					xaxis : {
						ticks : [ [ 1, "JAN" ], [ 2, "FEB" ], [ 3, "MAR" ],
								[ 4, "APR" ], [ 5, "MAY" ], [ 6, "JUN" ],
								[ 7, "JUL" ], [ 8, "AUG" ], [ 9, "SEP" ],
								[ 10, "OCT" ], [ 11, "NOV" ], [ 12, "DEC" ] ],
						font : {
							size : 12,
							family : "Open Sans, Arial",
							variant : "small-caps",
							color : "#697695"
						}
					},
					yaxis : {
						ticks : 3,
						tickDecimals : 0,
						font : {
							size : 12,
							color : "#9da3a9"
						}
					}
				});

				function showTooltip(x, y, contents) {
					$('<div id="tooltip">' + contents + '</div>').css({
						position : 'absolute',
						display : 'none',
						top : y - 30,
						left : x - 50,
						color : "#fff",
						padding : '2px 5px',
						'border-radius' : '6px',
						'background-color' : '#000',
						opacity : 0.80
					}).appendTo("body").fadeIn(200);
				}

				var previousPoint = null;
				$("#statsChart")
						.bind(
								"plothover",
								function(event, pos, item) {
									if (item) {
										if (previousPoint != item.dataIndex) {
											previousPoint = item.dataIndex;

											$("#tooltip").remove();
											var x = item.datapoint[0]
													.toFixed(0), y = item.datapoint[1]
													.toFixed(0);

											var month = item.series.xaxis.ticks[item.dataIndex].label;

											showTooltip(item.pageX, item.pageY,
													item.series.label + " of "
															+ month + ": " + y);
										}
									} else {
										$("#tooltip").remove();
										previousPoint = null;
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