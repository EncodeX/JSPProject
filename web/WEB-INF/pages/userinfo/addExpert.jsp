<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/16
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- content start -->
<div class="admin-content">

  <div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong>
        <small>增加评审专家账号</small>
    </div>
  </div>

  <div class="am-cf am-padding">
    <form method="post" action="<%=basePath%>userinfo/addExpertToDB">
         专家名称<input type="text" name="expName"><br>
         专家密码<input type="text" name="expPwd"><br>
         再次输入密码<input type="text" name="expPwd2"><br>
         所属学科组ID<input type="text" name="groID"><br>
      <input type="submit" value="提交">
    </form>
  </div>
