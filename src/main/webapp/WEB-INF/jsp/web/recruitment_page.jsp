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
<body ms-controller="main" class="ms-controller">
<jsp:include page="../public/web/nav.jsp"/>
<div class="int-banner">
    <div class="intro-detail">
        <p>${navContent.bannerTitle}<span>——${navContent.cnDesc}</span></p>

        <h3>${navContent.enDesc}</h3>

        <div class="int-line"></div>
    </div>
    <div class="recruitment-contact">
        <p><span>电话：</span><span>${config.phone}</span></p>

        <p><span>邮箱：</span><span>${config.email}</span></p>
    </div>
</div>
<div class="recruitment-content">
    <div id="everyDetail-box" class="everyDetail-box">
        <div class="everyDetail" ms-repeat="tableData.items_1">
            <div class="everyDetail-title"><img src="${ctx}/static/web/images/person.png">{{el.title}}</div>
            <div class="everyDetail-content" ms-repeat-ell="el.items_2">
                <div class="requirement-title">{{ell.title}}</div>
                <div class="requirement-content">
                    <p ms-repeat-elll="ell.items_3">{{elll}}</p>
                </div>
            </div>
        </div>
    </div>
    <div class="attention">
        <div class="attention-item" ms-repeat="tableData.texts_1">
            <div class="attention-title">
                <img src="${ctx}/static/web/images/danger.png" ms-if="$index==0">
                <img src="${ctx}/static/web/images/statement.png" ms-if="$index==1">
                {{el.title}}
            </div>
            <div class="attention-content">
                <p ms-repeat-ell="el.texts_2">{{ell}}</p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var vm = {
        tableData: {
            items_1: [],
            texts_1: []
        },
        content: '${navContent.content}',
        init: function () {
            vm.tableData = jsonUtil.parseJson(vm.$model.content);
            console.debug(vm.$model.tableData);
        }
    }
    vm = avalonFn.define("main", vm);
    vm.init();
</script>
</body>
</html>
