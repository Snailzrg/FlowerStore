<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购物车</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${APP_PATH }/css/style.css" type="text/css" rel="stylesheet" />
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH }/js/common.js" type="text/javascript"></script>
<script src="../js/jqPaginator.js"></script>
</head>
<script type="text/javascript">
var if_firstime;
	$(function() {
	
		if_firstime = true;  
		getDate(1);  
		
	});
 	
	var thispage;
	//获得该用户的所有的购物车的数据  按照时间排序 就是按照id排序..生成的顺序//分页？
	function getDate(pn) {
		if (checkUser()) {
			$.ajax({
				url : "${APP_PATH}/getMyShopCar",
				type : "GET",
				data : "pn=" + pn,
				success : function(result) {
					if (result.code == 100) {
						show_gwcr(result);
						showPaages(result);
					}
				}
			});
		}
	}

	/**
	 * 检查 复选框
	 */

	$(document).on("click", ".ck", function() {
		// alert($(this).is(':checked'));

	});

	/*  $('input[type=checkbox]').change(function() {
	 alert("checked");
	 });
	 */
	/**
	 * 结算按钮
	 /去除empNames多余的,
	 empNames = empNames.substring(0, empNames.length-1);
	 */
	function jiesuan() {
		alert($("input[type='checkbox']:checked").length);
		var js_idstr = "";
		$.each($('input:checkbox:checked'), function() {
			if ($(this).val() != 0) {
				js_idstr += $(this).val() + "-";
			}

			// window.alert("你选了："+ $('input[type=checkbox]:checked').length+"个，其中有："+$(this).val());
		});
		js_idstr = js_idstr.substring(0, js_idstr.length - 1);
		//购物的请求...生成订单...啥的...生成订单就把购物车表给删掉//记得要改变库存哟

		if ($('input[type=checkbox]:checked').length <= 0) {
			return false;
		}

		$.ajax({
			url : "${APP_PATH}/goShopping",
			type : "GET",
			data : "ids=" + js_idstr,
			success : function(result) {
				window.location.href = "info.jsp";
			}
		});
	}

	/**检查鲜花库存
	这个有待商榷...可以用连表查询 可能会好一点...
	 */
	function check(fid) {
		$.ajax({
			url : "${APP_PATH}/checkFlowerCount",
			type : "GET",
			data : "fid=" + fid,
			success : function(result) {
				if (result.code == 200) {
					alert("失败");
				} else {
					//回到本页
					alert("checkok..");
				}
			}
		});

		return 0;
	}

	/*同步购物车表*
	 */
	function updateShopCar(gid, gcount) {
		$.ajax({
			url : "${APP_PATH}/updateShopCar",
			type : "GET",
			data : {
				"gid" : gid,
				"gcount" : gcount
			},
			success : function(result) {
				if (result.code == 200) {
					alert("同步失败");
				}
			}
		});

	}

	//数量- 动态变化
	$(document)
			.on(
					"click",
					".jian",
					function() {

						var thisCount = $(this).parents("tr").find("td:eq(5)")
								.find("input").val();
						var price = $(this).parents("tr").find("td:eq(4)")
								.text();
						price = parseInt(price.substr(1));
						var gid = $(this).parents("tr").find("td:eq(0)").find(
								"input").val();
						if (parseInt(thisCount) - 1 <= 0) {
							$(this).parents("tr").find("td:eq(5)")
									.find("input").val(1);
							var countprice = $(this).parents("tr").find(
									"td:eq(6)").text("￥" + price);
							return false;
						}
						thisCount -= 1;
						updateShopCar(gid, thisCount);
						$(this).parents("tr").find("td:eq(5)").find("input")
								.val(thisCount)
						var cmoney = thisCount * price;
						var countprice = $(this).parents("tr").find("td:eq(6)")
								.text("￥" + cmoney);
						//更新表...
						//updateShopCar(gid,gcount);
						//alert('-');

					});

	//数量+
	$(document).on(
			"click",
			".jia",
			function() {
				var thisCount = $(this).parents("tr").find("td:eq(5)").find(
						"input").val();
				var price = $(this).parents("tr").find("td:eq(4)").text();
				var gid = $(this).parents("tr").find("td:eq(0)").find("input")
						.val();
				price = parseInt(price.substr(1));
				if (true) {
					//防止数量超过库存 ajax请求当前鲜花的库存.

				}
				thisCount = parseInt(thisCount) + 1;
				//更新表..
				alert(thisCount);
				updateShopCar(gid, thisCount);
				$(this).parents("tr").find("td:eq(5)").find("input").val(
						thisCount)
				var cmoney = thisCount * price;
				var countprice = $(this).parents("tr").find("td:eq(6)").text(
						"￥" + cmoney);
			});

	//单个删除
	$(document).on("click", ".delete_btn", function() {
		//1、弹出是否确认删除对话框
		var fname = $(this).parents("tr").find("td:eq(1)").text();
		var deletId = $(this).attr("del-id");
		alert(deletId);
		if (confirm("确认删除【" + fname + "】这条购物车吗？")) {
			$.ajax({
				url : "${APP_PATH}/deletShopCar",
				type : "GET",
				data : "deletId=" + deletId,
				success : function(result) {
					if (result.code == 200) {
						alert("失败");
					} else {
						//回到本页
						getDate(thispage);
						
					}
				}
			});
		}
	});

	//数据展示...
	function show_gwcr(result) {
		$("#shopCar_table tbody").empty();
		var shopCarList = result.extend.pageInfo.list;
		thispage = result.extend.pageInfo.pageNum;//本页面
		$
				.each(
						shopCarList,
						function(index, item) {
							var ckbox = $("<input type='checkbox' class='ck' value="+item.gid+" name='ck'/>");
							var td1 = $("<td></td>").append(ckbox);

							var td201 = ("<td width='15%'><img src=${APP_PATH }/"+item.flower.fimg+"></img></td>");
							var td202 = ("<td width='85%'>" + item.fname + "</td>");
							var tttr = $("<tr></tr>").append(td201).append(
									td202);
							var tb001 = $(
									'<table width="100%" border="0" cellspacing="0" cellpadding="0"></table>')
									.append(tttr);

							var td2 = $("<td colspan='2'></td>").append(tttr);

							var td3 = $("<td class='price'></td>").append(
									"￥" + item.fmoney);
							var spn1 = $("<button class='jian'>-</button>");
							var ipt = $("<input type='text' pattern='^1\d{10}$' value="+item.count+" />");
							var spn2 = $("<button  class='jia'>+</button> ");
							var td4 = $("<td></td>").append(spn1).append(ipt)
									.append(spn2);
							var td5 = $("<td class='price'></td>").append(
									"￥" + item.fprice);

							var btn = $("<button></button>").addClass(
									"btn btn-primary btn-sm delete_btn")
									.append("删除");
							btn.attr("del-id", item.gid);
							var td6 = $("<td>").append(btn);
							$("<tr class='tr_c'></tr>").append(td1).append(td2)
									.append(td3).append(td4).append(td5)
									.append(td6).appendTo(
											"#shopCar_table tbody");
						});

		/**<tr class="tr_d">
		            <td colspan="7">
		            	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		                  <tr>
		                    <td width="75%"><span class="del"><a href="#">删除选中商品</a></span></td>
		                    <td width="11%">已选商品  <strong>1</strong>  件</td>
		                    <td width="14%" class="all_price">合计：<font>￥3083.00</font></td>
		                  </tr>
		                </table>
		            </td>
		          </tr>
		 */

	}

	// 先检查是否登录，是 就拿数据 否则 就直接跳转到登录页
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

	function showPaages(result) {
		if(!if_firstime){
			return false;
		}
		//解析显示分页条,点击分页要可以去下一页....
		alert(123);
		$('#zrg_id').empty();
	   var  pageinfo=result.extend.pageInfo;
		$('#zrg_id').jqPaginator({
		    totalPages: pageinfo.pages,
		    visiblePages: pageinfo.pageSize,
		    currentPage: pageinfo.pageNum,
		    
		    first: '<li class="first" style="display:inline;line-height:24px;height:auto;word-break:break-all;word-wrap : break-word ;"><a href="javascript:void(0);">           首页            </a></li>',
		    prev: '<li class="prev" style="display:inline;line-height:24px;height:auto;word-break:break-all;word-wrap : break-word ;" ><a href="javascript:void(0);">           上一页           </a></li>',
		    next: '<li class="next" style="display:inline;line-height:24px;height:auto;word-break:break-all;word-wrap : break-word ;" ><a href="javascript:void(0);">           下一页           </a></li>',
		    last: '<li class="last" style="display:inline;line-height:24px;height:auto;word-break:break-all;word-wrap : break-word ;" ><a href="javascript:void(0);">           尾页                      </a></li>',
		    page: '<li class="page" style="display:inline;line-height:24px;height:auto;word-break:break-all;word-wrap : break-word ;" ><a href="javascript:void(0);">{{page}}</a></li>',
		   
		    onPageChange: function (page) {  
	           //alert(page + '：' + if_firstime);  
	            if(if_firstime){  
	                if_firstime = false;  
	            }else if(!if_firstime){  
	            	getDate(page) ;
	            }  
		    }   
		});		
	}
</script>
<body class="index">
	这个用户${User};
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
						id="1234567" onfocus="if(value=='请输入关键字') {value=''}"
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
	<div class="menu"></div>
	<div class="w1200">
		<div class="position">
			<a href="#">首页</a>  <a href="#">购物车</a>
		</div>

		<div class="shopcar">
			<div class="shop_lc">
				<span class="sp01">我的购物车</span><span class="sp02">填写提交信息表单</span><span
					class="sp03">在线支付</span>
			</div>
			<dl>
				<dt>
					<span>我的购物车</span>
				</dt>
				<dd>
					<table width="100%" cellpadding="0" cellspacing="0" border="0"
						id="shopCar_table">
						<thead>
							<tr class="tr_t">
								<td width="4%"><input type="checkbox" value=0 id="checkall" /></td>
								<td width="4%">全选</td>
								<td width="35%">商品</td>
								<td width="26%">单价</td>
								<td width="6%">数量</td>
								<td width="14%">小计</td>
								<td width="11%">操作</td>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>

				</dd>


			</dl>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				class="go_tb">
				<tr>
					<td width="20%"><a href="${APP_PATH }/showFlowers"
						class="go_buy">继续购物</a></td>
					<td width="63%">
						<div class="M-box"  id="zrg_id">
							<!-- <div id="page_nav_area"></div> -->
						</div>
					</td>
					<td width="17%" align="right"><button class="code"
							onclick="jiesuan()" id="jieusn">结 算</button></td>
				</tr>
			</table>
			<div class="clear"></div>
		</div>
	</div>
	
	
</body>

</html>
