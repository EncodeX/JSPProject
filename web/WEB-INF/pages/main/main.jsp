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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> /
                <small>一些常用模块</small>
            </div>
        </div>

        <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
            <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>新增页面<br/>2300</a>
            </li>
            <li><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>成交订单<br/>308</a>
            </li>
            <li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>昨日访问<br/>80082</a>
            </li>
            <li><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>在线用户<br/>3000</a>
            </li>
        </ul>

        <div class="am-g">
            <div class="am-u-sm-12">
                <table class="am-table am-table-bd am-table-striped admin-content-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>最后成交任务</th>
                        <th>成交订单</th>
                        <th>管理</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>John Clark</td>
                        <td><a href="#">Business management</a></td>
                        <td><span class="am-badge am-badge-success">+20</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                        data-am-dropdown-toggle><span class="am-icon-cog"></span> <span
                                        class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>风清扬</td>
                        <td><a href="#">公司LOGO设计</a></td>
                        <td><span class="am-badge am-badge-danger">+2</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                        data-am-dropdown-toggle><span class="am-icon-cog"></span> <span
                                        class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>詹姆斯</td>
                        <td><a href="#">开发一款业务数据软件</a></td>
                        <td><span class="am-badge am-badge-warning">+10</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                        data-am-dropdown-toggle><span class="am-icon-cog"></span> <span
                                        class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>云适配</td>
                        <td><a href="#">适配所有网站</a></td>
                        <td><span class="am-badge am-badge-secondary">+50</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                        data-am-dropdown-toggle><span class="am-icon-cog"></span> <span
                                        class="am-icon-caret-down"></span></button>
                                <ul class="am-dropdown-content">
                                    <li><a href="#">1. 编辑</a></li>
                                    <li><a href="#">2. 下载</a></li>
                                    <li><a href="#">3. 删除</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>5</td>
                        <td>呵呵呵</td>
                        <td><a href="#">基兰会获得BUFF</a></td>
                        <td><span class="am-badge">+22</span></td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle"
                                        data-am-dropdown-toggle><span class="am-icon-cog"></span> <span
                                        class="am-icon-caret-down"></span></button>
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
                    <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}">任务 task<span
                            class="am-icon-chevron-down am-fr"></span></div>
                    <div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
                        <ul class="am-list admin-content-task">
                            <li>
                                <div class="admin-task-meta"> Posted on 25/1/2120 by John Clark</div>
                                <div class="admin-task-bd">
                                    The starting place for exploring business management; helping new managers get
                                    started and experienced managers get better.
                                </div>
                                <div class="am-cf">
                                    <div class="am-btn-toolbar am-fl">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button type="button" class="am-btn am-btn-default"><span
                                                    class="am-icon-check"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span
                                                    class="am-icon-pencil"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span
                                                    class="am-icon-times"></span></button>
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
                                            <button type="button" class="am-btn am-btn-default"><span
                                                    class="am-icon-check"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span
                                                    class="am-icon-pencil"></span></button>
                                            <button type="button" class="am-btn am-btn-default"><span
                                                    class="am-icon-times"></span></button>
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
                    <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-3'}">最近留言<span
                            class="am-icon-chevron-down am-fr"></span></div>
                    <div class="am-panel-bd am-collapse am-in am-cf" id="collapse-panel-3">
                        <ul class="am-comments-list admin-content-comment">
                            <li class="am-comment">
                                <a href="#"><img src="http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/96/h/96"
                                                 alt="" class="am-comment-avatar" width="48" height="48"></a>

                                <div class="am-comment-main">
                                    <header class="am-comment-hd">
                                        <div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于
                                            <time>2014-7-12 15:30</time>
                                        </div>
                                    </header>
                                    <div class="am-comment-bd"><p>遵循 “移动优先（Mobile First）”、“渐进增强（Progressive
                                        enhancement）”的理念，可先从移动设备开始开发网站，逐步在扩展的更大屏幕的设备上，专注于最重要的内容和交互，很好。</p>
                                    </div>
                                </div>
                            </li>

                            <li class="am-comment">
                                <a href="#"><img src="http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/96/h/96"
                                                 alt="" class="am-comment-avatar" width="48" height="48"></a>

                                <div class="am-comment-main">
                                    <header class="am-comment-hd">
                                        <div class="am-comment-meta"><a href="#" class="am-comment-author">某人</a> 评论于
                                            <time>2014-7-12 15:30</time>
                                        </div>
                                    </header>
                                    <div class="am-comment-bd"><p>有效减少为兼容旧浏览器的臃肿代码；基于 CSS3
                                        的交互效果，平滑、高效。AMUI专注于现代浏览器（支持HTML5），不再为过时的浏览器耗费资源，为更有价值的用户提高更好的体验。</p>
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
<script src="assets/js/jquery.form.js"></script>
<script src="assets/js/jquery-1.8.0.js"></script>
<!--<![endif]-->
<script src="assets/js/app.js"></script>
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
            }
            else {
                alert("Problem retrieving data:" + xmlhttp.statusText);
            }
        }
    }


    $('#addExpertBtn').click(function () {
        console.log("事件发生");
        $.post("<%=basePath%>userinfo/addExpertToDB",
                {
                    expName: $("input[name='expName']").val(),
                    expPwd: $("input[name='expPwd']").val(),
                    expPwd2:$("input[name='expPwd2']").val(),
                    groID:$("input[name='groID']").val(),
                    status:$("input[name='status']").val()
                },
                function (data, status) {
                    $("#main-content").html(data)
                });
    });

    function formi(url){

    }
    $('#addUnitsBtn').click(function () {
        console.log("事件发生");
        $.ajax({
            cache: true,
            type: 'POST',
            url:'<%=basePath%>userinfo/addUnitsToDB',
            data:$('#addUnits').serialize(),// 你的formid
            async: false,
            error: function(request) {
                alert("Connection error");
            },
            success: function(data) {
                alert("success");
                console.log("hah");
                $("#main-content").html(data);
            }
        });
    });
</script>

</body>
</html>
