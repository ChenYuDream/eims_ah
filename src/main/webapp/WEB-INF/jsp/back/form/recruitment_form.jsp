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
<style>
    .w25 {
        width: 25px;
    }
</style>
<body ms-controller="content" class="ms-controller">
<div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="content">保存</button>
            <button class="layui-btn layui-btn-primary" ms-on-click="cancel">取消</button>
        </div>
    </div>
    <blockquote class="layui-elem-quote">招聘对象和信息</blockquote>
    <div ms-repeat="recruitment.items_1">
        <div class="layui-form-item">
            <label class="layui-form-label">一级条目：</label>
            <div class="layui-input-inline" style="width: 700px">
                <input type="text" ms-duplex="el.title" lay-verify="required" placeholder="一级条目"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                删除父条目会一起删除其下所有的子条目
                <button class="layui-btn layui-btn-mini layui-btn-danger" ms-on-click="$remove">删除</button>
            </div>
        </div>
        <div ms-repeat-ell="el.items_2">
            <div class="layui-form-item">
                <label class="layui-form-label">二级条目：</label>
                <label class="layui-form-label w25"></label>
                <div class="layui-input-inline" style="width: 700px">
                    <input type="text" ms-duplex="ell.title" lay-verify="required" placeholder="二级条目"
                           class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    删除父条目会一起删除其下所有的子条目
                    <button class="layui-btn layui-btn-mini layui-btn-danger" ms-on-click="$remove">删除</button>
                </div>
            </div>
            <div class="layui-form-item" ms-repeat-elll="ell.items_3">
                <label class="layui-form-label">三级条目：</label>
                <label class="layui-form-label w25"></label>
                <label class="layui-form-label w25"></label>
                <div class="layui-input-inline" style="width: 700px">
                    <input type="text" ms-duplex="elll" lay-verify="required" placeholder="三级条目" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <button class="layui-btn layui-btn-mini layui-btn-danger" ms-on-click="$remove">删除</button>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label"></label>
                <label class="layui-form-label w25"></label>
                <label class="layui-form-label w25"></label>
                <div class="layui-input-inline">
                    <button class="layui-btn layui-btn-mini layui-btn-normal" ms-on-click="pushItems_3(ell)">
                        添加三级条目
                    </button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <label class="layui-form-label w25"></label>
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-mini layui-btn-normal" ms-on-click="pushItems_2(el)">添加二级条目
                </button>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-mini layui-btn-normal" ms-on-click="pushItems_1">添加一级条目</button>
        </div>
    </div>
    <blockquote class="layui-elem-quote">注意事项&声明</blockquote>
    <div ms-repeat="recruitment.texts_1">
        <div class="layui-form-item">
            <label class="layui-form-label">一级条目：</label>
            <div class="layui-input-inline" style="width: 700px">
                <input type="text" ms-duplex="el.title" lay-verify="required" placeholder="一级条目"
                       class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                删除父条目会一起删除其下所有的子条目
                <button class="layui-btn layui-btn-mini layui-btn-danger" ms-on-click="$remove">删除</button>
            </div>
        </div>
        <div ms-repeat-ell="el.texts_2">
            <div class="layui-form-item">
                <label class="layui-form-label">二级条目：</label>
                <label class="layui-form-label w25"></label>
                <div class="layui-input-inline" style="width: 700px">
                    <input type="text" ms-duplex="ell" lay-verify="required" placeholder="二级条目"
                           class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <button class="layui-btn layui-btn-mini layui-btn-danger" ms-on-click="$remove">删除</button>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"></label>
            <label class="layui-form-label w25"></label>
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-mini layui-btn-normal" ms-on-click="pushTexts_2(el)">添加二级条目
                </button>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"></label>
        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-mini layui-btn-normal" ms-on-click="pushTexts_1">添加一级条目</button>
        </div>
    </div>
</div>
<script type="text/javascript">
    var vm = {
        content: '${navContent.content}',
        recruitment: {
            id: '${navContent.id}',
            items_1: [],//招聘对象
            texts_1: []//描述对象
        },
        item_1: {title: "", items_2: []},
        item_2: {title: "", items_3: [""]},
        text_1: {title: "", texts_2: [""]},
        pushItems_1: function () {
            var item_1 = vm.$model.item_1;
            item_1.items_2.push(vm.$model.item_2);
            vm.recruitment.items_1.push(item_1);
        },
        pushItems_2: function (el) {
            el.items_2.push(vm.$model.item_2);
        },
        pushItems_3: function (ell) {
            ell.items_3.push("");
        },
        pushTexts_1: function () {
            vm.recruitment.texts_1.push(vm.$model.text_1);
        },
        pushTexts_2: function (el) {
            el.texts_2.push("");
        },
        initContent: function () {
            if (!vm.$model.content) {
                console.debug(vm.$model.content);
            } else {
                vm.recruitment = jsonUtil.parseJson(vm.$model.content);
                console.log(vm.$model.recruitment);
            }
        },
        cancel:function () {
            window.location.reload();
        }
    };
    vm = avalonFn.define("content", vm);
    vm.initContent();
    //监听提交
    form.on('submit(content)', function (data) {
        var dataStr = {id: '${navContent.id}', content: jsonUtil.parseStr(vm.$model.recruitment)};
        console.log(dataStr);
        ajaxUtil.post("${ctx}/back/nav/update/content", dataStr, true, function (result) {
            layerUtil.success("保存成功");
        });
        return false;
    });
</script>
</body>
</html>
