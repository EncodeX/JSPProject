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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">名额分配管理</strong> /
        <small>推荐单位提交名额管理</small>
    </div>
</div>

<div class="am-cf am-padding">
</div>

<div class="am-cf am-padding">
    <table class="am-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>推荐单位</th>
            <th>推荐名额</th>
            <th>修改推荐名额</th>
        </tr>
        </thead>
        <tbody>
        <% int z = 0;%>
        <c:forEach items="${recommendUnits}" var="vo" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${vo.username}</td>
                <td>${vo.quota}</td>
                <form id="unitmain<%=z%>" method="post" action="">
                    <div class="am-form-group">
                        <input type="hidden" name="username" value="${vo.username}">
                        <td><input type="text" name="quota" value="${vo.quota}" class="am-form-field">
                        </td>
                        <td>
                            <button class="am-btn am-btn-secondary am-btn-sm" type="button"
                                    onclick="post_form('<%=basePath%>quotaman/changequota','#unitmain<%=z%>')">修改
                            </button>
                        </td>
                    </div>

                </form>
            </tr>
            <%z++;%>
        </c:forEach>
        </tbody>
    </table>

</div>

