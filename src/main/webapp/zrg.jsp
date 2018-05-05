<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<script src="${APP_PATH }/js/jquery-1.7.min.js" type="text/javascript"></script>
<body>
	<form class="form">
		<input type="text" value="输入商品关键字" id="flower_search_text"
			name="keyword" class="txt" onfocus="if(value=='输入商品关键字') {value=''}"
			onblur="if(value=='') {value='输入商品关键字'}" /> <input type="button"
			value="搜索" id="flower_search" class="sub" />
	</form>
	
       <form class="form">
        	<p class="p01"><span>会员登录</span><a href="reg.jsp">快速注册</a></p>
        	<p class="p02">账户名<input type="text" value="账户名" id="uname" name="uname" class="txt" onfocus="if(value=='账户名') {value=''}" onblur="if(value=='') {value='账户名'}"/></p>
            <p class="p03">密码<input type="password" value="密码" id="upwd" name="upwd" class="txt" onfocus="if(value=='密码') {value=''}" onblur="if(value=='') {value='密码'}"/></p>
            <p class="p05"><input type="button"  id="login_button" value="立即登陆" class="sub"/></p>    
        </form>


</body>
<script type="text/javascript">
	$(function() {
		//去首页
		//to_page(1);
	//	alert(1213);
	});

	$("#flower_search").click(function() {

		var dt = $("#flower_search_text").val();
		alert(dt);
	});
	
	
	
	$("#login_button").click(function() {
		alert(123);
		var unamedt = $("#uname").val();
		var upwddt = $("#upwd").val();
	
		$.ajax({
			url:"${APP_PATH}/testZrg",
			type:"POST",
			data :{uname:unamedt,upwd:upwddt},
		
			success:function(result){
				if(result.code==100){
			
				alert('yes2');
				$(location).attr('href', "${APP_PATH}/view/index.jsp");
				}else{
		
					alert('登录失败');
				}

			}
		});
		
	});
	
	
	
	  /*    $("#emp_add_modal_btn").click(function(){
	//清除表单数据（表单完整重置（表单的数据，表单的样式））
	reset_form("#empAddModal form");
	//s$("")[0].reset();
	//发送ajax请求，查出部门信息，显示在下拉列表中
	getDepts("#empAddModal select");
	//弹出模态框
	$("#empAddModal").modal({
		backdrop:"static"
	});
	
});
//查出所有的部门信息并显示在下拉列表中
function getDepts(ele){
	//清空之前下拉列表的值
	$(ele).empty();
	$.ajax({
		url:"${APP_PATH}/depts",
		type:"GET",
		success:function(result){
			//{"code":100,"msg":"处理成功！",
				//"extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"测试部"}]}}
			//console.log(result);
			//显示部门信息在下拉列表中
			//$("#empAddModal select").append("")
		
				$.each(result.extend.depts,function(){
				var optionEle = $("<option></option>").append(this.deprName).attr("value",this.deptId);
	 	         optionEle.appendTo(ele);
			}); 
		}
	});
	
}
  */
 
</script>

</html>