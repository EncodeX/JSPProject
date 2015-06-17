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

<hr/>

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong>/
        <small>修改评审专家账号</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="changeExpert" method="post">
        <fieldset>
            <legend>修改评审专家账号</legend>
            <div class="am-form-group">
                <input type="hidden" name="exOldname" value="${expert.expName}">
                <label>评审专家名称：</label>
                <input type="text" name="expName" value="${expert.expName}" class="am-form-field">
                <label>评审专家密码：</label>
                <input type="text" name="expPwd" value="${expert.expPwd}" class="am-form-field">
                <label>再次输入密码：</label>
                <input type="text" name="expPwd2" value="${expert.expPwd}" class="am-form-field">
                <label>所属学科组ID：</label>
                <input type="text" name="groID" value="${expert.groupID}" class="am-form-field">
                <input type="hidden" name="status" value="${expert.status}">
            </div>
            <button class="am-btn am-btn-secondary" type="button" onclick="post_form('<%=basePath%>userinfo/updateExpertToDB','#changeExpert')">提交</button>
        </fieldset>
    </form>
</div>
<!-- content end -->
