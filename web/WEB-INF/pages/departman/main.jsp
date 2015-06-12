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
        <small>显示全省申报人数</small>
    </div>
</div>
<div class="am-cf am-padding">
    <label>
    全省申报人数:
    ${proposerNum}
    </label>
</div>


<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位管理</strong> /
        <small>显示推荐单位信息</small>
    </div>
</div>
<div class="am-cf am-padding">
    <table class="am-table">
        <thead>
        <tr>
            <th>序号</th>
            <th>Id</th>
            <th>单位名</th>
            <th>推荐人数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${units}" var="unit" varStatus="status">
            <tr>
                <td>${status.count+(pages-1)*10}</td>
                <td>${unit.unitsID}</td>
                <td>${unit.unitsName}</td>
                <td>${unit.recTotal}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<%--分页--%>
<ul class="am-pagination am-pagination-right">
    <%
        int amount = (Integer) request.getAttribute("amount");
        int pageAmount = (amount % 10 == 0) ? amount / 10 : amount / 10 + 1;
        int pages = (Integer) request.getAttribute("pages");
        if (pages == 1) {
    %>
    <li class="am-disabled"><a href="#">&laquo;</a></li>
    <%
    } else {
    %>
    <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=pages-1%>')" href="#">&laquo;</a></li>
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
    <li class="am-active"><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
    </a></li>
    <%
    } else {
    %>
    <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
    </a></li>
    <%
            }
        }
    } else if (pageAmount > 5 && pages > pageAmount - 2) {
        for (int i = pageAmount - 4; i <= pageAmount; i++) {
            if (i == pages) {
    %>
    <li class="am-active"><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
    </a></li>
    <%
    } else {
    %>
    <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
    </a></li>
    <%
            }
        }
    } else {
        for (int i = pages - 2; i <= pages + 2; i++) {
            if (i == pages) {
    %>
    <li class="am-active"><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
    </a></li>
    <%
    } else {
    %>
    <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=i%>')" href="#"><%=i%>
    </a></li>
    <%
                }
            }
        }
        if (pages < pageAmount) {
    %>
    <li><a onclick="refresh_Content('<%=basePath%>departman/main?page=<%=pages+1%>')" href="#">&raquo;</a></li>
    <%
    } else {
    %>
    <li class="am-disabled"><a href="#">&raquo;</a></li>
    <%
        }
    %>
</ul>

<div class="am-cf am-padding">
    <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">推荐单位管理</strong> /
        <small>搜索推荐单位信息</small>
    </div>
</div>
<div class="am-cf am-padding">
    <form id="submit_form" name="submit_form" method="post">
        网站分类
        <script language="javascript">
//            <!--
            var subcat = new Array();
            var biglist = new Array('市科协', '理科学会', '工科学会', '农林学会', '医药学会', '交叉学科学会');
            subcat[0] = new Array('0', '沈阳市科协', '沈阳市科协')
            subcat[1] = new Array('1', '辽宁省物理学会', '辽宁省物理学会')
            subcat[2] = new Array('1', '辽宁省力学学会', '辽宁省力学学会')
            subcat[3] = new Array('1', '辽宁省气象学会', '辽宁省气象学会')
            subcat[4] = new Array('1', '辽宁省地质学会', '辽宁省地质学会')
            subcat[5] = new Array('1', '辽宁省地理学会', '辽宁省地理学会')
            subcat[6] = new Array('1', '辽宁省海洋学会', '辽宁省海洋学会')
            subcat[7] = new Array('1', '辽宁省地震学会', '辽宁省地震学会')
            subcat[8] = new Array('1', '辽宁省动物学会', '辽宁省动物学会')
            subcat[9] = new Array('1', '辽宁省昆虫学会', '辽宁省昆虫学会')
            subcat[10] = new Array('1', '辽宁省生态学学会', '辽宁省生态学学会')
            subcat[11] = new Array('1', '辽宁省微生物学会', '辽宁省微生物学会')
            subcat[12] = new Array('1', '辽宁省环境科学学会', '辽宁省环境科学学会')
            subcat[13] = new Array('1', '辽宁省野生动物保护协会', '辽宁省野生动物保护协会')
            subcat[14] = new Array('1', '辽宁省地球物理学会', '辽宁省地球物理学会')
            subcat[15] = new Array('1', '辽宁省生物技术协会', '辽宁省生物技术协会')
            subcat[16] = new Array('1', '辽宁省数学会', '辽宁省数学会')
            subcat[17] = new Array('2', '辽宁省机械工程学会', '辽宁省机械工程学会')
            subcat[18] = new Array('2', '辽宁省电机工程学会', '辽宁省电机工程学会')
            subcat[19] = new Array('2', '辽宁省电工技术学会', '辽宁省电工技术学会')
            subcat[20] = new Array('2', '辽宁省水利学会', '辽宁省水利学会')
            subcat[21] = new Array('2', '辽宁省复合材料学会', '辽宁省复合材料学会')
            subcat[22] = new Array('2', '辽宁省制冷学会', '辽宁省制冷学会')
            subcat[23] = new Array('2', '辽宁省自动化学会', '辽宁省自动化学会')
            subcat[24] = new Array('2', '辽宁省计量测试学会', '辽宁省计量测试学会')
            subcat[25] = new Array('2', '辽宁省标准化协会', '辽宁省标准化协会')
            subcat[26] = new Array('2', '辽宁省图学学会', '辽宁省图学学会')
            subcat[27] = new Array('2', '辽宁省计算机学会', '辽宁省计算机学会')
            subcat[28] = new Array('2', '辽宁省通信学会', '辽宁省通信学会')
            subcat[29] = new Array('2', '辽宁省测绘学会', '辽宁省测绘学会')
            subcat[30] = new Array('2', '辽宁省造船工程学会', '辽宁省造船工程学会')
            subcat[31] = new Array('2', '辽宁省航海学会', '辽宁省航海学会')
            subcat[32] = new Array('2', '辽宁省铁道学会', '辽宁省铁道学会')
            subcat[33] = new Array('2', '辽宁省公路学会', '辽宁省公路学会')
            subcat[34] = new Array('2', '辽宁省航空宇航学会', '辽宁省航空宇航学会')
            subcat[35] = new Array('2', '辽宁省兵工学会', '辽宁省兵工学会')
            subcat[36] = new Array('2', '辽宁省金属学会', '辽宁省金属学会')
            subcat[37] = new Array('2', '辽宁省有色金属学会', '辽宁省有色金属学会')
            subcat[38] = new Array('2', '辽宁省腐蚀与防护学会', '辽宁省腐蚀与防护学会')
            subcat[39] = new Array('2', '辽宁省核学会', '辽宁省核学会')
            subcat[40] = new Array('2', '辽宁省石油石化学会', '辽宁省石油石化学会')
            subcat[41] = new Array('2', '辽宁省可再生能源学会', '辽宁省可再生能源学会')
            subcat[42] = new Array('2', '辽宁省土木建筑学会', '辽宁省土木建筑学会')
            subcat[43] = new Array('2', '辽宁省纺织工程学会', '辽宁省纺织工程学会')
            subcat[44] = new Array('2', '辽宁省印刷技术协会', '辽宁省印刷技术协会')
            subcat[45] = new Array('2', '辽宁省仪器仪表学会', '辽宁省仪器仪表学会')
            subcat[46] = new Array('2', '辽宁省地方供电设施管理学会', '辽宁省地方供电设施管理学会')
            subcat[47] = new Array('2', '辽宁省烟草学会', '辽宁省烟草学会')
            subcat[48] = new Array('2', '辽宁省振动工程学会', '辽宁省振动工程学会')
            subcat[49] = new Array('2', '辽宁省颗粒学会', '辽宁省颗粒学会')
            subcat[50] = new Array('2', '辽宁省消防协会', '辽宁省消防协会')
            subcat[51] = new Array('2', '辽宁省人工智能学会', '辽宁省人工智能学会')
            subcat[52] = new Array('2', '辽宁省质量协会', '辽宁省质量协会')
            subcat[53] = new Array('2', '辽宁省人民防空学会', '辽宁省人民防空学会')
            subcat[54] = new Array('2', '辽宁省包装联合会', '辽宁省包装联合会')
            subcat[55] = new Array('2', '辽宁省互联网协会', '辽宁省互联网协会')
            subcat[56] = new Array('2', '辽宁省分析测试协会', '辽宁省分析测试协会')
            subcat[57] = new Array('2', '辽宁省化工学会', '辽宁省化工学会')


            function changeselect1(locationid) {
                for (j = 0; j < biglist.length; j++)
                    if (biglist[j] == locationid) {
                        locationid = j;
                    }
                document.submit_form.unitName.length = 0;//初始化下拉列表，清空下拉数据
                document.submit_form.unitName.options[0] = new Option('所有小类', '所有小类');//给第一个值
                for (i = 0; i < subcat.length; i++) {
                    if (subcat[i][0] == locationid) {
                        document.submit_form.unitName.options[document.submit_form.unitName.length] = new Option(subcat[i][1], subcat[i][2]);
                    }//建立option
                }
            }
            //-->
        </script>
        <select data-am-selected="{dropUp: 1,maxHeight: 300}" id="testselect" name="bigclass" onchange="changeselect1(this.value)">
            <option value="所有单位" selected>所有单位</option>
            <option value="市科协"><a href="<%=basePath%>departman/main?unitName=aaa">市科协</a></option>
            <li></li>
            <option value="理科学会">理科学会</option>
            <option value="工科学会">工科学会</option>
            <option value="农林学会">农林学会</option>
            <option value="医药学会">医药学会</option>
            <option value="交叉学科学会">交叉学科学会</option>
        </select>
        <select data-am-selected="{dropUp: 1,maxHeight: 300}" name="unitName">
            <option value="所有小类" selected>所有小类</OPTION>
        </select>
        <button class="am-btn am-btn-secondary" type="button" onclick="post_form('<%=basePath%>departman/searchUnit','#submit_form')">提交</button>
    </form>
</div>