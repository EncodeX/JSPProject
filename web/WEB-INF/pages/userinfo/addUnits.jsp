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
        <small>增加推荐单位账号</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="addUnits" method="post" class="am-form am-form-horizontal">
        <fieldset>
            <legend>增加推荐单位账号</legend>
            <div class="am-form-group">
                <label class="am-u-sm-2 am-form-label">推荐单位名称：</label>
                <div class="am-u-sm-5">
                    <input type="text" name="unitName" placeholder="输入推荐单位名称" class="am-form-field" required/>
                </div>
                <br/>
                <br/>
                <label class="am-u-sm-2 am-form-label">推荐单位密码：</label>
                <div class="am-u-sm-5">
                    <input type="text" name="unitPwd" placeholder="输入推荐单位初始密码" class="am-form-field" required/>
                </div>
                <br/>
                <br/>
                <label class="am-u-sm-2 am-form-label">再次输入密码：</label>
                <div class="am-u-sm-5">
                    <input type="text" name="unitPwd2" placeholder="请再次输入以上面相同的密码" class="am-form-field" required/>
                </div>
                <br/>
                <br/>
                <label class="am-u-sm-2 am-form-label">推荐单位名额：</label>
                <div class="am-u-sm-5">
                    <input type="text" name="unitTotal" placeholder="输入推荐名额" class="am-form-field" required/>
                </div>
                <br/>
                <br/>
            </div>
            <button id="addUnitsBtn" class="am-u-sm-offset-1 am-u-sm-1 am-btn am-btn-secondary" type="button" onclick="post_form('<%=basePath%>userinfo/addUnitsToDB','#addUnits')">提交</button>
        </fieldset>
    </form>
</div>

<!-- content end -->
