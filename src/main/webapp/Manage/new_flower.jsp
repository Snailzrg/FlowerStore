<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Detail Admin - New User Form</title>

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

<!-- libraries -->
<link rel="stylesheet" type="text/css" href="${APP_PATH}/css/lib/font-awesome.css" />
<link rel="stylesheet" href="${APP_PATH}/Manage/css/compiled/new-user.css" type="text/css"
	media="screen" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css' />

<script src="../js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="${APP_PATH}/Manage/js/ajaxfileupload.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>


<body>
	<script type="text/javascript">
/* $(function() {
	alert(1353535353);
		
	$("#headPic").click(function () {
	  $("#zrg_uplord").click(); //隐藏了input:file样式后，点击头像就可以本地上传
		 $("#zrg_uplord").on("change",function(){
	   var objUrl = getObjectURL(this.files[0]) ; //获取图片的路径，该路径不是图片在本地的路径
		  if (objUrl) {
		   $("#headPic").attr("src", objUrl) ; //将图片路径存入src中，显示出图片
		   }
	 }); 
  });
	
	//图片上传
	$("#submit_btn").click(function () {
	    /* var imgurl = document.getElementById("upload").value; 
	    //  $("#addForm").attr('method', 'POST'); 
	    var imgurl = $("#zrg_uplord").val();
	    alert("上传25.."+imgurl);
	     $.ajaxFileUpload({ 
	        url:"../addnewFlower",
	        fileElementId: "zrg_uplord", //文件上传域的ID，这里是input的ID，而不是img的
	        type	:"post",
	        dataType: 'json', //返回值类型 一般设置为json
	        data:$("#addForm").serializeArray(),
	        contentType: "application/x-www-form-urlencoded; charset=utf-8",
	        success: function (result) {
	        	alert("retrun...");
	            console.log(result);
	        }
	    });
	});
	
});

//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null ;
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url ;
}


 */
 $(function () {
     $("#file").change(function (e) {
    	 alert("isuse...");
         var file = e.target.files[0] || e.dataTransfer.files[0];
         $('#photoCover').val(document.getElementById("file").files[0].name);
         if (file) {
             var reader = new FileReader();
             reader.onload = function () {
                 $("img").attr("src", this.result);
             }

             reader.readAsDataURL(file);
         }
     });
 })
//分两步走 将图片的地址追加到表单的img 的影藏的域里面  然后 
</script>
	<!-- 
<form id="mtF" >
    <input type="text" name="fname" value="125" />
     <input type="text" name="fcount" value="158" />
</form>
 -->



	<!-- sidebar -->
	<div id="sidebar-nav">
		<ul id="dashboard-menu">
			<li class="active">
				<div class="pointer">
					<div class="arrow"></div>
					<div class="arrow_border"></div>
				</div> <a href="${APP_PATH}/Manage/index.jsp"> <i class="icon-home"></i> <span>主页</span>
			</a>
			</li>
			<li><a class="dropdown-toggle" href="#"> <i
					class="icon-group"></i> <span>用户管理</span> <i
					class="icon-chevron-down"></i>
			</a>
				<ul class="submenu">
					<li><a href="${APP_PATH}/Manage/user_list.jsp">用户列表</a></li>
					<li><a href="${APP_PATH}/Manage/new-user.jsp">用户新增</a></li>
					<li><a href="${APP_PATH}/Manage/user_profile.jsp">用户信息</a></li>
				</ul></li>
			<li><a href="${APP_PATH}/Manage/tables.jsp"> <i class="icon-th-large"></i> <span>订单</span>
			</a></li>
			<li><a href="${APP_PATH}/Manage/personal_info.jsp"> <i class="icon-cog"></i> <span>My
						Info</span>
			</a></li>
			<li><a class="dropdown-toggle" href="#"> <i
					class="icon-share-alt"></i> <span>管理</span> <i
					class="icon-chevron-down"></i>
			</a>
				<ul class="submenu">
					<li><a href="${APP_PATH}/Manage/signin.jsp">管理登录</a></li>
					<li><a href="${APP_PATH}/adLogout">管理退出</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- end sidebar -->


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
			<div id="pad-wrapper" class="new-user">
				<div class="row-fluid header">
					<h3>新建鲜花商品</h3>
				</div>

				<div class="row-fluid form-wrapper">
					<!-- left column -->
					<div class="span9 with-sidebar">
						<div class="container">
							<div class="control-group">
								<label class="col-md-3 control-label span3"></label>
								<div class="col-md-9">
									<img src="" width="100px" height="100px">
								</div>
							</div>

							<form class="new_user_form inline-input" id="addForm"
								action="${APP_PATH}/addnewFlower" enctype="multipart/form-data"
								method="post">

								<!-- <div class="span12 field-box">
									<label>上传图片:</label> <img id="headPic"
										src="../images/noimage.png" width="60px" height="60px"
										style="padding: 5px"> <input id="upload" name="file"
										accept="image/*" type="file" style="display: none" />
								</div>
								 -->
								<div class="control-group">
									<label for="requirement" class="col-md-3 control-label span3">图片上传</label>
									<div class="col-md-9">
										<div class="input-group">
											<input id="photoCover" class="form-control" readonly
												type="text"> <label class="input-group-btn">
												<input id="file" type="file" accept="image/*" name="file"
												style="left: -9999px; position: absolute;"> <span
												class="btn btn-default">Browse</span>
											</label>
										</div>
									</div>
								</div>

								<div class="span12 field-box">
									<label>鲜花名称:</label> <input class="ui-select span5"
										name="fname" id="fname" type="text" />
								</div>
								
								<div class="span12 field-box">
									<label>鲜花种类:</label>
									<div class="ui-select span5">
										<select id="myselect" name="ftid">
											<c:forEach items="${flowerTypeList }" var="flowerType">
												<option value="${flowerType.ftid}">${flowerType.ftname}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="span12 field-box">
									<label>鲜花描述:</label> <input class="ui-select span5" type="text"
										id="fdetil" name="fdetil" />
								</div>
								<div class="span12 field-box">
									<label>数量:</label> <input class="ui-select span5" type="text"
										id="count" name="count" />
								</div>
								<div class="span12 field-box">
									<label>颜色:</label> <select class="ui-select span5"
										id="colorselect" name="color">
										<option value="红色">红色</option>
										<option value="白色">白色</option>
										<option value="黄色">黄色</option>
										<option value="蓝色">蓝色</option>
										<option value="紫色">紫色</option>
									</select>
								</div>
								<div class="span12 field-box">
									<label>定价:</label> <input class="ui-select span5" type="text"
										id="price" name="price" />
								</div>
								<div class="span11 field-box actions">
									<button class="btn-glow primary" id="submit_btn" type="submit">提交</button>
									<span>OR</span> <input type="reset" value="重设" class="reset" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end main container -->


	<!-- scripts -->
	<!-- 	<script src="http://code.jquery.com/jquery-latest.js"></script>
 -->
	<script src="${APP_PATH}/Manage/js/bootstrap.min.js"></script>
	<script src="${APP_PATH}/Manage/js/theme.js"></script>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>