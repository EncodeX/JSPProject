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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">候选人初评结果管理</strong> /
        <small>候选人通过学科组分类</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">
    <form id="firstresult1">
        <select data-am-selected name="groID">
            <option class="am-dropdown-header">请选择您要查看的学科组</option>
            <option value="all">all</option>
            <%
                String subID = (String) request.getAttribute("subID");

            %>
            <c:forEach items="${subjectGroups}" var="SubjectGroup" varStatus="status">
                <c:if test="${subID==SubjectGroup.groID}">
                    <option value="${SubjectGroup.groID}" selected>${SubjectGroup.groName}</option>
                </c:if>
                <c:if test="${subID!=SubjectGroup.groID}">
                    <option value="${SubjectGroup.groID}">${SubjectGroup.groName}</option>
                </c:if>

            </c:forEach>

        </select>
        <button class="am-btn am-btn-secondary" type="button"
                onclick="post_form('<%=basePath%>candman/firstresultsubclass','#firstresult1')">确认
        </button>

        <button class="am-btn am-btn am-btn-secondary" type="button" onclick="refresh_Content('<%=basePath%>candman/addProposer')">
            <i class="am-icon-plus"></i>增加候选人账号
        </button>
    </form>
</div>

<hr/>

<div class="am-tabs" id="doc-my-tabs">
    <ul class="am-tabs-nav am-nav am-nav-tabs">
        <li class="am-disabled"><a>排序方式:  </a></li>

        <c:if test="${order=='userID'}">
            <li class="am-active"><a onclick="refresh_Content('<%=basePath%>candman/userIDOrder?subID=<%=subID%>')"
                                     href="#">用户ID</a></li>
        </c:if>
        <c:if test="${order!='userID'}">
            <li><a onclick="refresh_Content('<%=basePath%>candman/userIDOrder?subID=<%=subID%>')" href="#">用户ID</a></li>
        </c:if>
        <c:if test="${order=='username'}">
            <li class="am-active"><a onclick="refresh_Content('<%=basePath%>candman/usernameOrder?subID=<%=subID%>')"
                                     href="#">用户名</a></li>
        </c:if>
        <c:if test="${order!='username'}">
            <li><a onclick="refresh_Content('<%=basePath%>candman/usernameOrder?subID=<%=subID%>')" href="#">用户名</a>
            </li>
        </c:if>
        <c:if test="${order=='name'}">
            <li class="am-active"><a onclick="refresh_Content('<%=basePath%>candman/nameOrder?subID=<%=subID%>')"
                                     href="#">真实姓名</a></li>
        </c:if>
        <c:if test="${order!='name'}">
            <li><a onclick="refresh_Content('<%=basePath%>candman/nameOrder?subID=<%=subID%>')" href="#">真实姓名</a></li>
        </c:if>
        <c:if test="${order=='rec'}">
            <li class="am-active"><a onclick="refresh_Content('<%=basePath%>candman/recOrder?subID=<%=subID%>')"
                                     href="#">推荐单位ID</a></li>
        </c:if>
        <c:if test="${order!='rec'}">
            <li><a onclick="refresh_Content('<%=basePath%>candman/recOrder?subID=<%=subID%>')" href="#">推荐单位ID</a></li>
        </c:if>
        <c:if test="${order=='fircount'}">
            <li class="am-active"><a onclick="refresh_Content('<%=basePath%>candman/fircountOrder?subID=<%=subID%>')"
                                     href="#">初选票数</a></li>
        </c:if>
        <c:if test="${order!='fircount'}">
            <li><a onclick="refresh_Content('<%=basePath%>candman/fircountOrder?subID=<%=subID%>')" href="#">初选票数</a>
            </li>
        </c:if>
    </ul>

    <hr/>

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
                    <td>
                        <c:if test="${proposer.recResult==1}">
                            成功
                        </c:if>
                        <c:if test="${proposer.recResult==0}">
                            失败
                        </c:if>
                    </td>
                    <td>${proposer.firCount}</td>
                    <td>
                        <c:if test="${proposer.firResult==1}">
                            成功
                        </c:if>
                        <c:if test="${proposer.firResult==0}">
                            失败
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${proposer.lasResult==1}">
                            成功
                        </c:if>
                        <c:if test="${proposer.lasResult==0}">
                            失败
                        </c:if>
                    </td>
                    <td>
                        <button class="am-btn am-btn-secondary" type="button"
                                onclick="refresh_Content('<%=basePath%>candman/deleteProposer?name=${proposer.userName}&subID=${proposer.subID}')">
                            删除
                        </button>

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
                String order = (String) request.getAttribute("order");
                if (order == null) {
                    order="userID";
                }
                if (pages == 1) {
            %>
            <li class="am-disabled"><a href="#">&laquo;</a></li>
            <%
            } else {
            %>
            <li>
                <a onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=pages-1%>&subID=<%=subID%>&order=<%=order%>')"
                   href="#">&laquo;</a>
            </li>
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
                    onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=i%>&subID=<%=subID%>&order=<%=order%>')"
                    href="#"><%=i%>
            </a></li>
            <%
                        } else {
            %>
            <li><a
                    onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=i%>&subID=<%=subID%>&order=<%=order%>')"
                    href="#"><%=i%>
            </a></li>
            <%
                        }
                    }
            } else if (pageAmount > 5 && pages > pageAmount - 2) {
                for (int i = pageAmount - 4; i <= pageAmount; i++) {
                    if (i == pages) {
            %>
            <li class="am-active"><a
                    onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=i%>&subID=<%=subID%>&order=<%=order%>')"
                    href="#"><%=i%>
            </a></li>
            <%
            } else {
            %>
            <li><a
                    onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=i%>&subID=<%=subID%>&order=<%=order%>')"
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
                    onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=i%>&subID=<%=subID%>&order=<%=order%>')"
                    href="#"><%=i%>
            </a></li>
            <%
            } else {
            %>
            <li><a
                    onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=i%>&subID=<%=subID%>&order=<%=order%>')"
                    href="#"><%=i%>
            </a></li>
            <%
                        }
                    }
                }
                if (pages < pageAmount) {
            %>
            <li>
                <a onclick="refresh_Content('<%=basePath%>candman/nextPage?page=<%=pages+1%>&subID=<%=subID%>&order=<%=order%>')"
                   href="#">&raquo;</a>
            </li>
            <%
            } else {
            %>
            <li class="am-disabled"><a href="#">&raquo;</a></li>
            <%
                }
            %>
        </ul>
    </div>
</div>