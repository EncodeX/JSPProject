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

<!-- content start -->
<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">学科管理</strong>/
        <small>修改学科组</small>
    </div>
</div>

<div class="am-cf am-padding">
    <form id="changesbjgrp" method="post">
        <fieldset>
            <legend>修改学科组</legend>
            <div class="am-form-group">
                <input type="hidden" name="oldname" value="${subjectGroup.groName}">
                <label>学科组名称</label>
                <input type="text" name="groName" value="${subjectGroup.groName}" class="am-form-field" required/>
                <label>学科组提交名额</label>
                <input type="text" name="subNum" value="${subjectGroup.groID}" class="am-form-field" required/>

            </div>
            <button class="am-btn am-btn-secondary" type="button" onclick="post_form('<%=basePath%>sbjman/changeSubjectGroup','#changesbjgrp')">提交</button>
        </fieldset>
    </form>
</div>
<!-- content end -->

