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
        <small>医药类学会</small>
    </div>
</div>
<div class="am-cf am-padding">
    <table class="am-table">
        <thead>
        <tr>
            <th>辽宁省医学会</th>
        </tr>
        </thead>
        <tbody>

        <tr>

            <form method="post" id="mediassoc">
                <input type="hidden" name="username" value="2">
                <td>
                    <div class="am-g">
                        <div class="am-u-sm-3"><input type="text" name="recID" value="2" class="am-form-field"></div>
                        <div class="am-u-sm-3 am-u-end">
                            <button class="am-btn am-btn-secondary am-btn-sm" type="button"
                                    onclick="post_form('<%=basePath%>departman/searchUnits','#mediassoc')">查询
                            </button>
                        </div>
                    </div>
                </td>

            </form>
        </tr>


        </tbody>
    </table>

</div>
