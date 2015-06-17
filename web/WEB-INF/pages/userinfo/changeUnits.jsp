<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/21
  Time: 20:04
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

<hr/>

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong>
        <small>修改推荐单位账号</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="changeUnits" method="post">
        <fieldset>
            <legend>修改推荐单位账号</legend>
            <div class="am-form-group">
                <input type="hidden" name="oldname" value="${units.unitsName}" class="am-form-field">
                <label>推荐单位名称：</label>
                <input type="text" name="unitName" value="${units.unitsName}" class="am-form-field">
                <label>推荐单位初始密码：</label>
                <input type="text" name="unitPwd" value="${units.unitsPwd}" class="am-form-field">
                <label>再次输入密码：</label>
                <input type="text" name="unitPwd2" value="${units.unitsPwd}" class="am-form-field">
                <label>推荐单位名额：</label>
                <input type="text" name="unitTotal" value="${units.recTotal}" class="am-form-field">
            </div>
            <button class="am-btn am-btn-secondary" type="button" onclick="post_form('<%=basePath%>userinfo/updateUnitsToDB','#changeUnits')">提交</button>
        </fieldset>
    </form>
</div>

