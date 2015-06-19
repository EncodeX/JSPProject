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
    String status = (String) request.getAttribute("status");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<hr/>

<!-- content start -->
<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong>/
        <small>增加评审专家账号</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="addExpert" method="POST" class="am-form am-form-horizontal">
        <fieldset>
            <legend>增加评审专家账号</legend>
            <div class="am-form-group">
                <label class="am-u-sm-2 am-form-label">评审专家名称：</label>
                <div class="am-u-sm-5">
                    <input type="text" name="expName" placeholder="输入评审专家" class="am-form-field" required/>
                </div>
                <br/>
                <br/>
                <label class="am-u-sm-2 am-form-label">评审专家密码：</label>
                <div class="am-u-sm-5">
                    <input type="text" name="expPwd" placeholder="请输入评审专家密码" class="am-form-field" required/>
                </div>
                <br/>
                <br/>
                <label class="am-u-sm-2 am-form-label">再次输入密码：</label>
                <div class="am-u-sm-5">
                    <input type="text" name="expPwd2" placeholder="请再次输入以上面相同的密码" class="am-form-field" required/>
                </div>
                <br/>
                <br/>
                <label class="am-u-sm-2 am-form-label">所属学科组：</label>
                <div class="am-u-sm-5">
                    <select data-am-selected="{maxHeight: 200}" name="groID">
                        <option class="am-dropdown-header">请选择学科组</option>
                        <c:forEach items="${subjectGroups}" var="group" varStatus="status">
                            <option value="${group.groID}">${group.groName}</option>
                        </c:forEach>

                    </select>
                </div>
                <br/>
                <br/>
                <input type="hidden" name="status" value="<%=status%>">
            </div>
            <button id="addExpertBtn" class="am-u-sm-offset-1 am-u-sm-1 am-btn am-btn-secondary" type="button"
                    onclick="post_form('<%=basePath%>userinfo/addExpertToDB','#addExpert')">提交
            </button>
        </fieldset>
    </form>

</div>
<!-- content end -->

