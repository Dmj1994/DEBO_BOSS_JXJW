<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="favicon.ico">
    <link href="../res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../res/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="../res/css/animate.css" rel="stylesheet">
    <link href="../res/css/plugins/summernote/summernote.css" rel="stylesheet">
    <link href="../res/css/plugins/summernote/summernote-bs3.css" rel="stylesheet">
    <link href="../res/css/style.css?v=4.1.0" rel="stylesheet">
    <link rel="stylesheet" href="../res/js/plugins/layui/css/layui.css" media="all">
    <style>
        .layui-form-item {
            margin-bottom: 10px
        }

        .layui-form-pane .layui-form-label {
            width: 90px
        }

        .layui-form-pane .layui-input-block {
            margin-left: 100px;
        }
    </style>
</head>
<body>

<form class="layui-form" id="save_form" action="../wx/saveAccArticle" method="post">
    <div style="padding:20px">
        <div class="layui-form-item">
            <label class="layui-form-label">文章标题</label>
            <div class="layui-input-block">
                <input type="text" name="articleTitle" lay-verify="required" class="layui-input" placeholder="必填">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">封面图片</label>
            <div class="layui-input-block">
                <input type="text" name="articleCover" class="layui-input" placeholder="必填">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">文章内容</label>
            <div class="layui-input-block">
                <div class="summernote">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" lay-submit="" lay-filter="save_btn">立即提交</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
    <input type="hidden" name="articleContent" id="articleContent"/>
</form>

<!-- 全局js -->
<script src="../res/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="../res/js/jquery.min.js?v=2.1.4"></script>
<script src="../res/js/jquery.form.js"></script>
<script src="../res/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="../res/js/content.js?v=1.0.0"></script>
<!-- SUMMERNOTE -->
<script src="../res/js/plugins/summernote/summernote.min.js"></script>
<script src="../res/js/plugins/summernote/summernote-zh-CN.min.js"></script>
<script src="../res/js/content.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form()
            , layer = layui.layer;
        //监听提交
        form.on('submit(save_btn)', function (data) {
            var content = $(".summernote").summernote("code");
            $("#articleContent").val(content);
            $("#save_form").ajaxSubmit({
                dataType: "json",
                beforeSend: function (xhr) {
                }, success: function (da) {
                    $("button[lay-filter='save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='save_btn']").text("立即提交");
                    var l1 = layer.confirm('添加成功，是否继续添加', {
                        btn: ['继续添加', '不添加'] //可以无限个按钮
                    }, function (index, layero) {
                        $("#save_form").trigger("reset");
                        layer.close(l1);
                    }, function (index) {
                        parent.closeAdd();
                    });
                }
            });
            return false;
        });
    });
    $(document).ready(function () {
        $('.summernote').summernote({
            lang: 'zh-CN',
            callbacks: {
                onImageUpload: function (files) { //the onImageUpload API
                    uploadPic(files);
                    return false;
                }
            }
        });
    });

    function uploadPic(files) {
        var data = new FormData();        //html5提供的formdata对象，将图片加载为数据的容器
        data.append('pic', files[0]);  //加载选中的第一张图片，并给这图片数据标记一个'image_up'的名称
        //调用上传图片
        $.ajax({
            url: '../wx/uploadWCArticlePic',     //上传图片请求的路径
            method: 'POST',            //方法
            data: data,           //数据
            processData: false,        //告诉jQuery不要加工数据
            contentType: false,        //<code class="javascript comments"> 告诉jQuery,在request head里不要设置Content-Type
            dataType: "json",
            success: function (data) {  //图片上传成功之后，对返回来的数据要做的事情
                if (data.code == 0) {
                    $('.summernote').summernote('insertImage', data.data.src);       //调用内部api——insertImage以路径的形式插入图片到文本编辑区
                }

            }
        });
    }
</script>

</body>
</html>