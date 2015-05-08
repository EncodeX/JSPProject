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

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>辽宁省优秀科技工作者评选系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <style>
        .header {
            text-align: center;
        }
        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }
        .header p {
            font-size: 14px;
        }
    </style>
</head>
<body>

<header class="am-topbar">
    <h1 class="am-topbar-brand">
        <a href="#">辽宁省优秀科技工作者评选系统</a>
    </h1>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav">
            <li><a href="#">首页</a></li>
        </ul>

</header>




<div class="header">
    <div class="am-g">
        <h1>辽宁省优秀科技工作者评选系统</h1>
        <p></p>
    </div>
    <hr />
</div>

<div class="am-g">
    <div class="am-u-sm-3 am-u-sm-centered">
        <h2>登录</h2>
        <h3 style="color:red">${message}</h3>

        <form method="post" class="am-form" action="<%=basePath%>login">

            <label for="doc-select-1">选择用户</label>
            <select id="doc-select-1">
                <option value="a">申报者</option>
                <option value="b">推荐单位</option>
                <option value="o">评审专家</option>
            </select>



            <label for="email">用户名</label>
            <input type="text" name="username" id="email" value="">
            <br>
            <label for="password">密码:</label>
            <input type="password" name="password" id="password" value="">
            <br>

            <br />
            <div class="am-cf">
                <input type="submit" name="" value="登录" class="am-btn am-btn-primary am-btn-sm am-fl">
                <input type="submit" name="" value="注册" class="am-btn am-btn-default am-btn-sm am-fr">
            </div>

        </form>
        <hr>
        <p>© 2015 --辽宁省科学技术协会--.</p>
    </div>
</div>

<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <br>
        <br>
   </div>
</div>
</body>
</html>