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
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>辽宁省优秀科技工作者评选系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

    <meta name="apple-mobile-web-app-title" content="辽宁省优秀科技工作者评选系统"/>
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/amazeui.datetimepicker.css">

</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header"
        style="position: fixed;width: 100%; box-shadow: 1px 1px 3px #CCCCCC;-moz-box-shadow: 1px 1px 3px #CCCCCC;  z-index: 1000;">
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
            <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>mainindex')"><span
                    class="am-icon-home"></span> 首页</a></li>
            <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>sysman/main')"><span
                    class="am-icon-gear"></span> 系统管理</a></li>
            <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>userinfo/main')"><span
                    class="am-icon-users"></span> 用户信息管理</a></li>
            <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>sbjman/main')"><span
                    class="am-icon-pencil-square-o"></span> 学科管理</a></li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-male"></span> 候选人管理
                    <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav1">
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>candman/sbjman')"><span
                            class="am-icon-cogs"></span> 候选人学科管理</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>candman/firstresult')"><span
                            class="am-icon-cube"></span> 候选人初评结果管理</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>candman/finalresult')"><span
                            class="am-icon-cubes"></span> 候选人终评结果管理</a></li>
                </ul>
            </li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-child"></span>
                    名额分配管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
                    <%--<li><a href="<%=basePath%>quotaman/recomquota" class="am-cf"><span class="am-icon-file-o"></span> 推荐单位提交名额管理</a></li>--%>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>quotaman/recomquota')"><span
                            class="am-icon-file-o"></span> 推荐单位提交名额管理</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>quotaman/firstquota')"><span
                            class="am-icon-file-text"></span> 初评名额管理</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>quotaman/finalquota')"><span
                            class="am-icon-file"></span> 终评名额管理</a></li>
                </ul>
            </li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-bar-chart"></span>
                    投票管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>voteman/provote')"><span
                            class="am-icon-check"></span> 专家组投票管理</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>voteman/councilvote')"><span
                            class="am-icon-circle"></span> 评审委员会投票管理</a></li>
                </ul>
            </li>

            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}" href="#"
                   onclick="refresh_Content('<%=basePath%>departman/main')"><span class="am-icon-building"></span>
                    推荐单位管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>departman/citysciassoc')"><span
                            class="am-icon-bank"></span> 市科协</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>departman/sciassoc')"><span
                            class="am-icon-circle"></span> 理科学会</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>departman/engassoc')"><span
                            class="am-icon-magnet"></span> 工科学会</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>departman/agriassoc')"><span
                            class="am-icon-tree"></span> 农林学会</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>departman/mediassoc')"><span
                            class="am-icon-plus-circle"></span> 医药学会</a></li>
                    <li><a href="#" class="am-cf" onclick="refresh_Content('<%=basePath%>departman/crossassoc')"><span
                            class="am-icon-random"></span> 交叉学科学会</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div id="main-content" class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>一些常用模块</small></div>
        </div>

        <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
            <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>新增页面<br/>2300</a></li>
            <li><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>成交订单<br/>308</a></li>
            <li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>昨日访问<br/>80082</a></li>
            <li><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>在线用户<br/>3000</a></li>
        </ul>

        <div class="am-g">
            <div class="am-u-sm-12">
                <table class="am-table am-table-bd am-table-striped admin-content-table">
                    <thead>
                    <tr>
                        <th>ID</th><th>用户名</th><th>最后成交任务</th><th>成交订单</th><th>管理</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr><td>1</td><td>John Clark</td><td><a href="#">Business management</a></td> <td><span class="am-badge am-badge-success">+20</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr><td>2</td><td>风清扬</td><td><a href="#">公司LOGO设计</a> </td><td><span class="am-badge am-badge-danger">+2</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr><td>3</td><td>詹姆斯</td><td><a href="#">开发一款业务数据软件</a></td><td><span class="am-badge am-badge-warning">+10</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr><td>4</td><td>云适配</td><td><a href="#">适配所有网站</a></td><td><span class="am-badge am-badge-secondary">+50</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>5</td><td>呵呵呵</td>
                        <td><a href="#">基兰会获得BUFF</a></td>
                        <td><span class="am-badge">+22</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-md-6">
                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-1'}">文件上传<span class="am-icon-chevron-down am-fr" ></span></div>
                    <div class="am-panel-bd am-collapse am-in" id="collapse-panel-1">
                        <ul class="am-list admin-content-file">
                            <li>
                                <strong><span class="am-icon-upload"></span> Kong-cetian.Mp3</strong>
                                <p>3.3 of 5MB - 5 mins - 1MB/Sec</p>
                                <div class="am-progress am-progress-striped am-progress-sm am-active">
                                    <div class="am-progress-bar am-progress-bar-success" style="width: 82%">82%</div>
                                </div>
                            </li>
                            <li>
                                <strong><span class="am-icon-check"></span> 好人-cetian.Mp3</strong>
                                <p>3.3 of 5MB - 5 mins - 3MB/Sec</p>
                            </li>
                            <li>
                                <strong><span class="am-icon-check"></span> 其实都没有.Mp3</strong>
                                <p>3.3 of 5MB - 5 mins - 3MB/Sec</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-2'}">浏览器统计<span class="am-icon-chevron-down am-fr" ></span></div>
                    <div id="collapse-panel-2" class="am-in">
                        <table class="am-table am-table-bd am-table-bdrs am-table-striped am-table-hover">
                            <tbody>
                            <tr>
                                <th class="am-text-center">#</th>
                                <th>浏览器</th>
                                <th>访问量</th>
                            </tr>
                            <tr>
                                <td class="am-text-center"><img src="assets/i/examples/admin-chrome.png" alt=""></td>
                                <td>Google Chrome</td>
                                <td>3,005</td>
                            </tr>
                            <tr>
                                <td class="am-text-center"><img src="assets/i/examples/admin-firefox.png" alt=""></td>
                                <td>Mozilla Firefox</td>
                                <td>2,505</td>
                            </tr>
                            <tr>
                                <td class="am-text-center"><img src="assets/i/examples/admin-ie.png" alt=""></td>
                                <td>Internet Explorer</td>
                                <td>1,405</td>
                            </tr>
                            <tr>
                                <td class="am-text-center"><img src="assets/i/examples/admin-opera.png" alt=""></td>
                                <td>Opera</td>
                                <td>4,005</td>
                            </tr>
                            <tr>
                                <td class="am-text-center"><img src="assets/i/examples/admin-safari.png" alt=""></td>
                                <td>Safari</td>
                                <td>505</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="am-u-md-6">
                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}">任务 task<span class="am-icon-chevron-down am-fr" ></span></div>
                    <div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
                        <ul class="am-list admin-content-task">
                            <li>
                                <div class="admin-task-meta"> Posted on 25/1/2120 by John Clark</div>
                                <div class="admin-task-bd">
                                    The starting place for exploring business management; helping new managers get started and experienced managers get better.
                                </div>
                                <div class="am-cf">
                                    <div class="am-btn-toolbar am-fl">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-check"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-pencil"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-times"></span></button>
                                        </div>
                                    </div>
                                    <div class="am-fr">
                                        <button type="button" class="am-btn am-btn-default am-btn-xs">删除</button>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="admin-task-meta"> Posted on 25/1/2120 by 呵呵呵</div>
                                <div class="admin-task-bd">
                                    基兰和狗熊出现在不同阵营时。基兰会获得BUFF，“装甲熊憎恨者”。狗熊会获得BUFF，“时光老人憎恨者”。
                                </div>
                                <div class="am-cf">
                                    <div class="am-btn-toolbar am-fl">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-check"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-pencil"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-times"></span></button>
                                        </div>
                                    </div>
                                    <div class="am-fr">
                                        <button type="button" class="am-btn am-btn-default am-btn-xs">删除</button>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="am-panel am-panel-default">
                    <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-3'}">最近留言<span class="am-icon-chevron-down am-fr" ></span></div>
                    <div class="am-panel-bd am-collapse am-in am-cf" id="collapse-panel-3">
                        <ul class="am-comments-list admin-content-comment">
                            <li class="am-comment">
                                <a href="#"><img src="http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/96/h/96" alt="" class="am-comment-avatar" width="48" height="48"></a>
                                <div class="am-comment-main">
                                    <header class="am-comment-hd">
                                        <div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-12 15:30</time></div>
                                    </header>
                                    <div class="am-comment-bd"><p>遵循 “移动优先（Mobile First）”、“渐进增强（Progressive enhancement）”的理念，可先从移动设备开始开发网站，逐步在扩展的更大屏幕的设备上，专注于最重要的内容和交互，很好。</p>
                                    </div>
                                </div>
                            </li>

                            <li class="am-comment">
                                <a href="#"><img src="http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/96/h/96" alt="" class="am-comment-avatar" width="48" height="48"></a>
                                <div class="am-comment-main">
                                    <header class="am-comment-hd">
                                        <div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于 <time>2014-7-12 15:30</time></div>
                                    </header>
                                    <div class="am-comment-bd"><p>有效减少为兼容旧浏览器的臃肿代码；基于 CSS3 的交互效果，平滑、高效。AMUI专注于现代浏览器（支持HTML5），不再为过时的浏览器耗费资源，为更有价值的用户提高更好的体验。</p>
                                    </div>
                                </div>
                            </li>

                        </ul>
                        <ul class="am-pagination am-fr admin-content-pagination">
                            <li class="am-disabled"><a href="#">&laquo;</a></li>
                            <li class="am-active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- content end -->
</div>

<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer style="width: 260px; min-height: 50px; z-index: 1000;bottom:0;position: fixed;background: #f8f8f8;border: 0 solid #cecece;border-top-width: 1px; border-right-width: 1px;box-shadow: 1px 1px 3px #DDDDDD;-moz-box-shadow: 1px 1px 3px #DDDDDD;">
    <div class="am-topbar-brand am-padding-left">
        <small>© 2015 辽宁省科学技术协会</small>
    </div>
</footer>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="assets/js/app.js"></script>
<script src="<%=basePath%>assets/js/amazeui.datetimepicker.js"></script>
<%--<script src ="assets/js/jquery.form.js"></script>--%>
<script>
    var xmlhttp;
    function refresh_Content(url) {
        xmlhttp = new XMLHttpRequest();
        if (xmlhttp != null) {
            console.log("事件发生");
            xmlhttp.onreadystatechange = state_Change;
            xmlhttp.open("GET", url, true);
            xmlhttp.send(null);
        }
    }
    function state_Change() {
        if (xmlhttp.readyState == 4) {// 4 = "loaded"
            if (xmlhttp.status == 200) {// 200 = "OK"
                document.getElementById('main-content').innerHTML = xmlhttp.responseText;
                refreshselect();
                refreshTimePicker();
            }
            else {
                alert("Problem retrieving data:" + xmlhttp.statusText);
            }
        }
    }
    function post_form(url,div_id) {
        console.log("事件发生");
        $.ajax({
            cache: true,
            type: "POST",
            url: url,
            data: $(div_id).serialize(),// 你的formid
            async: false,
            error: function (request) {
                alert("操作失败！");
            },
            success: function (data) {
                alert("操作成功！");
                console.log("success");
                $("#main-content").empty().append(data);
                refreshselect();
                refreshTimePicker();
            }
        });
    }


    ///YXH///

    var subcat = new Array();
    var biglist = new Array('市科协', '理科学会', '工科学会', '农林学会', '医药学会', '交叉学科学会');
    subcat[0] = new Array('0', '沈阳市科协', '沈阳市科协')
    subcat[1] = new Array('1', '辽宁省物理学会', '辽宁省物理学会')
    subcat[2] = new Array('1', '辽宁省力学学会', '辽宁省力学学会')
    subcat[3] = new Array('1', '辽宁省气象学会', '辽宁省气象学会')
    subcat[4] = new Array('1', '辽宁省地质学会', '辽宁省地质学会')
    subcat[5] = new Array('1', '辽宁省地理学会', '辽宁省地理学会')
    subcat[6] = new Array('1', '辽宁省海洋学会', '辽宁省海洋学会')
    subcat[7] = new Array('1', '辽宁省地震学会', '辽宁省地震学会')
    subcat[8] = new Array('1', '辽宁省动物学会', '辽宁省动物学会')
    subcat[9] = new Array('1', '辽宁省昆虫学会', '辽宁省昆虫学会')
    subcat[10] = new Array('1', '辽宁省生态学学会', '辽宁省生态学学会')
    subcat[11] = new Array('1', '辽宁省微生物学会', '辽宁省微生物学会')
    subcat[12] = new Array('1', '辽宁省环境科学学会', '辽宁省环境科学学会')
    subcat[13] = new Array('1', '辽宁省野生动物保护协会', '辽宁省野生动物保护协会')
    subcat[14] = new Array('1', '辽宁省地球物理学会', '辽宁省地球物理学会')
    subcat[15] = new Array('1', '辽宁省生物技术协会', '辽宁省生物技术协会')
    subcat[16] = new Array('1', '辽宁省数学会', '辽宁省数学会')
    subcat[17] = new Array('2', '辽宁省机械工程学会', '辽宁省机械工程学会')
    subcat[18] = new Array('2', '辽宁省电机工程学会', '辽宁省电机工程学会')
    subcat[19] = new Array('2', '辽宁省电工技术学会', '辽宁省电工技术学会')
    subcat[20] = new Array('2', '辽宁省水利学会', '辽宁省水利学会')
    subcat[21] = new Array('2', '辽宁省复合材料学会', '辽宁省复合材料学会')
    subcat[22] = new Array('2', '辽宁省制冷学会', '辽宁省制冷学会')
    subcat[23] = new Array('2', '辽宁省自动化学会', '辽宁省自动化学会')
    subcat[24] = new Array('2', '辽宁省计量测试学会', '辽宁省计量测试学会')
    subcat[25] = new Array('2', '辽宁省标准化协会', '辽宁省标准化协会')
    subcat[26] = new Array('2', '辽宁省图学学会', '辽宁省图学学会')
    subcat[27] = new Array('2', '辽宁省计算机学会', '辽宁省计算机学会')
    subcat[28] = new Array('2', '辽宁省通信学会', '辽宁省通信学会')
    subcat[29] = new Array('2', '辽宁省测绘学会', '辽宁省测绘学会')
    subcat[30] = new Array('2', '辽宁省造船工程学会', '辽宁省造船工程学会')
    subcat[31] = new Array('2', '辽宁省航海学会', '辽宁省航海学会')
    subcat[32] = new Array('2', '辽宁省铁道学会', '辽宁省铁道学会')
    subcat[33] = new Array('2', '辽宁省公路学会', '辽宁省公路学会')
    subcat[34] = new Array('2', '辽宁省航空宇航学会', '辽宁省航空宇航学会')
    subcat[35] = new Array('2', '辽宁省兵工学会', '辽宁省兵工学会')
    subcat[36] = new Array('2', '辽宁省金属学会', '辽宁省金属学会')
    subcat[37] = new Array('2', '辽宁省有色金属学会', '辽宁省有色金属学会')
    subcat[38] = new Array('2', '辽宁省腐蚀与防护学会', '辽宁省腐蚀与防护学会')
    subcat[39] = new Array('2', '辽宁省核学会', '辽宁省核学会')
    subcat[40] = new Array('2', '辽宁省石油石化学会', '辽宁省石油石化学会')
    subcat[41] = new Array('2', '辽宁省可再生能源学会', '辽宁省可再生能源学会')
    subcat[42] = new Array('2', '辽宁省土木建筑学会', '辽宁省土木建筑学会')
    subcat[43] = new Array('2', '辽宁省纺织工程学会', '辽宁省纺织工程学会')
    subcat[44] = new Array('2', '辽宁省印刷技术协会', '辽宁省印刷技术协会')
    subcat[45] = new Array('2', '辽宁省仪器仪表学会', '辽宁省仪器仪表学会')
    subcat[46] = new Array('2', '辽宁省地方供电设施管理学会', '辽宁省地方供电设施管理学会')
    subcat[47] = new Array('2', '辽宁省烟草学会', '辽宁省烟草学会')
    subcat[48] = new Array('2', '辽宁省振动工程学会', '辽宁省振动工程学会')
    subcat[49] = new Array('2', '辽宁省颗粒学会', '辽宁省颗粒学会')
    subcat[50] = new Array('2', '辽宁省消防协会', '辽宁省消防协会')
    subcat[51] = new Array('2', '辽宁省人工智能学会', '辽宁省人工智能学会')
    subcat[52] = new Array('2', '辽宁省质量协会', '辽宁省质量协会')
    subcat[53] = new Array('2', '辽宁省人民防空学会', '辽宁省人民防空学会')
    subcat[54] = new Array('2', '辽宁省包装联合会', '辽宁省包装联合会')
    subcat[55] = new Array('2', '辽宁省互联网协会', '辽宁省互联网协会')
    subcat[56] = new Array('2', '辽宁省分析测试协会', '辽宁省分析测试协会')
    subcat[57] = new Array('2', '辽宁省化工学会', '辽宁省化工学会')
    subcat[58] = new Array('0', '大连市科协', '大连市科协')
    subcat[59] = new Array('0', '鞍山市科协', '鞍山市科协')
    subcat[60] = new Array('0', '抚顺市科协', '抚顺市科协')
    subcat[61] = new Array('0', '本溪市科协', '本溪市科协')
    subcat[62] = new Array('0', '丹东市科协', '丹东市科协')
    subcat[63] = new Array('0', '锦州市科协', '锦州市科协')
    subcat[64] = new Array('0', '营口市科协', '营口市科协')
    subcat[65] = new Array('0', '阜新市科协', '阜新市科协')
    subcat[66] = new Array('0', '辽阳市科协', '辽阳市科协')
    subcat[67] = new Array('0', '铁岭市科协', '铁岭市科协')
    subcat[68] = new Array('0', '朝阳市科协', '朝阳市科协')
    subcat[69] = new Array('0', '盘锦市科协', '盘锦市科协')
    subcat[70] = new Array('0', '葫芦岛市科协', '葫芦岛市科协')
    subcat[58] = new Array('0', '大连市科协', '大连市科协')
    subcat[59] = new Array('0', '鞍山市科协', '鞍山市科协')
    subcat[60] = new Array('0', '抚顺市科协', '抚顺市科协')
    subcat[61] = new Array('0', '本溪市科协', '本溪市科协')
    subcat[62] = new Array('0', '丹东市科协', '丹东市科协')
    subcat[63] = new Array('0', '锦州市科协', '锦州市科协')
    subcat[64] = new Array('0', '营口市科协', '营口市科协')
    subcat[65] = new Array('0', '阜新市科协', '阜新市科协')
    subcat[66] = new Array('0', '辽阳市科协', '辽阳市科协')
    subcat[67] = new Array('0', '铁岭市科协', '铁岭市科协')
    subcat[68] = new Array('0', '朝阳市科协', '朝阳市科协')
    subcat[69] = new Array('0', '盘锦市科协', '盘锦市科协')
    subcat[70] = new Array('0', '葫芦岛市科协', '葫芦岛市科协')
    subcat[71] = new Array('3', '辽宁省农学会', '辽宁省农学会')
    subcat[72] = new Array('3', '辽宁省林学会', '辽宁省林学会')
    subcat[73] = new Array('3', '辽宁省土壤学会', '辽宁省土壤学会')
    subcat[74] = new Array('3', '辽宁省水产学会', '辽宁省水产学会')
    subcat[75] = new Array('3', '辽宁省畜牧兽医学会', '辽宁省畜牧兽医学会')
    subcat[76] = new Array('3', '辽宁省水土保持学会', '辽宁省水土保持学会')
    subcat[77] = new Array('3', '辽宁省农业经济学会', '辽宁省农业经济学会')
    subcat[78] = new Array('3', '辽宁省土地学会', '辽宁省土地学会')
    subcat[79] = new Array('3', '辽宁省食品科学技术学会', '辽宁省食品科学技术学会')
    subcat[80] = new Array('3', '辽宁省花卉协会', '辽宁省花卉协会')
    subcat[81] = new Array('3', '辽宁省园艺学会', '辽宁省园艺学会')
    subcat[82] = new Array('3', '辽宁省食品质量与安全学会', '辽宁省食品质量与安全学会')
    subcat[83] = new Array('3', '辽宁省植物保护学会', '辽宁省植物保护学会')
    subcat[84] = new Array('3', '辽宁省作物学会', '辽宁省作物学会')
    subcat[86] = new Array('4', '辽宁省中医药学会', '辽宁省中医药学会')
    subcat[87] = new Array('4', '辽宁省药学会', '辽宁省药学会')
    subcat[88] = new Array('4', '辽宁省护理学会', '辽宁省护理学会')
    subcat[89] = new Array('4', '辽宁省营养学会', '辽宁省营养学会')
    subcat[90] = new Array('4', '辽宁省针灸学会', '辽宁省针灸学会')
    subcat[91] = new Array('4', '辽宁省防痨协会', '辽宁省防痨协会')
    subcat[92] = new Array('4', '辽宁省心理卫生协会', '辽宁省心理卫生协会')
    subcat[93] = new Array('4', '辽宁省抗癌协会', '辽宁省抗癌协会')
    subcat[94] = new Array('4', '辽宁省抗癌协会', '辽宁省抗癌协会')
    subcat[95] = new Array('4', '辽宁省康复医学会', '辽宁省康复医学会')
    subcat[96] = new Array('4', '辽宁省预防医学会', '辽宁省预防医学会')
    subcat[97] = new Array('4', '辽宁省法医学会', '辽宁省法医学会')
    subcat[98] = new Array('4', '辽宁省中西医结合学会', '辽宁省中西医结合学会')
    subcat[99] = new Array('4', '辽宁省生命科学学会', '辽宁省生命科学学会')
    subcat[100] = new Array('4', '辽宁省医学影像学会', '辽宁省医学影像学会')
    subcat[101] = new Array('4', '辽宁省性病艾滋病防治协会', '辽宁省性病艾滋病防治协会')
    subcat[102] = new Array('4', '辽宁省按摩协会', '辽宁省按摩协会')
    subcat[103] = new Array('4', '辽宁省蒙医药学会', '辽宁省蒙医药学会')
    subcat[104] = new Array('4', '辽宁省职工疗养学会', '辽宁省职工疗养学会')
    subcat[105] = new Array('4', '辽宁省细胞生物学学会', '辽宁省细胞生物学学会')
    subcat[106] = new Array('4', '辽宁省超声医学工程学会', '辽宁省超声医学工程学会')
    subcat[107] = new Array('4', '辽宁省亚健康学会', '辽宁省亚健康学会')
    subcat[108] = new Array('4', '辽宁省手法诊疗研究会', '辽宁省手法诊疗研究会')
    subcat[109] = new Array('4', '辽宁省糖尿病医学营养防治学会', '辽宁省糖尿病医学营养防治学会')
    subcat[111] = new Array('5', '辽宁省卫生法学会', '辽宁省卫生法学会')
    subcat[112] = new Array('5', '辽宁省科学技术情报学会', '辽宁省科学技术情报学会')
    subcat[113] = new Array('5', '辽宁省图书馆学会', '辽宁省图书馆学会')
    subcat[114] = new Array('5', '辽宁省科普作家协会', '辽宁省科普作家协会')
    subcat[115] = new Array('5', '辽宁省档案学会', '辽宁省档案学会')
    subcat[116] = new Array('5', '辽宁省老科技工作者协会', '辽宁省老科技工作者协会')
    subcat[117] = new Array('5', '辽宁省中直企事业会计学会', '辽宁省中直企事业会计学会')
    subcat[118] = new Array('5', '辽宁省会计学会', '辽宁省会计学会')
    subcat[119] = new Array('5', '辽宁省民族科普协会', '辽宁省民族科普协会')
    subcat[120] = new Array('5', '辽宁省人才研究会', '辽宁省人才研究会')
    subcat[121] = new Array('5', '辽宁省继续工程教育协会', '辽宁省继续工程教育协会')
    subcat[122] = new Array('5', '辽宁省技术经济研究会', '辽宁省技术经济研究会')
    subcat[123] = new Array('5', '辽宁省珠算心算协会', '辽宁省珠算心算协会')
    subcat[124] = new Array('5', '辽宁省发明协会', '辽宁省发明协会')
    subcat[125] = new Array('5', '辽宁省管理科学研究会', '辽宁省管理科学研究会')
    subcat[126] = new Array('5', '辽宁省策划学会', '辽宁省策划学会')
    subcat[127] = new Array('5', '辽宁省营养师协会', '辽宁省营养师协会')
    subcat[128] = new Array('5', '辽宁省理财规划师协会', '辽宁省理财规划师协会')
    subcat[129] = new Array('5', '辽宁省可持续发展促进会', '辽宁省可持续发展促进会')
    subcat[130] = new Array('5', '辽宁省科技新闻学会', '辽宁省科技新闻学会')
    subcat[131] = new Array('5', '辽宁省心理咨询师协会', '辽宁省心理咨询师协会')
    subcat[132] = new Array('5', '辽宁省认知科学学会', '辽宁省认知科学学会')
    subcat[133] = new Array('5', '辽宁省社会组织发展促进会', '辽宁省社会组织发展促进会')
    subcat[134] = new Array('5', '辽宁省传播与科技研究会', '辽宁省传播与科技研究会')
    subcat[135] = new Array('5', '辽宁省老干部摄影协会', '辽宁省老干部摄影协会')
    subcat[136] = new Array('5', '辽宁省科技创新与人才培养研究会', '辽宁省科技创新与人才培养研究会')
    subcat[137] = new Array('5', '辽宁省民营科技企业家协会', '辽宁省民营科技企业家协会')
    subcat[138] = new Array('5', '辽宁省农村专业技术协会', '辽宁省农村专业技术协会')
    subcat[139] = new Array('5', '辽宁省科学发展研究会', '辽宁省科学发展研究会')
    subcat[140] = new Array('5', '辽宁省区域协调发展研究会', '辽宁省区域协调发展研究会')
    subcat[141] = new Array('5', '辽宁省青少年科技辅导员协会', '辽宁省青少年科技辅导员协会')

    function changeselect1(locationid) {
        for (j = 0; j < biglist.length; j++)
            if (biglist[j] == locationid) {
                locationid = j;
            }
        document.submit_form.unitName.length = 0;//初始化下拉列表，清空下拉数据
        document.submit_form.unitName.options[0] = new Option('所有小类', '所有小类');//给第一个值
        for (i = 0; i < subcat.length; i++) {
            if (subcat[i][0] == locationid) {
                document.submit_form.unitName.options[document.submit_form.unitName.length] = new Option(subcat[i][1], subcat[i][2]);
            }//建立option
        }
    }

    ////////////////
    function refreshselect() {
        // 使用默认参数
        $("select").selected();

        // 设置参数
        $("select").selected({
            btnWidth: '300px',
            btnSize: 'sm',
            btnStyle: 'primary',
            maxHeight: '100px'
        });
    }
    $(function() {
        refreshselect();
    });

    //////Time Picker
    function refreshTimePicker(){
        $('#proposerOpenTime').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            autoclose: true,
            todayBtn: true
        }).on('changeDate', function(ev){
            // 使用 getTime() 函数来获取更改后的时间（格式为时间戳数）
            console.log(ev.date.getTime());
        });

        $('#proposerCloseTime').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            autoclose: true,
            todayBtn: true
        }).on('changeDate', function(ev){
            console.log(ev.date.getTime());
        });

        $('#resUnitsOpenTime').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            autoclose: true,
            todayBtn: true
        }).on('changeDate', function(ev){
            console.log(ev.date.getTime());
        });

        $('#resUnitsCloseTime').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            autoclose: true,
            todayBtn: true
        }).on('changeDate', function(ev){
            console.log(ev.date.getTime());
        });

        $('#expertOpenTime').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            autoclose: true,
            todayBtn: true
        }).on('changeDate', function(ev){
            console.log(ev.date.getTime());
        });

        $('#expertCloseTime').datetimepicker({
            format: 'yyyy-mm-dd hh:ii',
            autoclose: true,
            todayBtn: true
        }).on('changeDate', function(ev){
            console.log(ev.date.getTime());
        });

        showTip();
    }

    function showTip(){
        var $modal = $('#my-alert');
        $modal.modal('open');
    }
</script>

</body>
</html>
