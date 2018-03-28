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
<div class="int-section">
    <div class="text-intro">
        <ul>
            <c:forEach items="${news}" var="n" varStatus="s">
                <c:if test="${s.index%2 eq 0}">
                    <li>
                        <div class="introImg mR">
                            <img src="${baseInfo.fileServerPath}${n.showImgs}" width="344" height="227"/>
                        </div>
                        <div class="introText">
                            <p>${n.contentText}</p>
                        </div>
                    </li>
                </c:if>
                <c:if test="${s.index%2 eq 1}">
                    <li>
                        <div class="introText mR">
                            <p>${n.contentText}</p>
                        </div>
                        <div class="introImg ">
                            <img src="${baseInfo.fileServerPath}${n.showImgs}" width="344" height="227"/>
                        </div>
                    </li>
                </c:if>
            </c:forEach>
        </ul>
    </div>
</div>
<script src="${ctx}/static/web/js/introduce.js"></script>
</body>
</html>
