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
<div class="branch-section">
    <div class="branch-section-title">
        <i></i><span id="branchTitle">${news.title}</span>
    </div>
    <div class="branch-section-content">
        <div class="branch-section-content-left">
            <img src="${baseInfo.fileServerPath}${news.showImgs}"/>
        </div>
        <p>
            ${news.contentText}
        </p>
    </div>
</div>
<script src="${ctx}/static/web/js/branch.js"></script>
</body>
</html>
