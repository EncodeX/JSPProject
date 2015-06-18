<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/23
  Time: 15:55
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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong> /
        <small>增加候选人</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="addProposer" method="post">
        <fieldset>
            <legend>增加候选人：</legend>
            <div class="am-form-group">

                <label>用户名：</label>
                <input type="text" name="userName" value="${proposer.userName}" class="am-form-field">

                <label>账号密码：</label>
                <input type="text" name="userPwd" value="${proposer.userPwd}" class="am-form-field">

                <label>真实姓名：</label>
                <input type="text" name="name" value="${proposer.name}" class="am-form-field">

                <label>所在学科：</label>
                <select data-am-selected name="subClass">
                    <option class="am-dropdown-header">请选择学科</option>
                    <c:forEach items="${subClass}" var="subclass" varStatus="status">
                        <option value="${subclass}">${subclass}</option>
                    </c:forEach>

                </select><br>

                <label>学科组ID：</label>
                <select data-am-selected name="subID">
                    <option class="am-dropdown-header">请选择学科组</option>
                    <c:forEach items="${subjectGroups}" var="group" varStatus="status">
                        <option value="${group.groID}">${group.groName}</option>
                    </c:forEach>

                </select><br>

                <label>推荐单位ID：</label>
                <select data-am-selected name="recID">
                    <option class="am-dropdown-header">请选择推荐单位</option>
                    <c:forEach items="${recUnits}" var="unit" varStatus="status">
                        <option value="${unit.unitsID}">${unit.unitsName}</option>
                    </c:forEach>

                </select><br>

                <label>推荐结果：</label>
                <select data-am-selected name="recResult">
                    <option class="am-dropdown-header">请选择</option>
                    <option value="1">成功</option>
                    <option value="0">失败</option>
                </select><br>

                <label>初评票数：</label>
                <input type="text" name="firCount" value="${proposer.firCount}" class="am-form-field">

                <label>初评结果：</label>
                <select data-am-selected name="firResult">
                    <option class="am-dropdown-header">请选择</option>
                    <option value="1">成功</option>
                    <option value="0">失败</option>
                </select><br>

                <label>终评结果：</label>
                <select data-am-selected name="lasResult">
                    <option class="am-dropdown-header">请选择</option>
                    <option value="1">成功</option>
                    <option value="0">失败</option>
                </select><br>

            </div>
            <button class="am-btn am-btn-secondary" type="button" onclick="post_form('<%=basePath%>candman/addProposerToDB','#addProposer')">提交</button>
        </fieldset>
    </form>
</div>
