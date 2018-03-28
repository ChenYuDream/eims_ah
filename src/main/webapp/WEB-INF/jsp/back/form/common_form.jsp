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
    <%@include file="../../public/back/otherCommon.jsp" %>
</head>
<body>
<div class="layui-form">
    <input type="hidden" name="id" value="${navContent.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">导航标签：</label>
        <div class="layui-input-inline">
            <input type="text" name="tag" lay-verify="required" readonly class="layui-input"
                   value="${navContent.tag}">
        </div>
        <div class="layui-form-mid layui-word-aux">只读</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">导航名称：</label>
        <div class="layui-input-inline">
            <input type="text" name="navName" lay-verify="required" class="layui-input"
                   value="${navContent.navName}">
        </div>
        <div class="layui-form-mid layui-word-aux"></div>
    </div>
    <%--<div class="layui-form-item">
        <label class="layui-form-label">轮播图：</label>
        <div class="layui-input-inline" style="width: 130px;">
            <button type="button" class="layui-btn layui-btn-small" id="test2">上传多图</button>
            <button type="button" class="layui-btn layui-btn-small layui-btn-primary"
                    onclick="multiImg.removeAll(mm.bannerUrlArr)">清除
            </button>
        </div>
        <div class="layui-form-mid layui-word-aux">注* 上传尺寸宽度为1920px，高度不限</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline" style="width: 80%">
            <div class="layui-upload">
                <blockquote class="layui-elem-quote layui-quote-nm">
                    <div class="layui-upload-list" id="demo2"></div>
                </blockquote>
            </div>
        </div>
    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">轮播图标题：</label>
        <div class="layui-input-inline">
            <input type="text" name="bannerTitle" lay-verify="required" class="layui-input"
                   value="${navContent.bannerTitle}">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="cnDesc" lay-verify="required" class="layui-input" value="${navContent.cnDesc}">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="enDesc" lay-verify="required" class="layui-input" value="${navContent.enDesc}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否启用：</label>
        <div class="layui-input-inline">
            <input type="radio" name="isEnable" value="1" title="启用"
                   <c:if test="${navContent.isEnable eq '1'}">checked</c:if>>
            <input type="radio" name="isEnable" value="0" title="禁用"
                   <c:if test="${navContent.isEnable eq '0'}">checked</c:if>>
        </div>
        <div class="layui-form-mid layui-word-aux">是否显示在前台导航栏</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">显示顺序：</label>
        <div class="layui-input-inline">
            <input type="number" name="sortOrder" lay-verify="required" class="layui-input"
                   value="${navContent.sortOrder}">
        </div>
        <div class="layui-form-mid layui-word-aux">导航栏的顺序</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="nav">保存</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    /*var mm = {
        bannerUrlArr: [],
        bannerUrlStr: '${navContent.bannerUrls}',
    };
    先暂时关闭轮播图管理
    $(function () {
        multiImg.initList(mm.bannerUrlArr, mm.bannerUrlStr);
        uploadUtil.initUpload("test2", true, function (res) {
            multiImg.appendImg(mm.bannerUrlArr, res.data.filePath);
        })
    });*/
    form.render();
    //监听提交
    form.on('submit(nav)', function (data) {
        //data.field.bannerUrls = jsonUtil.parseStr(mm.bannerUrlArr);
        console.log(data.field);
        ajaxUtil.postDealCode("${ctx}/back/nav/update", data.field, true, function (data) {
            layerUtil.success("保存成功");
        });
        return false;
    });

</script>
</body>
</html>
