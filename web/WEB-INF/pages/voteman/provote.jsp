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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">投票管理</strong> /
        <small>专家组投票管理</small>
    </div>
</div>
<div class="am-cf am-padding">
    <c:if test="${subjectGroups!=null&&subjectGroups.size()!=0}">
        <form id="provote" method="post">
            <select name="group">
                <c:forEach items="${subjectGroups}" var="vo" varStatus="status">
                    <c:if test="${vo.groName.equals(group)}">
                        <option value="${vo.groName}" selected="selected">${vo.groName}</option>
                    </c:if>
                    <c:if test="${!vo.groName.equals(group)}">
                        <option value="${vo.groName}">${vo.groName}</option>
                    </c:if>
                </c:forEach>
            </select>
            <button class="am-btn am-btn-secondary" type="button"
                    onclick="post_form('<%=basePath%>voteman/provote','#provote')">选择组
            </button>
        </form>
    </c:if>


    <c:if test="${experts!=null&&experts.size()!=0}">
        <div class="am-cf am-padding">
            <table class="am-table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>评审专家</th>
                    <th>已投/限制</th>
                    <th>详细</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${experts}" var="vo" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${vo.expName}</td>
                        <td>${alreadyVote}/${limitVote}</td>
                        <form method="post" action="<%=basePath%>voteman/provoteViewDetail">
                            <input type="hidden" name="expertId" value="${vo.expID}">
                            <td><input type="submit" value="查看投票详情"></td>
                        </form>
                        <form method="post" action="<%=basePath%>voteman/provoteVoteReset">
                            <input type="hidden" name="expertId" value="${vo.expID}">
                            <input type="hidden" name="group" value="${group}">
                            <td><input type="submit" value="返回重投"></td>
                        </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>

    </c:if>

</div>
