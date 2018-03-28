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
<body>
<div class="layui-form">
    <input type="hidden" name="id" value="${navContent.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">模块一：</label>
        <div class="layui-input-inline">
            <input type="text" name="title_cn1" lay-verify="required" placeholder="安华业务" class="layui-input"
                   value="${title_cn1}">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="title_en1" lay-verify="required" placeholder="company business"
                   class="layui-input" value="${title_en1}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">模块二：</label>
        <div class="layui-input-inline">
            <input type="text" name="title_cn2" lay-verify="required" placeholder="安华案例" class="layui-input"
                   value="${title_cn2}">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="title_en2" lay-verify="required" placeholder="company case" class="layui-input"
                   value="${title_en2}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">安华案例：</label>
        <div class="layui-input-inline" style="width: 130px;">
            <button type="button" class="layui-btn layui-btn-small" id="t3">上传多图</button>
            <button type="button" class="layui-btn layui-btn-small layui-btn-primary"
                    onclick="multiImg2.removeAll(am.bannerUrlArr)">清除
            </button>
        </div>
        <div class="layui-form-mid layui-word-aux">注* 请保持上传图片尺寸统一</div>
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
        <label class="layui-form-label">模块三：</label>
        <div class="layui-input-inline">
            <input type="text" name="title_cn3" lay-verify="required" placeholder="联系方式" class="layui-input"
                   value="${title_cn3}">
        </div>
        <div class="layui-input-inline">
            <input type="text" name="title_en3" lay-verify="required" placeholder="contact information"
                   value="${title_en3}"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="content">保存</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    var am = {
        bannerUrlArr: [],
        bannerUrlStr: '${imgList}',
    };
    $(function () {
        multiImg2.imgDom = "d3";
        multiImg2.initList(am.bannerUrlArr, am.bannerUrlStr);
        uploadUtil.initUpload("t3", true, function (res) {
            multiImg2.appendImg(am.bannerUrlArr, res.data.filePath);
        })
    });
    //监听提交
    form.on('submit(content)', function (data) {
        data.field.imgList = jsonUtil.parseStr(am.bannerUrlArr);
        var dataStr = {id: data.field.id, content: jsonUtil.parseStr(data.field)};
        console.log(dataStr);
        ajaxUtil.post("${ctx}/back/nav/update/content", dataStr, true, function (result) {
            layerUtil.success("保存成功");
        })
        return false;
    });
</script>
</body>
</html>
