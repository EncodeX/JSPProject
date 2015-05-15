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

        <div class="am-cf am-padding">
            <a class="am-btn am-btn am-btn-primary" href="<%=basePath%>sbjman/toAddSubjectGroup"><i class="am-icon-plus"></i>增加学科组</a>
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
                        <td>${status.count}</td>
                        <td>${subjectGroup.groName}</td>
                        <td><a href="<%=basePath%>sbjman/toChangeSubjectGroup?name=${subjectGroup.groName}">修改</a>
                            <a href="<%=basePath%>sbjman/deleteSubjectGroup?name=${subjectGroup.groName}">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>