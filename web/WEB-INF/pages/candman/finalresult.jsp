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
  <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">候选人终评结果管理</strong> /
    <small>候选人通过所属学科组分类</small>
  </div>
</div>

<hr/>

<div class="am-cf am-padding">
  <label>目前共有：${amount} 人</label>
</div>

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
      <th>学科组ID</th>
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
                  onclick="refresh_Content('<%=basePath%>candman/changeProposer?username=${proposer.userName}')">
            修改
          </button>
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
  %><li><a onclick="refresh_Content('<%=basePath%>candman/finalresult?page=<%=pages-1%>')" href="#">&laquo;</a></li><%
    }
    if(pageAmount<=5||pages<3){
      int temp=0;
      if(pageAmount<=5)
        temp=pageAmount;
      else if(pages<3)
        temp=5;
      for (int i = 1; i <= temp; i++) {
        if(i==pages){
  %><li class="am-active"><a href="<%=basePath%>candman/finalresult?page=<%=i%>"><%=i%></a></li><%
  }else{
  %><li><a onclick="refresh_Content('<%=basePath%>candman/finalresult?page=<%=i%>')" href="#"><%=i%></a></li><%
      }
    }
  }else if(pageAmount>5&&pages>pageAmount-2){
    for (int i = pageAmount-4; i <= pageAmount; i++) {
      if(i==pages){
  %><li class="am-active"><a href="<%=basePath%>candman/finalresult?page=<%=i%>"><%=i%></a></li><%
  }else{
  %><li><a onclick="refresh_Content('<%=basePath%>candman/finalresult?page=<%=i%>')" href="#"><%=i%></a></li><%
      }
    }
  }else{
    for (int i = pages-2; i <= pages+2; i++) {
      if(i==pages){
  %><li class="am-active"><a onclick="refresh_Content('<%=basePath%>candman/finalresult?page=<%=i%>')" href="#"><%=i%></a></li><%
  }else{
  %><li><a href="<%=basePath%>candman/finalresult?page=<%=i%>"><%=i%></a></li><%
        }
      }
    }
    if (pages<pageAmount){
  %><li><a onclick="refresh_Content('<%=basePath%>candman/finalresult?page=<%=pages+1%>')" href="#">&raquo;</a></li><%
  }else{
  %><li class="am-disabled"><a href="#">&raquo;</a></li><%
    }
  %>
  </ul>
</div>

<br/>
<br/>