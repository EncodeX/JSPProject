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

<hr/>

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位管理</strong> /
        <small>主页</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <label>
    全省申报人数:
    ${proposerNum}
    </label>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="submit_form" name="submit_form" method="post">
        分类搜索
        <select name="bigclass" onchange="changeselect1(this.value)">
            <option value="所有单位" >所有单位</option>
            <option value="市科协">市科协</option>
            <option value="理科学会">理科学会</option>
            <option value="工科学会">工科学会</option>
            <option value="农林学会">农林学会</option>
            <option value="医药学会">医药学会</option>
            <option value="交叉学科学会">交叉学科学会</option>
        </select>
        <select data-am-selected="{maxHeight: 200}" name="unitName">
            <option value="所有小类" selected>所有小类</OPTION>
        </select>
        <button class="am-btn am-btn-secondary" type="button" onclick="refresh_list('<%=basePath%>departman/searchUnit','#submit_form')">提交</button>
    </form>
</div>

<hr/>

<div id="show_form">

    <div class="am-cf am-padding">
        <table class="am-table">
            <thead>
            <tr>
                <th>序号</th>
                <th>单位ID</th>
                <th>单位名</th>
                <th>推荐人数</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${units}" var="unit" varStatus="status">
                <tr>
                    <td>${status.count+(pages-1)*10}</td>
                    <td>${unit.unitsID}</td>
                    <td>${unit.unitsName}</td>
                    <td>${unit.recTotal}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

    <%--分页--%>
    <ul class="am-pagination am-pagination-right am-padding">
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
        <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=pages-1%>')" href="#">&laquo;</a></li>
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
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                }
            }
        } else if (pageAmount > 5 && pages > pageAmount - 2) {
            for (int i = pageAmount - 4; i <= pageAmount; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                }
            }
        } else {
            for (int i = pages - 2; i <= pages + 2; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
        </a></li>
        <%
                    }
                }
            }
            if (pages < pageAmount) {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=pages+1%>')" href="#">&raquo;</a></li>
        <%
        } else {
        %>
        <li class="am-disabled"><a href="#">&raquo;</a></li>
        <%
            }
        %>
    </ul>
</div>
<br/>
<br/>