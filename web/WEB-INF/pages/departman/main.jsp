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
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}" href="<%=basePath%>departman/main"><span
                        class="am-icon-building"></span>
                    推荐单位管理 <span class="am-icon-angle-right am-fr am-margin-right"></span><a/>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
                        <li><a href="<%=basePath%>departman/citysciassoc" class="am-cf"><span
                                class="am-icon-bank"></span>
                            市科协</a></li>
                        <li><a href="<%=basePath%>departman/sciassoc"><span class="am-icon-circle"></span> 理科学会</a></li>
                        <li><a href="<%=basePath%>departman/engassoc"><span class="am-icon-magnet"></span> 工科学会</a></li>
                        <li><a href="<%=basePath%>departman/agriassoc"><span class="am-icon-tree"></span> 农林学会</a></li>
                        <li><a href="<%=basePath%>departman/mediassoc"><span class="am-icon-plus-circle"></span>
                            医药学会</a>
                        </li>
                        <li><a href="<%=basePath%>departman/crossassoc"><span class="am-icon-random"></span> 交叉学科学会</a>
                        </li>
                    </ul>
            </a>
        </ul>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位管理</strong> /
                <small>显示全省申报人数</small>
            </div>
        </div>
        <small>全省申报人数</small>
        ${proposerNum}

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位管理</strong> /
                <small>显示推荐单位信息</small>
            </div>
        </div>
        <div class="am-cf am-padding">
            <table class="am-table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>Id</th>
                    <th>单位名</th>
                    <th>推荐人数</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${units}" var="unit" varStatus="status">
                    <tr>
                        <td>${status.count+(pages-1)*10}</td>
                        <td>${unit.unitsID}</td>
                        <td>${unit.unitsName}</td>
                        <td>${unit.recTotal}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
        <%--分页--%>
        <ul class="am-pagination am-pagination-right">
            <%
                int amount = (Integer) request.getAttribute("amount");
                int pageAmount = (amount % 10 == 0) ? amount / 10 : amount / 10 + 1;
                int pages = (Integer) request.getAttribute("pages");
                if (pages == 1) {
            %>
            <li class="am-disabled"><a href="#">&laquo;</a></li>
            <%
            } else {
            %>
            <li><a href="<%=basePath%>departman/main?page=<%=pages-1%>">&laquo;</a></li>
            <%
                }
                if (pageAmount <= 5 || pages < 3) {
                    int temp = 0;
                    if (pageAmount <= 5)
                        temp = pageAmount;
                    else if (pages < 3)
                        temp = 5;
                    for (int i = 1; i <= temp; i++) {
                        if (i == pages) {
            %>
            <li class="am-active"><a href="<%=basePath%>departman/main?page=<%=i%>"><%=i%>
            </a></li>
            <%
            } else {
            %>
            <li><a href="<%=basePath%>departman/main?page=<%=i%>"><%=i%>
            </a></li>
            <%
                    }
                }
            } else if (pageAmount > 5 && pages > pageAmount - 2) {
                for (int i = pageAmount - 4; i <= pageAmount; i++) {
                    if (i == pages) {
            %>
            <li class="am-active"><a href="<%=basePath%>departman/main?page=<%=i%>"><%=i%>
            </a></li>
            <%
            } else {
            %>
            <li><a href="<%=basePath%>departmen/main?page=<%=i%>"><%=i%>
            </a></li>
            <%
                    }
                }
            } else {
                for (int i = pages - 2; i <= pages + 2; i++) {
                    if (i == pages) {
            %>
            <li class="am-active"><a href="<%=basePath%>departman/main?page=<%=i%>"><%=i%>
            </a></li>
            <%
            } else {
            %>
            <li><a href="<%=basePath%>departman/main?page=<%=i%>"><%=i%>
            </a></li>
            <%
                        }
                    }
                }
                if (pages < pageAmount) {
            %>
            <li><a href="<%=basePath%>departman/main?page=<%=pages+1%>">&raquo;</a></li>
            <%
            } else {
            %>
            <li class="am-disabled"><a href="#">&raquo;</a></li>
            <%
                }
            %>
        </ul>
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位管理</strong> /
                <small>搜索推荐单位信息</small>
            </div>
        </div>
        <div class="am-cf am-padding">
            <form id="submit_form" name="submit_form" method="post" action="<%=basePath%>departman/searchUnit">
                网站分类
                <script language="javascript">
                    <!--
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
                    //-->
                </script>
                <select name="bigclass" onchange="changeselect1(this.value)">
                    <option value="所有单位" selected>所有单位</option>
                    <option value="市科协"><a href="<%=basePath%>departman/main?unitName=aaa">市科协</a></option><li></li>
                    <option value="理科学会">理科学会</option>
                    <option value="工科学会">工科学会</option>
                    <option value="农林学会">农林学会</option>
                    <option value="医药学会">医药学会</option>
                    <option value="交叉学科学会">交叉学科学会</option>
                </select>
                <select name="unitName">
                    <option value="所有小类" selected>所有小类</OPTION>
                </select>
                <button class="am-btn am-btn-secondary" type="submit">提交</button>
            </form>
        </div>


    </div>
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
