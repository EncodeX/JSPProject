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
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">系统管理</strong> /
        <small>管理本平台的开放、关闭时间</small>
    </div>
</div>

<%--更新状态提示框|||在主页时不显示 仅在更新提交后变化--%>
<c:if test="${ischange==true}">
    <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">${messageTitle}</div>
            <div class="am-modal-bd">
                    ${messageEntity}
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>
</c:if>


<div class="am-g">
    <div class="am-u-sm-12">
        <table class="am-table am-table-bd am-table-striped admin-content-table">
            <thead>
            <tr>
                <th>用户</th>
                <th>开放时间</th>
                <th>关闭时间</th>
                <th>操作</th>
            </tr>
            </thead>

            <tbody>

                <form id="sysmanmain_proposer" method="post">
                        <tr>
                        <td>申报者</td>
                        <td>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input type="text"
                                       value="${proposerOpenTime.year+1900}-${proposerOpenTime.month+1}-${proposerOpenTime.date} ${proposerOpenTime.hours}:${proposerOpenTime.minutes}"
                                       class="am-form-field" placeholder="日期与时间" id="proposerOpenTime" name="start">
                            </div>


                        </td>
                        <td>
                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input type="text"
                                       value="${proposerEndTime.year+1900}-${proposerEndTime.month+1}-${proposerEndTime.date} ${proposerEndTime.hours}:${proposerEndTime.minutes}"
                                       class="am-form-field" placeholder="日期与时间" id="proposerCloseTime" name="end">
                            </div>
                        </td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button onclick="post_form('<%=basePath%>sysman/settime/proposer','#sysmanmain_proposer')"
                                        class="am-btn am-btn-primary" data-am-dropdown-toggle>更新</button>
                            </div>
                        </td>
                        </tr>
                </form>

                <form id="sysmanmain_units" method="post">
                    <tr>
                        <td>推荐单位</td>
                        <td>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input value="${recunitsOpenTime.year+1900}-${recunitsOpenTime.month+1}-${recunitsOpenTime.date} ${recunitsOpenTime.hours}:${recunitsOpenTime.minutes}"
                                       type="text" class="am-form-field" placeholder="日期与时间" id="resUnitsOpenTime" name="start">
                            </div>


                        </td>
                        <td>
                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input value="${recunitsEndTime.year+1900}-${recunitsEndTime.month+1}-${recunitsEndTime.date} ${recunitsEndTime.hours}:${recunitsEndTime.minutes}"
                                       type="text" class="am-form-field" placeholder="日期与时间" id="resUnitsCloseTime" name="end">
                            </div>
                        </td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button onclick="post_form('<%=basePath%>sysman/settime/recunits','#sysmanmain_units')"
                                        class="am-btn am-btn-primary" data-am-dropdown-toggle>更新</button>
                            </div>
                        </td>
                    </tr>
                </form>

                <form id="sysmanmain_expert" method="post">
                    <tr>
                        <td>评审专家</td>
                        <td>

                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input type="text"
                                       value="${expertOpenTime.year+1900}-${expertOpenTime.month+1}-${expertOpenTime.date} ${expertOpenTime.hours}:${expertOpenTime.minutes}"
                                       class="am-form-field" placeholder="日期与时间" id="expertOpenTime" name="start">
                            </div>


                        </td>
                        <td>
                            <div class="am-form-group am-form-icon">
                                <i class="am-icon-calendar"></i>
                                <input type="text"
                                       value="${expertEndTime.year+1900}-${expertEndTime.month+1}-${expertEndTime.date} ${expertEndTime.hours}:${expertEndTime.minutes}"
                                       class="am-form-field" placeholder="日期与时间" id="expertCloseTime" name="end">
                            </div>
                        </td>
                        <td>
                            <div class="am-dropdown" data-am-dropdown>
                                <button onclick="post_form('<%=basePath%>sysman/settime/expert','#sysmanmain_expert')"
                                        class="am-btn am-btn-primary" data-am-dropdown-toggle>更新</button>
                            </div>
                        </td>
                    </tr>
                </form>


            </tbody>
        </table>
    </div>
</div>