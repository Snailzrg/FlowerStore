<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
	<title>Detail Admin - New User Form</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="${APP_PATH}/Manage/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="${APP_PATH}/Manage/css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="${APP_PATH}/Manage/css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/elements.css" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/Manage/css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="${APP_PATH}/Manage/css/compiled/new-user.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>

    <!-- navbar -->
    <div class="navbar navbar-inverse">
        <div class="navbar-inner">
         
        </div>
    </div>
    <!-- end navbar -->

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
					<li><a href="Manage/user_list.jsp">用户列表</a></li>
					<!-- <li><a href="new_user.jsp">用户新增</a></li>
					<li><a href="user_profile.jsp">用户信息</a></li> -->
				</ul></li>
			<li><a href="Manage/tables.jsp"> <i class="icon-th-large"></i> <span>订单</span>
			</a></li>
			<li><a class="dropdown-toggle" href="#"> <i
					class="icon-share-alt"></i> <span>管理</span> <i
					class="icon-chevron-down"></i>
			</a>
				<ul class="submenu">
					<li><a href="Manage/AdminLogin.jsp">管理登录</a></li>
					<li><a href="${APP_PATH}/adLogout">管理退出</a></li>
				</ul></li>
		</ul>
	</div>

	<!-- main container -->
    <div class="content">
        <div class="container-fluid">
            <div id="pad-wrapper" class="new-user">
                <div class="row-fluid header">
                    <h3>鲜花修改 ${vaildateFlower.fimg}</h3>
                </div>

                <div class="row-fluid form-wrapper">
                    <!-- left column -->
                    <div class="span9 with-sidebar">
                        <div class="container">
                            <form class="new_user_form inline-input" id="vailflower" />
                                <div class="span12 field-box">
                                    <label>鲜花名称:</label>
                                    <input class="span9" name="fname" id="fname" type="text" value=" ${vaildateFlower.fname}" />
                                </div>
                                <input  type="text" name="fid" style="display: none;" value="${vaildateFlower.fid}"/>
                                <div class="span12 field-box">
                                    <label>鲜花描述:</label>
                                    <input class="span9" type="text" id="fdetil" name="fdetil" value=" ${vaildateFlower.fdetil}"/>
                                </div>
                                <div class="span12 field-box">
                                    <label>数量:</label>
                                    <input class="span9" type="text"  id="count" name="count"  value=" ${vaildateFlower.count}"/>
                                </div>
                                <div class="span12 field-box">
                                    <label>颜色:</label>
                                    <input class="span9" type="text" id="color" name="color" value=" ${vaildateFlower.color}" />
                                </div>
                                <div class="span12 field-box">
                                    <label>定价:</label>
                                    <input class="span9" type="text" id="price" name="price" value=" ${vaildateFlower.price}" />
                                </div>
                           <!--     
                            <div class="span12 field-box">
                              
                                    <label>上传图片:</label>
                                    <input class="span9" type="file" id="fimg" name="fimg" />
                                </div> -->
                                 <div class="span11 field-box actions">
                                    <input type="button" class="btn-glow primary"  id="zrg_tj" value="提交" />
                                    <span>OR</span>
                                    <input type="reset" value="重设" class="reset" />
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- side right column -->
                </div>
            </div>
        </div>
    </div>
    <!-- end main container -->


	<!-- scripts -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="${APP_PATH}/Manage/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/Manage/js/theme.js"></script>

    <script type="text/javascript">
        $(function () {

            // toggle form between inline and normal inputs
            var $buttons = $(".toggle-inputs button");
            var $form = $("form.new_user_form");

            $buttons.click(function () {
                var mode = $(this).data("input");
                $buttons.removeClass("active");
                $(this).addClass("active");

                if (mode === "inline") {
                    $form.addClass("inline-input");
                } else {
                    $form.removeClass("inline-input");
                }
            });
        });
        
        //updateFlower
        $("#zrg_tj").click(function(){
        
        	alert("1234684更新..");
  	$.ajax({
				url : "${APP_PATH}/updateFlower",
				type : "post",
				data : $("#vailflower").serialize(),
				success : function(result) {
					if (result.code == 200) {
						alert("失225败");
					} else {
						alert("ojbk");
						
					}
				}
        	}); 
        });
    </script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>

</html>