<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ChenYu
  Date: 2017-06-05
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../../public/back/commonCss.jsp" %>
    <%@include file="../../public/back/commonJs.jsp" %>
</head>
<body>
<div class="layui-carousel" id="lb">
    <div carousel-item="">
        <c:forEach items="${images}" var="img">
            <div><img src="${baseInfo.fileServerPath}${img}" width="540px" height="400px"></div>
        </c:forEach>
    </div>
</div>
<script type="text/javascript">
    //常规轮播
    carousel.render({
        elem: '#lb',
        width: '540px',
        height: '400px',
        arrow: 'always'
    });
</script>
</body>
</html>
