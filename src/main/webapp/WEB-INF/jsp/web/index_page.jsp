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
    <div class="aside">
        <h1>${navContent.bannerTitle}</h1>

        <h2>${navContent.cnDesc}</h2>

        <h3>${navContent.enDesc}</h3>
    </div>
</div>
<div class="section">
    <div class="business">
        <div class="intro">
            <div class="pot"></div>
            <h1>${content.title_cn1}</h1>

            <p>${content.title_en1}</p>
        </div>
        <div class="businessContent">
            <c:forEach items="${busNews}" var="bn">
                <dl>
                    <dt style="background:url(${baseInfo.fileServerPath}${bn.showImgs}) center center no-repeat;"></dt>
                    <dd>${bn.title}</dd>
                </dl>
            </c:forEach>
        </div>
    </div>
    <div class="case">
        <div class="case-title">
            <div class="intro">
                <div class="pot"></div>
                <h1>${content.title_cn2}</h1>

                <p>${content.title_en2}</p>
            </div>
        </div>
        <div>
            <div class="slide">
                <ul class="slideul1">
                    <li class="slideli1">
                        <ul class="slideul2">
                            <c:forEach items="${imgList}" var="img">
                                <li><img src="${baseInfo.fileServerPath}${img}"/></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="slideli2"></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="contact">
        <div class="intro">
            <div class="pot"></div>
            <h1>${content.title_cn3}</h1>

            <p>${content.title_en3}</p>
        </div>
        <div class="information">
            <p>电话：${config.phone}</p>

            <p>邮箱：${config.email}</p>
        </div>
    </div>
</div>
<div class="footer">
    <p>合作单位</p>
    <div class="cooperation">
        <img width="965" height="45" src="${ctx}/static/web/images/footer.png" alt=""/>
    </div>
</div>
<script>
    var imgs = [
        {"img": "${ctx}/static/web/images/banner1.png"},
        {"img": "${ctx}/static/web/images/banner2.png"},
        {"img": "${ctx}/static/web/images/banner3.png"}
    ];
</script>
<script src="${ctx}/static/web/js/index.js"></script>
</body>
</html>
