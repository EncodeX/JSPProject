<%--
  Created by IntelliJ IDEA.
  User: zz
  Date: 2015/4/28
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">名额分配管理</strong> / <small>终评名额管理</small></div>
</div>

<div class="am-cf am-padding">
</div>

<div class="am-cf am-padding">
    <form method="post" action="<%=basePath%>quotaman/changefinalquota">

        评审委员会最终名额: ${subjectGroup.subNum} <br>
        修改:
        <input type="text" name="number" value="${subjectGroup.subNum}">
        <input type="submit" value="修改">
    </form>

</div>
