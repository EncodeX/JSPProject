<%--
  Created by IntelliJ IDEA.
  User: zz
  Date: 2015/4/28
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="webapp.model.Proposer" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">候选人学科管理</strong> /
        <small>候选人通过所属学科组分类</small>
    </div>
</div>
<div class="am-cf am-padding">
    <form id="sbjman" method="post">
        <select data-am-selected name="subClass">
            <option class="am-dropdown-header">请选择学科类别</option>
            <% String subClass = (String) request.getAttribute("subClass"); %>
            <c:forEach items="${allproposers}" var="proposer" varStatus="status">
                <c:if test="${subClass==proposer}">
                    <option value="${proposer}" selected>${proposer}</option>
                </c:if>
                <c:if test="${subClass!=proposer}">
                    <option value="${proposer}">${proposer}</option>
                </c:if>
            </c:forEach>

        </select>
        <button class="am-btn am-btn-secondary" type="button"
                onclick="post_form('<%=basePath%>candman/subclass','#sbjman')">确认
        </button>
    </form>
</div>
<div class="am-cf am-padding">

    <table class="am-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>ID</th>
            <th>真实姓名</th>
            <th>所在学科</th>
            <th>学科组</th>
            <th>推荐单位ID</th>
            <th>推荐结果</th>
            <th>初评票数</th>
            <th>初评结果</th>
            <th>终评结果</th>
            <th>操作</th>
        </tr>
        </thead>
        <% int z=0;%>
        <c:forEach items="${proposers}" var="proposer" varStatus="status">
            <form id="sbjman<%=z%>" method="post">
                    <input type="hidden" name="userName" value="${proposer.userName}">
                    <tr>
                        <td>${status.count+(pages-1)*10}</td>
                        <td>${proposer.userName}</td>
                        <td>${proposer.userID}</td>
                        <td>${proposer.name}</td>
                        <td>${proposer.subClass}</td>
                        <td><select data-am-selected name="groName">
                            <c:forEach items="${subjectGroups}" var="SubjectGroup" varStatus="status">
                                <c:if test="${SubjectGroup.groID==proposer.subID}">
                                    <option value="${SubjectGroup.groName}" selected>${SubjectGroup.groName}</option>
                                </c:if>
                                <c:if test="${SubjectGroup.groID!=proposer.subID}">
                                    <option value="${SubjectGroup.groName}">${SubjectGroup.groName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                        </td>
                        <td>${proposer.recID}</td>
                        <td>${proposer.recResult}</td>
                        <td>${proposer.firCount}</td>
                        <td>${proposer.firResult}</td>
                        <td>${proposer.lasResult}</td>
                        <td>
                            <button class="am-btn am-btn-secondary" type="button"
                                    onclick="post_form('<%=basePath%>candman/changeSubject','#sbjman<%=z%>')">确认
                            </button>
                        </td>
                    </tr>
            </form>
            <%z++;%>
        </c:forEach>
        </tbody>

    </table>
    <%--分页--%>
    <ul class="am-pagination am-pagination-right">
        <%
            int amount = (Integer) request.getAttribute("amount");
            int pageAmount = (amount % 10 == 0) ? amount / 10 : amount / 10 + 1;
            int pages = (Integer) request.getAttribute("pages");
            String url = (String) request.getAttribute("url");

            if (url == null) {
                url = "sbjman";
            }
            if (pages == 1) {
        %>
        <li class="am-disabled"><a href="#">&laquo;</a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>candman/<%=url%>?page=<%=pages-1%>&subClass=<%=subClass%>')"
               href="#">&laquo;</a></li>
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
        <li class="am-active"><a
                onclick="refresh_Content('<%=basePath%>candman/<%=url%>?page=<%=i%>&subClass=<%=subClass%>')"
                href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li>< onclick="refresh_Content('<%=basePath%>candman/<%=url%>?page=<%=i%>&subClass=<%=subClass%>')"
            href="#"><%=i%></a></li>
        <%
                }
            }
        } else if (pageAmount > 5 && pages > pageAmount - 2) {
            for (int i = pageAmount - 4; i <= pageAmount; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a href="<%=basePath%>candman/<%=url%>?page=<%=i%>&subClass=<%=subClass%>"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>candman/<%=url%>?page=<%=i%>&subClass=<%=subClass%>')"
               href="#"><%=i%>
        </a></li>
        <%
                }
            }
        } else {
            for (int i = pages - 2; i <= pages + 2; i++) {
                if (i == pages) {
        %>
        <li class="am-active"><a
                onclick="refresh_Content('<%=basePath%>candman/<%=url%>?page=<%=i%>&subClass=<%=subClass%>')"
                href="#"><%=i%>
        </a></li>
        <%
        } else {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>candman/<%=url%>?page=<%=i%>&subClass=<%=subClass%>')"
               href="#"><%=i%>
        </a></li>
        <%
                    }
                }
            }
            if (pages < pageAmount) {
        %>
        <li><a onclick="refresh_Content('<%=basePath%>candman/<%=url%>?page=<%=pages+1%>&subClass=<%=subClass%>')"
               href="#">&raquo;</a></li>
        <%
        } else {
        %>
        <li class="am-disabled"><a href="#">&raquo;</a></li>
        <%
            }
        %>
    </ul>
</div>