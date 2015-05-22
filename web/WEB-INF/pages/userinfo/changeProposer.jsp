<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/21
  Time: 21:56
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
      <small>修改申请者信息</small>
    </div>
  </div>

  <div class="am-cf am-padding">
    <form method="post" action="<%=basePath%>userinfo/updateProposerToDB">
      <input type="hidden" name="oldname" value="${proposer.userName}"><%-- 隐藏信息用于修改数据 --%>
      用户名<input type="text" name="userName" value="${proposer.userName}"><br>
      ID<input type="text" name="userID" value="${proposer.userID}"><br>
      真实姓名<input type="text" name="name" value="${proposer.name}"><br>
      所在学科组<input type="text" name="subClass" value="${proposer.subClass}"><br>
      学科组ID<input type="text" name="subID" value="${proposer.subID}"><br>
      推荐单位ID<input type="text" name="recID" value="${proposer.recID}"><br>
      推荐结果<input type="text" name="recResult" value="${proposer.recResult}"><br>
      初评票数<input type="text" name="firCount" value="${proposer.firCount}"><br>
      初评结果<input type="text" name="firResult" value="${proposer.firResult}"><br>
      终评结果<input type="text" name="lasResult" value="${proposer.lasResult}"><br>
      账号密码<input type="text" name="userPwd" value="${proposer.userPwd}"><br>
      再次输入密码<input type="text" name="userPwd2" value="${proposer.userPwd}"><br>
      <input type="submit" value="提交">
    </form>
  </div>
