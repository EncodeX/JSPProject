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
        <thead>
        <tr>
            <th></th>
        </tr>
        </thead>
        <tbody>

        <tr>

            <form method="post" action="<%=basePath%>departman/crossassoc">
                <tr>
                    <c:forEach items="${unitses}" var="unit"  varStatus="status">
                    <%int z=112;%>

                    <c:if test="${unit.unitsID>111}">
                    <c:if test="${unit.unitsID<142}">
                    <form id="citysci<%=z%>" method="post">

                        <td>
                            <div class="am-g">
                                <div class="am-u-sm-3"><input type="text" name="recID" value="<%=z%>" class="am-form-field"style="display: none"></div>
                                <div class="am-u-sm-3 am-u-end">
                                    <button class="am-btn am-btn-secondary am-btn-sm" type="button"
                                            onclick="post_form('<%=basePath%>departman/searchUnits','#citysci<%=z%>')">${unit.unitsName}
                                    </button>
                                </div>
                            </div>
                        </td>
                        <%z++;%>
                        </c:if>
                        </c:if>
                        </c:forEach>
                    </form>
        </tr>


        </tbody>
    </table>

</div>
