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
<body ms-controller="case" class="ms-controller">
<jsp:include page="../public/web/nav.jsp"/>
<jsp:include page="../public/web/banner.jsp"/>
<div class="case-section">
    <div class="case-section-slider-box">
        <div class="case-section-slider">
            <ul class="case-slider-imgs"></ul>
            <img class="caseLeft" width="35" height="35" src="${ctx}/static/web/images/left.png" alt=""/>
            <img class="caseRight" width="35" height="35" src="${ctx}/static/web/images/right.png" alt=""/>
            <ul class="case-slider-index"></ul>
        </div>
        <div class="case-section-slider-text">
            <h1>{{news.title}}</h1>
            <p>{{news.contentText|html}}</p>
        </div>
    </div>
    <div class="case-detail-box">
        <ul class="case-detail" ms-each="tableData">
            <li ms-class="liSel:news.id==el.id">
                <p>
                    <span></span>
                    <a href="javascript:void(0);" ms-on-click="selectFn(el)">{{el.title}}</a>
                </p>
            </li>
        </ul>
    </div>
</div>
<script src="${ctx}/static/web/js/case.js"></script>
<script type="text/javascript">
    caseSlider.fileServerPath = '${baseInfo.fileServerPath}';
    var vm = {
        news: {},
        tableData: [],
        loadTableData: function () {
            ajaxUtil.post("${ctx}/news/list/${navContent.tag}", "", false, function (res) {
                console.log(res);
                vm.news = res.data[0];
                vm.tableData = res.data;
                caseSlider.init(jsonUtil.parseJson(res.data[0].showImgs));
            })
        },
        selectFn: function (el) {
            vm.news = el.$model;
            caseSlider.interView(jsonUtil.parseJson(vm.$model.news.showImgs))
        }
    }
    vm = avalonFn.define("case", vm);
    vm.loadTableData();

</script>
</body>
</html>
