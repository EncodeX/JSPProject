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

<!-- content start -->
<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">学科管理</strong> /
        <small>增加学科组</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="addsbjgup" method="get" class="am-form am-form-horizontal">
        <fieldset>
            <legend>增加学科组</legend>
            <div class="am-form-group">
                <label for="doc-vld-name" class="am-u-sm-2 am-form-label">学科组名称：</label>
                <div class="am-u-sm-5">
                <input type="text" name="groName" id="doc-vld-name" minlength="3" placeholder="输入学科组名称"
                       class="am-form-field" required/>
                </div>
                <br/>
                <br/>
                <label for="doc-vld-num" class="am-u-sm-2 am-form-label">提交名额：</label>
                <div class="am-u-sm-5">
                <input type="text" name="subNum" id="doc-vld-num" minlength="3" placeholder="输入名额"
                       class="am-form-field" required/>
                </div>
                <br/>
                <br/>
            </div>
            <button id="addExpertBtn" class="am-u-sm-offset-1 am-u-sm-1 am-btn am-btn-secondary" type="button" onclick="post_form('<%=basePath%>sbjman/addSubjectGroup','#addsbjgup')">提交</button>
        </fieldset>
    </form>
</div>
<!-- content end -->