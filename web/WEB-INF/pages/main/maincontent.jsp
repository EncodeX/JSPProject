<%--
  Created by IntelliJ IDEA.
  Author: Enex Tapper
  Date: 15/5/30
  Time: 上午11:27
  Project: JSPProject
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


<div class="am-vertical-align" style="top: 51px;right: 0;bottom: 0;left: 260px;position: fixed;">
    <div class="am-vertical-align-middle" style="text-align: center;width: 100%;">
        <h1 style="color: #095f8a">辽宁省优秀科技工作者评选系统</h1>
        <h2 style="color: #0b76ac;">后台管理中心</h2>
        <%--<div style="color: #CCCCCC;">（到底该放点儿啥呢）</div>--%>
    </div>
</div>