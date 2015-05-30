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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统管理</strong> / <small>管理本平台的开放、关闭时间</small></div>
</div>



<div class="am-g">
    <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
                <th>用户</th><th>开放时间</th><th>关闭时间</th><th>操作</th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <form action="<%=basePath%>sysman/settime/proposer" method="post">
                    <td>申报者</td><td>

                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-calendar"></i>
                        <input type="text" value="${proposerOpenTime.year+1900}-${proposerOpenTime.month+1}-${proposerOpenTime.date} ${proposerOpenTime.hours}:${proposerOpenTime.minutes}" class="am-form-field" placeholder="日期与时间" id="proposerOpenTime">
                    </div>


                </td>
                    <td>
                        <div class="am-form-group am-form-icon">
                            <i class="am-icon-calendar"></i>
                            <input type="text" value="${proposerEndTime.year+1900}-${proposerEndTime.month+1}-${proposerEndTime.date} ${proposerEndTime.hours}:${proposerEndTime.minutes}" class="am-form-field" placeholder="日期与时间" id="proposerCloseTime">
                        </div>
                    </td>
                    <td>
                        <div class="am-dropdown" data-am-dropdown>
                            <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                            <ul class="am-dropdown-content">
                                <li><a href="#">确定</a></li>
                                <li><a href="#">取消</a></li>
                            </ul>
                        </div>
                    </td>
            </tr>
            </form>

            <tr>
                <form action="<%=basePath%>sysman/settime/recunits" method="post">
                    <td>推荐单位</td><td>

                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-calendar"></i>
                        <input value="${recunitsOpenTime.year+1900}-${recunitsOpenTime.month+1}-${recunitsOpenTime.date} ${recunitsOpenTime.hours}:${recunitsOpenTime.minutes}" type="text" class="am-form-field" placeholder="日期与时间" id="resUnitsOpenTime">
                    </div>


                </td>
                    <td>
                        <div class="am-form-group am-form-icon">
                            <i class="am-icon-calendar"></i>
                            <input value="${recunitsEndTime.year+1900}-${recunitsEndTime.month+1}-${recunitsEndTime.date} ${recunitsEndTime.hours}:${recunitsEndTime.minutes}" type="text" class="am-form-field" placeholder="日期与时间" id="resUnitsCloseTime">
                        </div>
                    </td>
                    <td>
                        <div class="am-dropdown" data-am-dropdown>
                            <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                            <ul class="am-dropdown-content">
                                <li><a href="#">确定</a></li>
                                <li><a href="#">取消</a></li>
                            </ul>
                        </div>
                    </td>
            </tr>
            </form>

            <tr>
                <form action="<%=basePath%>sysman/settime/expert" method="post">
                    <td>评审专家</td><td>

                    <div class="am-form-group am-form-icon">
                        <i class="am-icon-calendar"></i>
                        <input type="text" value="${expertOpenTime.year+1900}-${expertOpenTime.month+1}-${expertOpenTime.date} ${expertOpenTime.hours}:${expertOpenTime.minutes}" class="am-form-field" placeholder="日期与时间" id="expertOpenTime">
                    </div>


                </td>
                    <td>
                        <div class="am-form-group am-form-icon">
                            <i class="am-icon-calendar"></i>
                            <input type="text" value="${expertEndTime.year+1900}-${expertEndTime.month+1}-${expertEndTime.date} ${expertEndTime.hours}:${expertEndTime.minutes}" class="am-form-field" placeholder="日期与时间" id="expertCloseTime">
                        </div>
                    </td>
                    <td>
                        <div class="am-dropdown" data-am-dropdown>
                            <button class="am-btn am-btn-default am-btn-xs am-dropdown-toggle" data-am-dropdown-toggle><span class="am-icon-cog"></span> <span class="am-icon-caret-down"></span></button>
                            <ul class="am-dropdown-content">
                                <li><a href="#">确定</a></li>
                                <li><a href="#">取消</a></li>
                            </ul>
                        </div>
                    </td>
            </tr>
            </form>




            </tbody>
        </table>
    </div>
</div>