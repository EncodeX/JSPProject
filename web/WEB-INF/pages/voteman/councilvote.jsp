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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">投票管理</strong> /
        <small>评审委员会投票管理</small>
    </div>
</div>

<hr/>

<div class="am-cf am-padding">

    <form id="councilvote1" action="" method="post" class="am-form am-form-horizontal">
        <div class="am-g">
            <div class="am-form-group">
                <div class="am-u-sm-3"><input type="text" value="${search}" name="search" class="am-form-field"></div>
                <div class="am-u-sm-3">
                    <button class="am-btn am-btn-secondary" type="button"
                            onclick="post_form('<%=basePath%>voteman/councilvote','#councilvote1')">搜索
                    </button>
                </div>
                <label class="am-u-sm-3 am-u-end am-form-label">已投${alreadVote}人 限制${limitVote}人</label>
            </div>
        </div>
    </form>
</div>
<c:if test="${proposers!=null&&proposers.size()!=0}">
    <div class="am-cf am-padding">
        <table class="am-table">
            <thead>
            <tr>
                <th>序号</th>
                <th>申报者用户名</th>
                <th>申报者姓名</th>
                <th>评审结果</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${proposers}" var="vo" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${vo.userName}</td>
                    <td>${vo.name}</td>
                    <c:if test="${vo.lasResult==0}">
                        <td>未通过</td>
                    </c:if>
                    <c:if test="${vo.lasResult==1}">
                        <td>已通过</td>
                    </c:if>
                    <td>
                        <c:if test="${vo.lasResult==0}">
                            <form id="councilvote2" method="post">
                                <input type="hidden" name="userid" value="${vo.userID}">
                                <input type="hidden" name="search" value="${search}">
                                <button class="am-btn am-btn-secondary" type="button"
                                        onclick="post_form('<%=basePath%>voteman/councilvoteadd','#councilvote2')">添加
                                </button>
                            </form>
                        </c:if>
                        <c:if test="${vo.lasResult==1}">
                            <form id="councilvote3" method="post" action="<%=basePath%>voteman/councilvotedelete">
                                <input type="hidden" name="userid" value="${vo.userID}">
                                <input type="hidden" name="search" value="${search}">
                                <button class="am-btn am-btn-secondary" type="button"
                                        onclick="post_form('<%=basePath%>voteman/councilvotedelete','#councilvote3')">删除
                                </button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

</c:if>
