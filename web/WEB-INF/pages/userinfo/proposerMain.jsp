<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/5/21
  Time: 21:30
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

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong> /
        <small>管理推荐单位、评审专家、申报者账号</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <a class="am-btn am-btn am-btn-secondary" href="#" onclick="refresh_Content('<%=basePath%>userinfo/addExpert')"><i
            class="am-icon-plus"></i>增加专家组账号</a>
    <a class="am-btn am-btn am-btn-secondary" href="#" onclick="refresh_Content('<%=basePath%>userinfo/addCouncil')"><i
            class="am-icon-plus"></i>增加评审委员会账号</a>
    <a class="am-btn am-btn am-btn-secondary" href="#" onclick="refresh_Content('<%=basePath%>userinfo/addUnits')"><i
            class="am-icon-plus"></i>增加推荐单位账号</a>
</div>

<hr/>

<div class="am-tabs">
    <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-disabled"><a>查看:  </a></li>
        <a class="am-btn am-btn am-btn-secondary" href="#"
           onclick="refresh_Content('<%=basePath%>userinfo/main')">评审专家账号</a>
        <a class="am-btn am-btn am-btn-secondary" href="#"
           onclick="refresh_Content('<%=basePath%>userinfo/resUnitsMain')"></i>推荐单位账号</a>
        <a class="am-btn am-btn am-btn-primary" href="#"
           onclick="refresh_Content('<%=basePath%>userinfo/proposerMain')"></i>申请者账号</a>
    </ul>
</div>

<hr/>

<div class="am-cf am-padding">

    <table class="am-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>ID</th>
            <th>真实姓名</th>
            <th>所在学科组</th>
            <th>学科组ID</th>
            <th>推荐单位ID</th>
            <th>推荐结果</th>
            <th>初评票数</th>
            <th>初评结果</th>
            <th>终评结果</th>
            <th>操作</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${proposers}" var="proposer" varStatus="status">
            <tr>
                <td>${status.count+(pages-1)*10}</td>
                <td>${proposer.userName}</td>
                <td>${proposer.userID}</td>
                <td>${proposer.name}</td>
                <td>${proposer.subClass}</td>
                <td>${proposer.subID}</td>
                <td>${proposer.recID}</td>
                <td>${proposer.recResult}</td>
                <td>${proposer.firCount}</td>
                <td>${proposer.firResult}</td>
                <td>${proposer.lasResult}</td>
                <td><a class="am-btn am-btn-secondary am-btn-sm" href="#" onclick="refresh_Content('<%=basePath%>userinfo/changeProposer?name=${proposer.userName}')">修改</a>
                    <a class="am-btn am-btn-danger am-btn-sm" href="#" onclick="refresh_Content('<%=basePath%>userinfo/deleteProposer?name=${proposer.userName}')">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--分页--%>

    <ul class="am-pagination am-pagination-right">
        <%
            int amount = (Integer) request.getAttribute("amount");
            int pageAmount = (amount % 10 == 0) ? amount / 10 : amount / 10 + 1;
            int pages = (Integer) request.getAttribute("pages");
            if (pages == 1) {
        %>
        <li class="am-disabled"><a href="#">&laquo;</a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=pages-1%>')" href="#">&laquo;</a></li>
        <%
            }
            if (pageAmount <= 5 || pages < 3) {
                int temp = 0;
                if (pageAmount <= 5)
                    temp = pageAmount;
                else if (pages < 3)
                    temp = 5;
                for (int i = 1; i <= temp; i++) {
                    if (i == pages) {
        %>
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                }
            }
        } else if (pageAmount > 5 && pages > pageAmount - 2) {
            for (int i = pageAmount - 4; i <= pageAmount; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                }
            }
        } else {
            for (int i = pages - 2; i <= pages + 2; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                    }
                }
            }
            if (pages < pageAmount) {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/proposerMain?page=<%=pages+1%>')" href="#">&raquo;</a></li>
        <%
        } else {
        %>
        <li class="am-disabled"><a href="#">&raquo;</a></li>
        <%
            }
        %>
    </ul>
</div>

