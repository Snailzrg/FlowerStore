<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Detail Admin - My Info</title>
    
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
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css" />
    
    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/personal-info.css" type="text/css" media="screen" />

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
            <a class="brand" href="index.html"><img src="img/logo.png" /></a>
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="nav-collapse collapse">
                <ul class="nav">
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="chart-showcase.html">Charts</a></li>
                    <li><a href="user-list.html">Users</a></li>
                    <li><a href="form-showcase.html">Forms</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="icons.html">Icons</a></li>
                    <li><a href="calendar.html">Calendar</a></li>
                    <li><a href="tables.html">Tables</a></li>
                    <li><a href="ui-elements.html">UI Elements</a></li>
                </ul>
            </div>
            <ul class="nav pull-right">
                <li class="hidden-phone">
                    <input class="search" type="text" />
                </li>
                <li class="settings">
                    <a href="personal-info.html" role="button">
                        <span class="navbar_icon"></span>
                    </a>
                </li>
                <li id="fat-menu" class="dropdown">
                    <a href="signin.html" role="button" class="logout">
                        <span class="navbar_icon"></span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!-- end navbar -->

	<!-- main container .wide-content is used for this layout without sidebar :)  -->
    <div class="content wide-content">
        <div class="container-fluid">
            <div class="settings-wrapper" id="pad-wrapper">
                <!-- avatar column -->
                <div class="span3 avatar-box">
                    <div class="personal-image">
                        <img src="img/personal-info.png" class="avatar img-circle" />
                        <p>Upload a different photo...</p>
                        
                        <input type="file" />
                    </div>
                </div>

                <!-- edit form column -->
                <div class="span7 personal-info">
                    <div class="alert alert-info">
                        <i class="icon-lightbulb"></i>
                        This page shows an example of an alternative layout with the main navbar on the top
                        <br /> using <strong>.content.wide-content</strong> for this main container
                    </div>
                    <h5 class="personal-title">Personal info</h5>

                    <form />
                        <div class="field-box">
                            <label>First name:</label>
                            <input class="span5 inline-input" type="text" value="Alejandra" />
                        </div>
                        <div class="field-box">
                            <label>Last name:</label>
                            <input class="span5 inline-input" type="text" value="Galvan" />
                        </div>
                        <div class="field-box">
                            <label>Company:</label>
                            <input class="span5 inline-input" type="text" value="Design Co." />
                        </div>
                        <div class="field-box">
                            <label>Email:</label>
                            <input class="span5 inline-input" type="text" value="alejandra@design.com" />
                        </div>
                        <div class="field-box">
                            <label>Time Zone:</label>
                            <div class="ui-select">
                                <select id="user_time_zone" name="user[time_zone]">
                                    <option value="Hawaii" />(GMT-10:00) Hawaii
                                    <option value="Alaska" />(GMT-09:00) Alaska
                                    <option value="Pacific Time (US &amp; Canada)" />(GMT-08:00) Pacific Time (US &amp; Canada)
                                    <option value="Arizona" />(GMT-07:00) Arizona
                                    <option value="Mountain Time (US &amp; Canada)" />(GMT-07:00) Mountain Time (US &amp; Canada)
                                    <option value="Central Time (US &amp; Canada)" selected="selected" />(GMT-06:00) Central Time (US &amp; Canada)
                                    <option value="Eastern Time (US &amp; Canada)" />(GMT-05:00) Eastern Time (US &amp; Canada)
                                    <option value="Indiana (East)" />(GMT-05:00) Indiana (East)                                    
                                </select>
                            </div>
                        </div>
                        <div class="field-box">
                            <label>Username:</label>
                            <input class="span5 inline-input" type="text" value="alegalvan" />
                        </div>
                        <div class="field-box">
                            <label>Password:</label>
                            <input class="span5 inline-input" type="password" value="blablablabla" />
                        </div>
                        <div class="field-box">
                            <label>Confirm password:</label>
                            <input class="span5 inline-input" type="password" value="blablablabla" />
                        </div>
                        <div class="span6 field-box actions">
                            <input type="button" class="btn-glow primary" value="Save Changes" />
                            <span>OR</span>
                            <input type="reset" value="Cancel" class="reset" />
                        </div>
                    </form>
                </div>
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