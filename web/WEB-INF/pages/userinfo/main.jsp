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

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong> /
        <small>管理推荐单位、评审专家、申报者账号</small>
    </div>
</div>
<div class="am-cf am-padding">
    <a class="am-btn am-btn am-btn-secondary" href="#" onclick="refresh_Content('<%=basePath%>userinfo/addExpert')"><i
            class="am-icon-plus"></i>增加专家组账号</a>
    <a class="am-btn am-btn am-btn-secondary" href="#" onclick="refresh_Content('<%=basePath%>userinfo/addCouncil')"><i
            class="am-icon-plus"></i>增加评审委员会账号</a>
    <a class="am-btn am-btn am-btn-secondary" href="#" onclick="refresh_Content('<%=basePath%>userinfo/addUnits')"><i
            class="am-icon-plus"></i>增加推荐单位账号</a>
</div>

<div class="am-cf am-padding">
    <a class="am-btn am-btn am-btn-secondary" href="#"
       onclick="refresh_Content('<%=basePath%>userinfo/main')"><i
            class="am-icon-eye"></i>查看评审专家账号</a>
    <a class="am-btn am-btn am-btn-secondary" href="#"
       onclick="refresh_Content('<%=basePath%>userinfo/resUnitsMain')"><i
            class="am-icon-eye"></i>查看推荐单位账号</a>
    <a class="am-btn am-btn am-btn-secondary" href="#"
       onclick="refresh_Content('<%=basePath%>userinfo/proposerMain')"><i
            class=" am-icon-eye"></i>查看申请者账号</a>
</div>

<div class="am-cf am-padding">

    <table class="am-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>ID</th>
            <th>所在组ID</th>
            <th>身份</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${experts}" var="expert" varStatus="status">
            <tr>
                <td>${status.count+(pages-1)*10}</td>
                <td>${expert.expName}</td>
                <td>${expert.expID}</td>
                <td>${expert.groupID}</td>
                <td>
                    <c:if test="${expert.status==0}">
                        专家组
                    </c:if>
                    <c:if test="${expert.status==1}">
                        评审委员会
                    </c:if>
                </td>
                <td><a class="am-btn am-btn-link am-btn-sm"
                       onclick="refresh_Content('<%=basePath%>userinfo/changeExpert?name=${expert.expName}')">修改</a>
                    <a class="am-btn am-btn-link am-btn-sm"
                       onclick="refresh_Content('<%=basePath%>userinfo/deleteExpert?name=${expert.expName}')">删除</a>
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
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=pages-1%>')" href="#">&laquo;</a></li>
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
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                }
            }
        } else if (pageAmount > 5 && pages > pageAmount - 2) {
            for (int i = pageAmount - 4; i <= pageAmount; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                }
            }
        } else {
            for (int i = pages - 2; i <= pages + 2; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                    }
                }
            }
            if (pages < pageAmount) {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>userinfo/main?page=<%=pages+1%>')" href="#">&raquo;</a></li>
        <%
        } else {
        %>
        <li class="am-disabled"><a href="#">&raquo;</a></li>
        <%
            }
        %>
    </ul>

</div>

