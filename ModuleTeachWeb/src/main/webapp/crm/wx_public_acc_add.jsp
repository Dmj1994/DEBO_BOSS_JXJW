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

<form class="layui-form" id="save_form" action="../wx/saveAcc" method="post">
    <div style="padding:20px">
        <div class="layui-form-item">
            <label class="layui-form-label">公众号名称</label>
            <div class="layui-input-block">
                <input type="text" name="wcName" lay-verify="required" class="layui-input" placeholder="必填">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">AppID</label>
            <div class="layui-input-block">
                <input type="text" name="wcAppId" lay-verify="required" class="layui-input" placeholder="必填">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">AppSecret</label>
            <div class="layui-input-block">
                <input type="text" name="wcAppSecret" lay-verify="required" class="layui-input" placeholder="必填">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" lay-submit="" lay-filter="save_btn">立即提交</a>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</form>

<script src="../res/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="../res/js/jquery.min.js" charset="utf-8"></script>
<script src="../res/js/jquery.form.js" charset="utf-8"></script>
<script src="../res/js/common/area.js" charset="utf-8"></script>
<script src="../res/js/content.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;


        var editIndex = layedit.build('adviceContent'); //建立编辑器
        //监听提交
        form.on('submit(save_btn)', function (data) {
            $("#demo").val(layedit.getContent(editIndex));
            $("#save_form").ajaxSubmit({
                dataType: "json",
                beforeSend: function () {
                    $("button[lay-filter='save_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='save_btn']").text("保存中...");
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

</script>

</body>
</html>