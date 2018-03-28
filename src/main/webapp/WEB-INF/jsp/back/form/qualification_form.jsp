<%--
  Created by IntelliJ IDEA.
  User: ChenYu
  Date: 2017-06-12
  Time: 17:13
  To change this template use File | Settings | File Templates.
  安华优势
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/taglib.jsp" %>
<html>
<body ms-controller="content">
<div class="layui-form-item">
    <label class="layui-form-label">安华资质：</label>
    <div class="layui-input-inline" style="width: 130px;">
        <button type="button" class="layui-btn layui-btn-small" id="t3">上传多图</button>
        <button type="button" class="layui-btn layui-btn-small layui-btn-primary"
                onclick="multiImg2.removeAll(am.bannerUrlArr)">清除
        </button>
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label"></label>
    <div class="layui-input-inline" style="width: 80%">
        <div class="layui-upload">
            <blockquote class="layui-elem-quote layui-quote-nm">
                <div class="layui-upload-list" id="d3"></div>
            </blockquote>
        </div>
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label"></label>
    <div class="layui-input-block">
        <button class="layui-btn" lay-submit lay-filter="content2">保存</button>
    </div>
</div>
<script type="text/javascript">
    var am = {
        bannerUrlArr: [],
        bannerUrlStr: '${navContent.content}',
    };
    $(function () {
        multiImg2.imgDom = 'd3';
        multiImg2.initList(am.bannerUrlArr, am.bannerUrlStr);
        uploadUtil.initUpload("t3", true, function (res) {
            multiImg2.appendImg(am.bannerUrlArr, res.data.filePath);
        })
    });
    //监听提交
    form.on('submit(content2)', function (data) {
        var dataStr = {id: '${navContent.id}', content: jsonUtil.parseStr(am.bannerUrlArr)};
        console.log(dataStr);
        ajaxUtil.post("${ctx}/back/nav/update/content", dataStr, true, function (result) {
            layerUtil.success("保存成功");
        })
        return false;
    });
</script>
</body>
</html>
