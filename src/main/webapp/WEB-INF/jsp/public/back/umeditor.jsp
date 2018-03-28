<!-- 样式文件 -->
<link rel="stylesheet" href="${ctx}/static/umeditor/themes/default/css/umeditor.css">
<!-- 引用jquery -->
<script src="${ctx}/static/umeditor/third-party/jquery.min.js"></script>
<!-- 引入 etpl -->
<script type="text/javascript" src="${ctx}/static/umeditor/third-party/template.min.js"></script>
<!-- 配置文件 -->
<script type="text/javascript" src="${ctx}/static/umeditor/umeditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="${ctx}/static/umeditor/umeditor.js"></script>
<!-- 语言包文件 -->
<script type="text/javascript" src="${ctx}/static/umeditor/lang/zh-cn/zh-cn.js"></script>
<!-- 实例化编辑器代码 -->
<script type="text/javascript">
    $(function () {
        window.um = UM.getEditor('container',{
            toolbar:[
                'source | undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat |',
                'insertorderedlist insertunorderedlist | selectall cleardoc paragraph | fontfamily fontsize' ,
                '| justifyleft justifycenter justifyright justifyjustify |',
                'link unlink | map',
                '| horizontal print preview fullscreen', 'drafts', 'formula'
            ]
        });
    });
</script>