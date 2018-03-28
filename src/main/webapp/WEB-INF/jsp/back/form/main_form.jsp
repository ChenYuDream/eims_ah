<%--
  Created by IntelliJ IDEA.
  User: ChenYu
  Date: 2017-06-12
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglib.jsp" %>
<html>
<head>
    <%@include file="../../public/back/commonCss.jsp" %>
    <%@include file="../../public/back/commonJs.jsp" %>
</head>
<body>
<div class="pd">
    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">内容设置</li>
            <li>导航设置</li>
        </ul>
        <div class="layui-tab-content ">
            <div class="layui-tab-item layui-show">
                <jsp:include page="/back/form/nav/${navContent.tag}"/>
            </div>
            <div class="layui-tab-item">
                <jsp:include page="/back/form/common/${navContent.tag}"/>

            </div>
        </div>
    </div>
</div>
<script>
    var element = layui.element;
    element.init();
</script>
</body>
</html>
