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

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong>/
        <small>修改评审专家账号</small>
    </div>
</div>

<div class="am-cf am-padding">
    <form method="post" action="<%=basePath%>userinfo/updateExpertToDB">
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
            <button class="am-btn am-btn-secondary" type="submit">提交</button>
        </fieldset>
    </form>
</div>
<!-- content end -->
<script language="JavaScript">
    $(document).ready(function () {
        $("#button").click(function () {
            $.ajax({
                cache: true,
                type: "POST",
                url: 'ashx/GetTree.ashx?action=Ajax',//提交的URL
                data: $('#form1').serialize(), // 要提交的表单,必须使用name属性
                async: false,
                success: function (data) {
                    $("#common").html(data);//输出提交的表表单
                },
                error: function (request) {
                    alert("Connection error");
                }
            });
        });
    });
</script>