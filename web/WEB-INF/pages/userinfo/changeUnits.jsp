<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/21
  Time: 20:04
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

<!-- content start -->
<div class="admin-content">

  <div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong>
      <small>修改推荐单位账号</small>
    </div>
  </div>

  <div class="am-cf am-padding">
    <form method="post" action="<%=basePath%>userinfo/updateUnitsToDB">
      <input type="hidden" name="oldname" value="${Units.unitsName}">
      推荐单位名称<input type="text" name="unitName" value="${Units.unitsName}"><br>
      推荐单位初始密码<input type="text" name="unitPwd" value="${Units.unitsPwd}"><br>
      再次输入密码<input type="text" name="unitPwd2" value="${Units.unitsPwd}"><br>
      推荐单位名额<input type="text" name="unitTotal" value="${Units.unitTotal}"><br>
      <input type="submit" value="提交">
    </form>
  </div>

