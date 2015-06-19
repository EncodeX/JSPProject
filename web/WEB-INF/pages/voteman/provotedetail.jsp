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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">投票管理</strong> /
        <small>投票详情</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <label>专家Id:</label>${expert.expID}
    <label>专家姓名:</label>${expert.expName}
</div>

<hr/>

<c:if test="${proposers!=null&&proposers.size()!=0}">
    <div class="am-cf am-padding">
        <table class="am-table">
            <thead>
            <tr>
                <th>序号</th>
                <th>申报者姓名</th>
                <th>初评票数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${proposers}" var="vo" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${vo.name}</td>
                    <td>${vo.firCount}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

</c:if>
<!-- content end -->
<br/>
<br/>
