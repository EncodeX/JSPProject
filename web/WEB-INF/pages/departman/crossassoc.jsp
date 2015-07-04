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
<!doctype html>

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位管理</strong> /
        <small>交叉学科</small>
    </div>
</div>
<div class="am-cf am-padding">
    <table class="am-table">
        <tbody>
        <%int z=112;%>
        <c:forEach items="${unitses}" var="unit"  varStatus="status">
            <% if (z%2==0) { %>
                <tr>
            <%}%>
                <c:if test="${unit.unitsID>111 && unit.unitsID<142}">
                    <td style="border-top:0px;">
                        <input id="input1<%=z%>" type="hidden" name="recID" value="<%=z%>" class="am-form-field">
                        <button class="am-btn am-btn-secondary am-btn-sm" type="button" style="min-width: 100%;"
                                onclick="post_form_by_input('<%=basePath%>departman/searchUnits',['input1<%=z%>'])">${unit.unitsName}
                        </button>
                    </td>
                    <%z++;%>
                </c:if>
            <% if (z%2==0) { %>
                </tr>
            <%}%>
        </c:forEach>
        </tbody>
    </table>

</div>

<br/>
<br/>