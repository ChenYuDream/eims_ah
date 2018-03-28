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
<div class="business-section">
    <ul>
        <c:forEach items="${news}" var="n" varStatus="s">
            <li>
                <div class="business-section-imgBox">
                    <img src="${baseInfo.fileServerPath}${n.showImgs}" alt=""/>
                </div>
                <div class="business-section-text">
                    <div>
                        <h2>${n.title}</h2>

                        <p>${n.contentText}</p>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
<script src="${ctx}/static/web/js/business.js"></script>
</body>
</html>
