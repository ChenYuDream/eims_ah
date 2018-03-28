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
    <%@include file="../../public/back/commonCss.jsp" %>
    <%@include file="../../public/back/commonJs.jsp" %>
</head>
<body ms-controller="content">
<div class="pd">
    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">内容设置</li>
        </ul>
        <div class="layui-tab-content ">
            <div class="layui-tab-item layui-show">
                <div class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">官网地址：</label>
                        <div class="layui-input-inline" style="width: 300px;">
                            <input type="text" ms-duplex="config.webUrl" lay-verify="required" placeholder="官网地址"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item layui-upload">
                        <label class="layui-form-label">官网logo：</label>
                        <div class="layui-input-inline" style="width: 400px">
                            <button type="button" class="layui-btn layui-btn-small" id="test1">
                                <i class="layui-icon">&#xe67c;</i>上传logo
                            </button>
                            <img class="layui-upload-img" width="150" id="demo1"
                                 ms-attr-src="${baseInfo.fileServerPath}{{config.logoUrl}}" ms-if="config.logoUrl!=''">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">联系方式：</label>
                        <div class="layui-input-inline" style="width: 300px;">
                            <input type="text" ms-duplex="config.phone" lay-verify="required" placeholder="联系方式"
                                   class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">邮箱：</label>
                        <div class="layui-input-inline" style="width: 300px;">
                            <input type="text" ms-duplex="config.email" lay-verify="required" placeholder="邮箱"
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
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var vm = {
        config: {
            webUrl: '',
            logoUrl: '',
            phone: '',
            email: ''
        },
        initConfig: function () {
            var config = '${setting.config}';
            console.log(config);
            if (!config) {

            } else {
                vm.config = jsonUtil.parseJson(config);
            }

        }
    }
    vm = avalonFn.define("content", vm);
    $(function () {
        vm.initConfig();
        uploadUtil.initUpload("test1", false, function (res) {
            vm.config.logoUrl = res.data.filePath;
        })
    });
    //监听提交
    layui.form.on('submit(content)', function (data) {
        var dataStr = {id: '${setting.id}', config: jsonUtil.parseStr(vm.$model.config)}
        ajaxUtil.post("${ctx}/back/form/setting/update", dataStr, true, function (res) {
            layerUtil.success("保存成功");
        })
        return false;
    });
</script>
</body>
</html>
