<%--
  Created by IntelliJ IDEA.
  User: zz
  Date: 2015/4/28
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/amazeui.datetimepicker.css">
</head>
<body onload="showTip()">
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
    以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar admin-header">
    <div class="am-topbar-brand">
        <strong>辽宁省优秀科技工作者评选系统</strong> <small>后台管理中心</small>
    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

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
            <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>


<%--更新状态提示框|||在主页时不显示 仅在更新提交后变化--%>
<c:if test="${ischange==true}">
    <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">${messageTitle}</div>
            <div class="am-modal-bd">
                ${messageEntity}
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function showTip(){
            var $modal = $('#my-alert');
            $modal.modal('open');
        }
    </script>
</c:if>



<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <ul class="am-list admin-sidebar-list">
                <li><a href="<%=basePath%>mainindex"><span class="am-icon-home"></span> 首页</a></li>
                <li><a href="<%=basePath%>sysman/main"><span class="am-icon-gear"></span> 系统管理</a></li>
                <li><a href="<%=basePath%>userinfo/main"><span class="am-icon-users"></span> 用户信息管理</a></li>
                <li><a href="<%=basePath%>sbjman/main"><span class="am-icon-pencil-square-o"></span> 学科管理</a></li>

                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-male"></span> 候选人管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav1">
                        <li><a href="admin-user.html" class="am-cf"><span class="am-icon-cogs"></span> 候选人学科管理</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-cube"></span> 候选人初评结果管理</a></li>
                        <li><a href="admin-gallery.html"><span class="am-icon-cubes"></span> 候选人终评结果管理</a></li>
                    </ul>
                </li>

                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-child"></span> 名额分配管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
                        <li><a href="admin-user.html" class="am-cf"><span class="am-icon-file-o"></span> 推荐单位提交名额管理</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-file-text"></span> 初评名额管理</a></li>
                        <li><a href="admin-gallery.html"><span class="am-icon-file"></span> 终评名额管理</a></li>
                    </ul>
                </li>

                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-bar-chart"></span> 投票管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
                        <li><a href="admin-user.html" class="am-cf"><span class="am-icon-check"></span> 专家组投票管理</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-circle"></span> 评审委员会投票管理</a></li>
                    </ul>
                </li>

                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}"><span class="am-icon-building"></span> 推荐单位管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
                        <li><a href="admin-user.html" class="am-cf"><span class="am-icon-bank"></span> 市科协</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-circle"></span> 理科学会</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-magnet"></span> 工科学会</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-tree"></span> 农林学会</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-plus-circle"></span> 医药学会</a></li>
                        <li><a href="admin-help.html"><span class="am-icon-random"></span> 交叉学科学会</a></li>
                    </ul>
                </li>


            </ul>


            <div class="am-panel am-panel-default admin-sidebar-panel">
            </div>
        </div>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统管理</strong> / <small>管理本平台的开放、关闭时间</small></div>
        </div>



        <div class="am-g">
            <div class="am-u-sm-12">
                <table class="am-table am-table-bd am-table-striped admin-content-table">
                    <thead>
                    <tr>
                        <th>用户</th><th>开放时间</th><th>关闭时间</th><th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <form action="<%=basePath%>sysman/settime/proposer" method="post">
                            <td>申报者</td><td>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input type="text" class="am-form-field" placeholder="日期" value="${proposerOpenTime.year+1900}-${proposerOpenTime.month+1}-${proposerOpenTime.date}" name="startdate">
                            </div>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-clock-o"></i>
                                <input type="text" class="am-form-field" placeholder="时间" value="${proposerOpenTime.hours}:${proposerOpenTime.minutes}:${proposerOpenTime.seconds}" name="starttime">
                            </div>


                        </td>
                            <td>
                                <div class="am-form-group am-form-icon">
                                    <i class="am-icon-calendar"></i>
                                    <input type="text" class="am-form-field" placeholder="日期" value="${proposerEndTime.year+1900}-${proposerEndTime.month+1}-${proposerEndTime.date}" name="enddate">
                                </div>

                                <div class="am-form-group am-form-icon">
                                    <i class="am-icon-clock-o"></i>
                                    <input type="text" class="am-form-field" placeholder="时间" value="${proposerEndTime.hours}:${proposerEndTime.minutes}:${proposerEndTime.seconds}" name="endtime">
                                </div>
                            </td>
                            <td>
                                <div class="am-dropdown" data-am-dropdown>
                                    <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                    <ul class="am-dropdown-content">
                                        <li><a href="#"><input type="submit" value="确定"></a></li>
                                        <li><a href="#">取消</a></li>
                                    </ul>
                                </div>
                            </td>
                    </tr>
                    </form>

                    <tr>
                        <form action="<%=basePath%>sysman/settime/recunits" method="post">
                            <td>推荐单位</td><td>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input type="text" class="am-form-field" placeholder="日期"  value="${recunitsOpenTime.year+1900}-${recunitsOpenTime.month+1}-${recunitsOpenTime.date}"  name="startdate">
                            </div>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-clock-o"></i>
                                <input type="text" class="am-form-field" placeholder="时间"  value="${recunitsOpenTime.hours}:${recunitsOpenTime.minutes}:${recunitsOpenTime.seconds}"  name="starttime">
                            </div>


                        </td>
                            <td>
                                <div class="am-form-group am-form-icon">
                                    <i class="am-icon-calendar"></i>
                                    <input type="text" class="am-form-field" placeholder="日期"  value="${recunitsEndTime.year+1900}-${recunitsEndTime.month+1}-${recunitsEndTime.date}" name="enddate">
                                </div>

                                <div class="am-form-group am-form-icon">
                                    <i class="am-icon-clock-o"></i>
                                    <input type="text" class="am-form-field" placeholder="时间"  value="${recunitsEndTime.hours}:${recunitsEndTime.minutes}:${recunitsEndTime.seconds}" name="endtime">
                                </div>
                            </td>
                            <td>
                                <div class="am-dropdown" data-am-dropdown>
                                    <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                    <ul class="am-dropdown-content">
                                        <li><a href="#"><input type="submit" value="确定"></a></li>
                                        <li><a href="#">取消</a></li>
                                    </ul>
                                </div>
                            </td>
                    </tr>
                    </form>

                    <tr>
                        <form action="<%=basePath%>sysman/settime/expert" method="post">
                            <td>评审专家</td><td>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input type="text" class="am-form-field" placeholder="日期"  value="${expertOpenTime.year+1900}-${expertOpenTime.month+1}-${expertOpenTime.date}" name="startdate">
                            </div>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-clock-o"></i>
                                <input type="text" class="am-form-field" placeholder="时间"  value="${expertOpenTime.hours}:${expertOpenTime.minutes}:${expertOpenTime.seconds}" name="starttime">
                            </div>


                        </td>
                            <td>
                                <div class="am-form-group am-form-icon">
                                    <i class="am-icon-calendar"></i>
                                    <input type="text" class="am-form-field" placeholder="日期"  value="${expertEndTime.year+1900}-${expertEndTime.month+1}-${expertEndTime.date}" name="enddate">
                                </div>

                                <div class="am-form-group am-form-icon">
                                    <i class="am-icon-clock-o"></i>
                                    <input type="text" class="am-form-field" placeholder="时间"  value="${expertEndTime.hours}:${expertEndTime.minutes}:${expertEndTime.seconds}" name="endtime">
                                </div>
                            </td>
                            <td>
                                <div class="am-dropdown" data-am-dropdown>
                                    <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                                    <ul class="am-dropdown-content">
                                        <li><a href="#"><input type="submit" value="确定"></a></li>
                                        <li><a href="#">取消</a></li>
                                    </ul>
                                </div>
                            </td>
                    </tr>
                    </form>




                    </tbody>
                </table>
            </div>
        </div>



        <!-- content end -->

    </div>

    <a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

    <footer>
        <hr>
        <p class="am-padding-left">© 2015 --辽宁省科学技术协会--.</p>
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
