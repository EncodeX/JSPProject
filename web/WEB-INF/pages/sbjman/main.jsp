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

<!-- content start -->
<div class="admin-content">

    <div class="am-cf am-padding">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">学科管理</strong> / <small>管理学科组信息</small></div>
    </div>

<<<<<<< Temporary merge branch 1
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
                        <li><a href="<%=basePath%>candman/sbjman" class="am-cf"><span class="am-icon-cogs"></span> 候选人学科管理</a></li>
                        <li><a href="<%=basePath%>candman/firstresult"><span class="am-icon-cube"></span> 候选人初评结果管理</a></li>
                        <li><a href="<%=basePath%>candman/finalresult"><span class="am-icon-cubes"></span> 候选人终评结果管理</a></li>
                    </ul>
                </li>

                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-child"></span> 名额分配管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav2">
                        <li><a href="<%=basePath%>quotaman/recomquota" class="am-cf"><span class="am-icon-file-o"></span> 推荐单位提交名额管理</a></li>
                        <li><a href="<%=basePath%>quotaman/firstquota"><span class="am-icon-file-text"></span> 初评名额管理</a></li>
                        <li><a href="<%=basePath%>quotaman/finalquota"><span class="am-icon-file"></span> 终评名额管理</a></li>
                    </ul>
                </li>

                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-bar-chart"></span> 投票管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav3">
                        <li><a href="<%=basePath%>voteman/provote" class="am-cf"><span class="am-icon-check"></span> 专家组投票管理</a></li>
                        <li><a href="<%=basePath%>voteman/councilvote"><span class="am-icon-circle"></span> 评审委员会投票管理</a></li>
                    </ul>
                </li>

                <li class="admin-parent">
                    <a class="am-cf" data-am-collapse="{target: '#collapse-nav4'}"><span class="am-icon-building"></span> 推荐单位管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                    <ul class="am-list am-collapse admin-sidebar-sub" id="collapse-nav4">
                        <li><a href="<%=basePath%>departman/citysciassoc" class="am-cf"><span class="am-icon-bank"></span> 市科协</a></li>
                        <li><a href="<%=basePath%>departman/sciassoc"><span class="am-icon-circle"></span> 理科学会</a></li>
                        <li><a href="<%=basePath%>departman/engassoc"><span class="am-icon-magnet"></span> 工科学会</a></li>
                        <li><a href="<%=basePath%>departman/agriassoc"><span class="am-icon-tree"></span> 农林学会</a></li>
                        <li><a href="<%=basePath%>departman/mediassoc"><span class="am-icon-plus-circle"></span> 医药学会</a></li>
                        <li><a href="<%=basePath%>departman/crossassoc"><span class="am-icon-random"></span> 交叉学科学会</a></li>
                    </ul>
                </li>


            </ul>


            <div class="am-panel am-panel-default admin-sidebar-panel">
            </div>
        </div>
=======
    <div class="am-cf am-padding">
        <a class="am-btn am-btn am-btn-primary" href="<%=basePath%>sbjman/toAddSubjectGroup"><i class="am-icon-plus"></i>增加学科组</a>
>>>>>>> Temporary merge branch 2
    </div>

    <div class="am-cf am-padding">
        <table class="am-table">
            <thead>
            <tr>
                <th>序号</th>
                <th>组名</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${subjectGroups}" var="subjectGroup" varStatus="status">
                <tr>
                    <td>${status.count+(pages-1)*10}</td>
                    <td>${subjectGroup.groName}</td>
                    <td><a href="<%=basePath%>sbjman/toChangeSubjectGroup?name=${subjectGroup.groName}">修改</a>
                        <a href="<%=basePath%>sbjman/deleteSubjectGroup?name=${subjectGroup.groName}">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <%--分页--%>
        <ul class="am-pagination am-pagination-right">
            <%
                int amount=(Integer)request.getAttribute("amount");
                int pageAmount=(amount%10==0)?amount/10:amount/10+1;
                int pages=(Integer)request.getAttribute("pages");
                if(pages==1){
            %><li class="am-disabled"><a href="#">&laquo;</a></li><%
        }else{
        %><li><a href="<%=basePath%>sbjman/main?page=<%=pages-1%>">&laquo;</a></li><%
            }
            if(pageAmount<=5||pages<3){
                int temp=0;
                if(pageAmount<=5)
                    temp=pageAmount;
                else if(pages<3)
                    temp=5;
                for (int i = 1; i <= temp; i++) {
                    if(i==pages){
        %><li class="am-active"><a href="<%=basePath%>sbjman/main?page=<%=i%>"><%=i%></a></li><%
        }else{
        %><li><a href="<%=basePath%>sbjman/main?page=<%=i%>"><%=i%></a></li><%
                }
            }
        }else if(pageAmount>5&&pages>pageAmount-2){
            for (int i = pageAmount-4; i <= pageAmount; i++) {
                if(i==pages){
        %><li class="am-active"><a href="<%=basePath%>sbjman/main?page=<%=i%>"><%=i%></a></li><%
        }else{
        %><li><a href="<%=basePath%>sbjman/main?page=<%=i%>"><%=i%></a></li><%
                }
            }
        }else{
            for (int i = pages-2; i <= pages+2; i++) {
                if(i==pages){
        %><li class="am-active"><a href="<%=basePath%>sbjman/main?page=<%=i%>"><%=i%></a></li><%
        }else{
        %><li><a href="<%=basePath%>sbjman/main?page=<%=i%>"><%=i%></a></li><%
                    }
                }
            }
            if (pages<pageAmount){
        %><li><a href="<%=basePath%>sbjman/main?page=<%=pages+1%>">&raquo;</a></li><%
        }else{
        %><li class="am-disabled"><a href="#">&raquo;</a></li><%
            }
        %>
        </ul>

    </div>

</div>

