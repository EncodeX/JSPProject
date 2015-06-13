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
<!doctype html>

<div class="am-cf am-padding">
  <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位搜索</strong> /
    <small>搜索结果</small>
  </div>
</div>

<div class="am-cf am-padding">
  <form method="post" action="<%=basePath%>departman/searchUnits">
    <label>符合：</label>
    <table class="am-table">
      <thead>
      <tr>
        <th>序号</th>
        <th>Id</th>
        <th>人名</th>

      </tr>
      </thead>
      <tbody>
      <c:forEach items="${proposers}" var="proposer" varStatus="status">
        <tr>
          <c:if test="${proposer.recResult==1}">
            <td>${status.count}</td>
            <td>${proposer.name}</td>
            <td>${proposer.userID}</td>
          </c:if>
        </tr>

      </c:forEach>

      </tbody>
    </table>
    <label>不符合：</label>
    <table class="am-table">
      <thead>
      <tr>
        <th>序号</th>
        <th>Id</th>
        <th>人名</th>

      </tr>
      </thead>
      <tbody>

      <c:forEach items="${proposers}" var="proposer" varStatus="status">
        <tr>
          <c:if test="${proposer.recResult==0}">
            <td>${status.count}</td>
            <td>${proposer.name}</td>
            <td>${proposer.userID}</td>
          </c:if>
        </tr>
      </c:forEach>

      </tbody>
    </table>
  </form>
</div>
