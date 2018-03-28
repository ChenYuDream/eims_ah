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
<jsp:include page="../public/web/banner.jsp"/>

<div class="advantage-section">
    <ul>
        <c:forEach items="${news}" var="n" varStatus="s">
            <li>
                <div class="advantage-title">
                    <img width="116" height="65" src="${ctx}/static/web/images/tageBg${s.index+1}.png" alt=""/>

                    <h2>${n.title}</h2>
                </div>
                <p>${n.contentText}</p>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="advantage-footer">
    <div class="advantage-slider">
        <ul class="advantage-slideul1">
            <li class="advantage-slideli1">
                <ul class="advantage-slideul2">
                    <c:forEach items="${imgList}" var="img">
                        <li><img src="${baseInfo.fileServerPath}${img}"/></li>
                    </c:forEach>
                </ul>
            </li>
            <li class="advantage-slideli2"></li>
        </ul>
    </div>
</div>
<script src="${ctx}/static/web/js/advantage.js"></script>
</body>
</html>
