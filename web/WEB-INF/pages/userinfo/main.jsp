<%--
  Created by IntelliJ IDEA.
  User: zz
  Date: 2015/4/28
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!-- content start -->
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户信息管理</strong> / <small>管理推荐单位、评审专家、申报者账号</small></div>
        </div>
        <div class="am-cf am-padding">
            <a class="am-btn am-btn am-btn-primary" href="<%=basePath%>userinfo/addGroup"><i class="am-icon-plus"></i>增加推荐单位账号</a>
            <a class="am-btn am-btn am-btn-success" href="<%=basePath%>userinfo/addExpert"><i class="am-icon-plus"></i>增加评审专家账号</a>
        </div>
        <div class="am-cf am-padding">
            <table class="am-table">
                <a class="am-btn am-btn am-btn-primary" href="<%=basePath%>userinfo/main">查看专家评审账号</a>
                <a class="am-btn am-btn am-btn-success" href="<%=basePath%>userinfo/groupmain">查看推荐单位账号</a>
                <tr>
                    <td>序号</td>
                    <td>用户名</td>
                    <td>ID</td>
                    <td>所在组ID</td>
                    <td>操作</td>
                </tr>
                <tbody>
                <c:forEach items="${experts}" var="expert" varStatus="status">
                    <tr>
                        <td>${status.count+(pages-1)*10}</td>
                        <td>${expert.expName}</td>
                        <td>${expert.expID}</td>
                        <td>${expert.groupID}</td>
                        <td><a href="<%=basePath%>userinfo/changeExpert?name=${expert.expName}">修改</a>
                            <a href="<%=basePath%>userinfo/deleteExpert?name=${expert.expName}">删除</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <%--分页--%>
            <ul class="am-pagination am-pagination-right">
                <%
                    int amount=(Integer)request.getAttribute("amount");
                    int pageAmount=(amount%10==0)?amount/10:amount/10+1;
                    int pages=(Integer)request.getAttribute("pages");
                    if(pages==1){
                %><li class="am-disabled"><a href="#">&laquo;</a></li><%
            }else{
            %><li><a href="<%=basePath%>userinfo/main?page=<%=pages-1%>">&laquo;</a></li><%
                }
                if(pageAmount<=5||pages<3){
                    int temp=0;
                    if(pageAmount<=5)
                        temp=pageAmount;
                    else if(pages<3)
                        temp=5;
                    for (int i = 1; i <= temp; i++) {
                        if(i==pages){
            %><li class="am-active"><a href="<%=basePath%>userinfo/main?page=<%=i%>"><%=i%></a></li><%
            }else{
            %><li><a href="<%=basePath%>userinfo/main?page=<%=i%>"><%=i%></a></li><%
                    }
                }
            }else if(pageAmount>5&&pages>pageAmount-2){
                for (int i = pageAmount-4; i <= pageAmount; i++) {
                    if(i==pages){
            %><li class="am-active"><a href="<%=basePath%>userinfo/main?page=<%=i%>"><%=i%></a></li><%
            }else{
            %><li><a href="<%=basePath%>userinfo/main?page=<%=i%>"><%=i%></a></li><%
                    }
                }
            }else{
                for (int i = pages-2; i <= pages+2; i++) {
                    if(i==pages){
            %><li class="am-active"><a href="<%=basePath%>userinfo/main?page=<%=i%>"><%=i%></a></li><%
            }else{
            %><li><a href="<%=basePath%>userinfo/main?page=<%=i%>"><%=i%></a></li><%
                        }
                    }
                }
                if (pages<pageAmount){
            %><li><a href="<%=basePath%>userinfo/main?page=<%=pages+1%>">&raquo;</a></li><%
            }else{
            %><li class="am-disabled"><a href="#">&raquo;</a></li><%
                }
            %>
            </ul>
        </div>
    </div>