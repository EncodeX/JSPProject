<%--
  Created by IntelliJ IDEA.
  User: zz
  Date: 2015/4/28
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="webapp.model.Units" %>
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
  <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位信息查询结果</strong> /
    <small>信息</small>
  </div>
</div>

<div class="am-cf am-padding">
  <table class="am-table">
    <thead>
    <tr>
      <th>序号</th>
      <th>单位ID号</th>
      <th>单位名</th>
      <th>推荐人数</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${unitses}" var="units" varStatus="status">
      <tr>
        <td>${status.count}</td>
        <td>${units.unitsID}</td>
        <td>${units.unitsName}</td>
        <td>${units.recTotal}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<br/>
<br/>