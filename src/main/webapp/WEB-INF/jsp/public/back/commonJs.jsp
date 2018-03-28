<script type="text/javascript" src="${ctx}/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/layui/layui.all.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/static/back/js/jparticle.jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/static/js/avalon.shim.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/static/js/function.js" charset="utf-8"></script>
<script type="text/javascript">
    var form = layui.form;
    var upload = layui.upload;
    var layedit = layui.layedit;
    var carousel = layui.carousel;
    layedit.set({
        uploadImage: {
            url: '${ctx}/back/upload/img' //接口url
        }
    });
    var option = {
        tool: [
            'strong' //加粗
            , 'italic' //斜体
            , 'underline' //下划线
            , 'del' //删除线
            , '|' //分割线
            , 'left' //左对齐
            , 'center' //居中对齐
            , 'right' //右对齐
            , 'link' //超链接
            , 'unlink' //清除链接
        ]
    }
    var uploadUtil = {
        initUpload: function (dom, isMany, fn) {
            upload.render({
                elem: '#' + dom,
                url: '${ctx}/back/upload/img',
                multiple: isMany,
                done: function (res) {
                    //上传完毕
                    fn && fn(res);
                }
            });
        }
    }
</script>