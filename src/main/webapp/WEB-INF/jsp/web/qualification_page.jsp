<%--
  Created by IntelliJ IDEA.
  User: ChenYu
  Date: 2017-06-13
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglib.jsp" %>
<html>
<head>
    <%@include file="../public/web/commonJs.jsp" %>
    <title>${navContent.navName}</title>
</head>
<body>
<jsp:include page="../public/web/nav.jsp"/>
<div class="banner">
    <div class="slider">
        <ul id="imgs" class="imgs"></ul>
        <ul class="index"></ul>
    </div>
    <div class="qualification-aside">
        <p>${navContent.bannerTitle}<span>——${navContent.cnDesc}</span></p>

        <h3>${navContent.enDesc}</h3>

        <div class="int-line"></div>
    </div>
</div>
<div class="qualification-section">
    <ul class="upUl">
        <c:forEach items="${imgList}" var="img">
            <li><img width="197" height="251" src="${baseInfo.fileServerPath}${img}" alt="证书"/></li>
        </c:forEach>
    </ul>
</div>
<script>
    var imgs = [
        {"img": "${ctx}/static/web/images/banner1.png"},
        {"img": "${ctx}/static/web/images/banner2.png"},
        {"img": "${ctx}/static/web/images/banner3.png"}
    ];
</script>
<script src="${ctx}/static/web/js/qualification.js"></script>
</body>
</html>
