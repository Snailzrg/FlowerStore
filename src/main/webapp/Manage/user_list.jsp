<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Detail Admin - User list</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- libraries -->
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/user-list.css" type="text/css" media="screen" />

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
            <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            
            <a class="brand" href="index.html"><img src="img/logo.png" /></a>

            <ul class="nav pull-right">                
                <li class="hidden-phone">
                    <input class="search" type="text" />
                </li>
                <li class="notification-dropdown hidden-phone">
                    <a href="#" class="trigger">
                        <i class="icon-warning-sign"></i>
                        <span class="count">8</span>
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
                                <a href="#" class="item">
                                    <i class="icon-signin"></i> New user registration
                                    <span class="time"><i class="icon-time"></i> 13 min.</span>
                                </a>
                                <a href="#" class="item">
                                    <i class="icon-signin"></i> New user registration
                                    <span class="time"><i class="icon-time"></i> 18 min.</span>
                                </a>
                                <a href="#" class="item">
                                    <i class="icon-envelope-alt"></i> New message from Alejandra
                                    <span class="time"><i class="icon-time"></i> 28 min.</span>
                                </a>
                                <a href="#" class="item">
                                    <i class="icon-signin"></i> New user registration
                                    <span class="time"><i class="icon-time"></i> 49 min.</span>
                                </a>
                                <a href="#" class="item">
                                    <i class="icon-download-alt"></i> New order placed
                                    <span class="time"><i class="icon-time"></i> 1 day.</span>
                                </a>
                                <div class="footer">
                                    <a href="#" class="logout">View all notifications</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="notification-dropdown hidden-phone">
                    <a href="#" class="trigger">
                        <i class="icon-envelope-alt"></i>
                    </a>
                    <div class="pop-dialog">
                        <div class="pointer right">
                            <div class="arrow"></div>
                            <div class="arrow_border"></div>
                        </div>
                        <div class="body">
                            <a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
                            <div class="messages">
                                <a href="#" class="item">
                                    <img src="img/contact-img.png" class="display" />
                                    <div class="name">Alejandra Galván</div>
                                    <div class="msg">
                                        There are many variations of available, but the majority have suffered alterations.
                                    </div>
                                    <span class="time"><i class="icon-time"></i> 13 min.</span>
                                </a>
                                <a href="#" class="item">
                                    <img src="img/contact-img2.png" class="display" />
                                    <div class="name">Alejandra Galván</div>
                                    <div class="msg">
                                        There are many variations of available, have suffered alterations.
                                    </div>
                                    <span class="time"><i class="icon-time"></i> 26 min.</span>
                                </a>
                                <a href="#" class="item last">
                                    <img src="img/contact-img.png" class="display" />
                                    <div class="name">Alejandra Galván</div>
                                    <div class="msg">
                                        There are many variations of available, but the majority have suffered alterations.
                                    </div>
                                    <span class="time"><i class="icon-time"></i> 48 min.</span>
                                </a>
                                <div class="footer">
                                    <a href="#" class="logout">View all messages</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">
                        Your account
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="personal-info.html">Personal info</a></li>
                        <li><a href="#">Account settings</a></li>
                        <li><a href="#">Billing</a></li>
                        <li><a href="#">Export your data</a></li>
                        <li><a href="#">Send feedback</a></li>
                    </ul>
                </li>
                <li class="settings hidden-phone">
                    <a href="personal-info.html" role="button">
                        <i class="icon-cog"></i>
                    </a>
                </li>
                <li class="settings hidden-phone">
                    <a href="signin.html" role="button">
                        <i class="icon-share-alt"></i>
                    </a>
                </li>
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
                </div>
                <a href="index.jsp">
                    <i class="icon-home"></i>
                    <span>主页</span>
                </a>
            </li>            
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-group"></i>
                    <span>用户管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="user_list.jsp">用户列表</a></li>
                    <li><a href="new_user.jsp">用户新增</a></li>
                    <li><a href="user_profile.jsp">用户信息</a></li>
                </ul>
            </li>
            <li>
                <a href="tables.jsp">
                    <i class="icon-th-large"></i>
                    <span>订单</span>
                </a>
            </li>
            <li>
                <a href="personal_info.jsp">
                    <i class="icon-cog"></i>
                    <span>My Info</span>
                </a>
            </li>
            <li>
                <a class="dropdown-toggle" href="#">
                    <i class="icon-share-alt"></i>
                    <span>管理</span>
                    <i class="icon-chevron-down"></i>
                </a>
                <ul class="submenu">
                    <li><a href="AdminLogin.jsp">管理登录</a></li>
                    <li><a href="AdminLogout.jsp">管理退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- end sidebar -->
    

	<!-- main container -->
    <div class="content">
        
        <!-- settings changer -->
        <div class="skins-nav">
            <a href="#" class="skin first_nav selected">
                <span class="icon"></span><span class="text">Default</span>
            </a>
            <a href="#" class="skin second_nav" data-file="css/skins/dark.css">
                <span class="icon"></span><span class="text">Dark skin</span>
            </a>
        </div>
        
        <div class="container-fluid">
            <div id="pad-wrapper" class="users-list">
                <div class="row-fluid header">
                    <h3>Users</h3>
                    <div class="span10 pull-right">
                        <input type="text" class="span5 search" placeholder="Type a user's name..." />
                   
                        <div class="ui-dropdown">
                            <div class="head" data-toggle="tooltip" title="Click me!">
                                Filter users
                                <i class="arrow-down"></i>
                            </div>  
                            <div class="dialog">
                                <div class="pointer">
                                    <div class="arrow"></div>
                                    <div class="arrow_border"></div>
                                </div>
                                <div class="body">
                                    <p class="title">
                                        Show users where:
                                    </p>
                                    <div class="form">
                                        <select>
                                            <option />Name
                                            <option />Email
                                            <option />Number of orders
                                            <option />Signed up
                                            <option />Last seen
                                        </select>
                                        <select>
                                            <option />is equal to
                                            <option />is not equal to
                                            <option />is greater than
                                            <option />starts with
                                            <option />contains
                                        </select>
                                        <input type="text" />
                                        <a class="btn-flat small">Add filter</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <a href="new_user.jsp" class="btn-flat success pull-right">
                            <span>&#43;</span>
                            NEW USER
                        </a>
                    </div>
                </div>

                <!-- Users table -->
                <div class="row-fluid table">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th class="span4 sortable">
                                    Name
                                </th>
                                <th class="span3 sortable">
                                    <span class="line"></span>Signed up
                                </th>
                                <th class="span2 sortable">
                                    <span class="line"></span>Total spent
                                </th>
                                <th class="span3 sortable align-right">
                                    <span class="line"></span>Email
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <tr class="first">
                            <td>
                                <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                <a href="user_profile.jsp" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Mar 13, 2012
                            </td>
                            <td>
                                $ 4,500.00
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                <a href="user_profile.jsp" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Jun 03, 2012
                            </td>
                            <td>
                                $ 549.99
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                <a href="user_profile.jsp" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Mar 01, 2014
                            </td>
                            <td>
                                $ 30.00
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                <a href="user_profile.jsp" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Jan 28, 2012
                            </td>
                            <td>
                                $ 1,320.00
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                <a href="user-profile.h2tml" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                May 16, 2012
                            </td>
                            <td>
                                $ 89.99
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Sep 06, 2012
                            </td>
                            <td>
                                $ 344.00
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Jul 13, 2012
                            </td>
                            <td>
                                $ 800.00
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img2.png" class="img-circle avatar hidden-phone" />
                                <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Feb 13, 2014
                            </td>
                            <td>
                                $ 250.00
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        <!-- row -->
                        <tr>
                            <td>
                                <img src="img/contact-img.png" class="img-circle avatar hidden-phone" />
                                <a href="user-profile.html" class="name">Alejandra Galvan Castillo</a>
                                <span class="subtext">Graphic Design</span>
                            </td>
                            <td>
                                Feb 27, 2014
                            </td>
                            <td>
                                $ 1,300.00
                            </td>
                            <td class="align-right">
                                <a href="#">alejandra@canvas.com</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="pagination pull-right">
                    <ul>
                        <li><a href="#">&#8249;</a></li>
                        <li><a class="active" href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&#8250;</a></li>
                    </ul>
                </div>
                <!-- end users table -->
            </div>
        </div>
    </div>
    <!-- end main container -->


	<!-- scripts -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/theme.js"></script>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>