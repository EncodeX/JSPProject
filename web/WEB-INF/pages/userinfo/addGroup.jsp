<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/18
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- content start -->
<div class="admin-content">

  <div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong>
      <small>增加学科组账号</small>
    </div>
  </div>

  <div class="am-cf am-padding">
    <form method="post" action="<%=basePath%>userinfo/addGroupToDB">
      学科组名称<input type="text" name="groName"><br>
      学科组提交名额<input type="text" name="subNum"><br>
      <input type="submit" value="提交">
    </form>
  </div>
