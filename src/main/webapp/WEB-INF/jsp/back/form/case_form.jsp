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
<head>
    <%@include file="../../public/back/otherCommon.jsp" %>
    <%@include file="../../public/back/umeditor.jsp" %>
</head>
<body ms-controller="content">
<table class="layui-table">
    <thead>
    <tr>
        <th>轮播</th>
        <th>标题</th>
        <th width="50%">内容</th>
        <th style="text-align: center">排序</th>
        <th style="text-align: center">操作</th>
    </tr>
    </thead>
    <tbody>
    <tr ms-repeat="tableData" align="center">
        <td>
            <button class="layui-btn layui-btn-normal layui-btn-small" ms-on-click="previewImg(el)">预览轮播图</button>
        </td>
        <td align="left">{{el.title}}</td>
        <td align="left">{{el.contentText|html}}</td>
        <td>{{el.sortOrder}}</td>
        <td>
            <button class="layui-btn layui-btn-primary layui-btn-mini" ms-on-click="editData(el)">编辑</button>
            <button class="layui-btn layui-btn-danger layui-btn-mini" ms-on-click="removeData(el)">删除</button>
        </td>
    </tr>
    </tbody>
</table>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>案例表单</legend>
</fieldset>
<div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">轮播图：</label>
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
        <label class="layui-form-label">输入标题：</label>
        <div class="layui-input-inline" style="width: 400px">
            <input type="text" name="sortOrder" ms-duplex="news.title" placeholder="请输入标题" lay-verify="required"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容：</label>
        <div class="layui-input-inline" style="width: 70%">
            <textarea id="container" name="container" style="width: 100%;height: 410px;">
                        </textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">显示顺序：</label>
        <div class="layui-input-inline">
            <input type="number" name="sortOrder" ms-duplex="news.sortOrder" lay-verify="required" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="content">保存</button>
            <button class="layui-btn layui-btn-primary" ms-on-click="addData">重置</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    var am = {
        bannerUrlArr: []
    };
    var vm = {
        tableData: [],
        news: {id: '', title: '', showImgs: '', contentText: '', contentType: '${navContent.tag}', sortOrder: 0},
        bakNews: {id: '', title: '', showImgs: '', contentText: '', contentType: '${navContent.tag}', sortOrder: 0},
        addData: function () {
            um.setContent('');
            multiImg2.removeAll(am.bannerUrlArr);
            vm.news = vm.$model.bakNews;
        },
        editData: function (el) {
            um.setContent(el.$model.contentText)
            multiImg2.initList(am.bannerUrlArr, el.$model.showImgs);
            vm.news = el.$model;
        },
        removeData: function (el) {
            layerUtil.confirm("你确定删除吗？", function () {
                ajaxUtil.post("${ctx}/news/delete/" + el.id, "", false, function (data) {
                    layerUtil.success("删除成功");
                    vm.loadTableData();
                })
            })
        },
        saveData: function () {
            console.log(vm.$model.news);
            ajaxUtil.post("${ctx}/news/save", vm.$model.news, true, function (data) {
                layerUtil.success("保存成功");
                vm.addData();
                vm.loadTableData();
            });
        },
        loadTableData: function () {
            ajaxUtil.post("${ctx}/news/list/${navContent.tag}", "", false, function (data) {
                console.log(data);
                vm.tableData = data.data;
            })
        },
        previewImg: function (el) {
            layerUtil.iFrame("${ctx}/back/iframe/preview/news/" + el.id, false, ["548px", "400px"]);
        }
    }
    vm = avalonFn.define("content", vm);
    $(function () {
        vm.loadTableData();
        multiImg2.imgDom = 'd3';
        uploadUtil.initUpload("t3", true, function (res) {
            multiImg2.appendImg(am.bannerUrlArr, res.data.filePath);
        })
    });

    //监听提交
    form.on('submit(content)', function (data) {
        vm.news.contentText = um.getContent();
        vm.news.showImgs = jsonUtil.parseStr(am.bannerUrlArr);
        vm.saveData();
        return false;
    });
</script>
</body>
</html>
