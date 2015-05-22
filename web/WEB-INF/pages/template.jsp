<%--
  Created by IntelliJ IDEA.
  User: zz
  Date: 2015/4/28
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>辽宁省优秀科技工作者评选系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

    <link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.datetimepicker.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/app.css">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header"
        style="position: fixed;width: 100%; box-shadow: 1px 1px 3px #CCCCCC;-moz-box-shadow: 1px 1px 3px #CCCCCC;  z-index: 9999;">
    <div class="am-topbar-brand">
        <strong>辽宁省优秀科技工作者评选系统</strong>
        <small>后台管理中心</small>
    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
            data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span
            class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="javascript:;">
                    <span class="am-icon-users"></span> 管理员 <span class="am-icon-caret-down"></span>
                </a>
                <ul class="am-dropdown-content">
                    <li><a href="#"><span class="am-icon-power-off"></span> 退出</a></li>
                </ul>
            </li>
            <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="am-nav"
         style="min-width: 260px; top: 51px; border-right: 1px solid #cecece; overflow-x: hidden; overflow-y: auto; position: fixed; bottom: 51px; left: 0;z-index: 1000;box-shadow: 1px 1px 3px #DDDDDD;-moz-box-shadow: 1px 1px 3px #DDDDDD;background: #f3f3f3;">
        <ul class="am-list admin-sidebar-list">
            <li><a href="<%=basePath%>mainindex"><span class="am-icon-home"></span> 首页</a></li>
            <li><a href="<%=basePath%>sysman/main"><span class="am-icon-gear"></span> 系统管理</a></li>
            <li><a href="<%=basePath%>userinfo/main"><span class="am-icon-users"></span> 用户信息管理</a></li>
            <li><a href="<%=basePath%>sbjman/main"><span class="am-icon-pencil-square-o"></span> 学科管理</a></li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-male"></span> 候选人管理
                    <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav1">
                    <li><a href="<%=basePath%>candman/sbjman" class="am-cf"><span class="am-icon-cogs"></span>
                        候选人学科管理</a></li>
                    <li><a href="<%=basePath%>candman/firstresult"><span class="am-icon-cube"></span> 候选人初评结果管理</a></li>
                    <li><a href="<%=basePath%>candman/finalresult"><span class="am-icon-cubes"></span> 候选人终评结果管理</a>
                    </li>
                </ul>
            </li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-child"></span>
                    名额分配管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
                    <li><a href="<%=basePath%>quotaman/recomquota" class="am-cf"><span class="am-icon-file-o"></span>
                        推荐单位提交名额管理</a></li>
                    <li><a href="<%=basePath%>quotaman/firstquota"><span class="am-icon-file-text"></span> 初评名额管理</a>
                    </li>
                    <li><a href="<%=basePath%>quotaman/finalquota"><span class="am-icon-file"></span> 终评名额管理</a></li>
                </ul>
            </li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-bar-chart"></span>
                    投票管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
                    <li><a href="<%=basePath%>voteman/provote" class="am-cf"><span class="am-icon-check"></span> 专家组投票管理</a>
                    </li>
                    <li><a href="<%=basePath%>voteman/councilvote"><span class="am-icon-circle"></span> 评审委员会投票管理</a>
                    </li>
                </ul>
            </li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}"><span class="am-icon-building"></span>
                    推荐单位管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
                    <li><a href="<%=basePath%>departman/citysciassoc" class="am-cf"><span class="am-icon-bank"></span>
                        市科协</a></li>
                    <li><a href="<%=basePath%>departman/sciassoc"><span class="am-icon-circle"></span> 理科学会</a></li>
                    <li><a href="<%=basePath%>departman/engassoc"><span class="am-icon-magnet"></span> 工科学会</a></li>
                    <li><a href="<%=basePath%>departman/agriassoc"><span class="am-icon-tree"></span> 农林学会</a></li>
                    <li><a href="<%=basePath%>departman/mediassoc"><span class="am-icon-plus-circle"></span> 医药学会</a>
                    </li>
                    <li><a href="<%=basePath%>departman/crossassoc"><span class="am-icon-random"></span> 交叉学科学会</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">学科管理</strong> /
                <small>管理学科组信息/增加学科组</small>
            </div>
        </div>

        <div class="am-cf am-padding">
            <form method="post" action="<%=basePath%>sbjman/addSubjectGroup">
                学科组名称<input type="text" name="groName"><br>
                学科组提交名额<input type="text" name="subNum"><br>
                <input type="submit" value="提交">
            </form>
        </div>
    </div>
    <!-- content end -->
</div>

<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer style="width: 260px; min-height: 50px; z-index: 9999;bottom:0;position: fixed;background: #f8f8f8;border: 0 solid #cecece;border-top-width: 1px; border-right-width: 1px;box-shadow: 1px 1px 3px #DDDDDD;-moz-box-shadow: 1px 1px 3px #DDDDDD;">
    <div class="am-topbar-brand am-padding-left">
        <small>© 2015 辽宁省科学技术协会</small>
    </div>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<%=basePath%>assets/js/polyfill/rem.min.js"></script>
<script src="<%=basePath%>assets/js/polyfill/respond.min.js"></script>
<script src="<%=basePath%>assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<%=basePath%>assets/js/jquery.min.js"></script>
<script src="<%=basePath%>assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="<%=basePath%>assets/js/app.js"></script>
<script src="<%=basePath%>assets/js/amazeui.datetimepicker.js"></script>
</body>
</html>
