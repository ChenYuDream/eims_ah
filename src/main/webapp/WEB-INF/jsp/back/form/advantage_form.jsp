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
<table class="layui-table">
    <thead>
    <tr>
        <th>标题</th>
        <th width="50%">介绍</th>
        <th style="text-align: center">排序</th>
        <th style="text-align: center">操作</th>
    </tr>
    </thead>
    <tbody>
    <tr ms-repeat="tableData" align="center">
        <td align="left">{{el.title}}</td>
        <td align="left">{{el.contentText}}</td>
        <td>{{el.sortOrder}}</td>
        <td>
            <button class="layui-btn layui-btn-primary layui-btn-mini" ms-on-click="editData(el)">编辑</button>
            <button class="layui-btn layui-btn-danger layui-btn-mini" ms-on-click="removeData(el)">删除</button>
        </td>
    </tr>
    </tbody>
</table>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>底部滚动图片</legend>
</fieldset>
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
    <label class="layui-form-label"></label>
    <div class="layui-input-block">
        <button class="layui-btn" lay-submit lay-filter="content2">保存</button>
    </div>
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>表单</legend>
</fieldset>
<div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">输入标题：</label>
        <div class="layui-input-inline" style="width: 400px">
            <input type="text" name="sortOrder" ms-duplex="news.title" placeholder="请输入标题" lay-verify="required"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容：</label>
        <div class="layui-input-inline" style="width: 400px">
            <textarea placeholder="请输入内容" lay-verify="required" ms-duplex="news.contentText"
                      class="layui-textarea"></textarea>
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
        bannerUrlArr: [],
        bannerUrlStr: '${navContent.content}',
    };
    var vm = {
        tableData: [],
        news: {id: '', title: '', contentText: '', contentType: '${navContent.tag}', sortOrder: 0},
        bakNews: {id: '', title: '', contentText: '', contentType: '${navContent.tag}', sortOrder: 0},
        addData: function () {
            vm.news = vm.$model.bakNews
        },
        editData: function (el) {
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
        }
    }
    vm = avalonFn.define("content", vm);
    $(function () {
        vm.loadTableData();
        multiImg2.imgDom = 'd3';
        multiImg2.initList(am.bannerUrlArr, am.bannerUrlStr);
        uploadUtil.initUpload("t3", true, function (res) {
            multiImg2.appendImg(am.bannerUrlArr, res.data.filePath);
        })
    });

    //监听提交
    form.on('submit(content)', function (data) {
        vm.saveData();
        return false;
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
