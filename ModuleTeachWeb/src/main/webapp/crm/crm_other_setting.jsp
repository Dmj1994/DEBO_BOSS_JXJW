<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <base href="/crm/">
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

<form class="layui-form" id="form" action="../boss/crm/updateOtherSetting" method="post">
    <div style="padding:20px">

        <div class="layui-form-item">
            <label class="layui-form-label">自动回公海时间</label>
            <div class="layui-input-block" style="max-width:580px">
                <input type="text" name="autoBack2publicSeaTime" lay-verify="required|number" class="layui-input"
                       placeholder="以小时为单位" value="${crmOtherSet.autoBack2publicSeaTime}"
                       style="width:240px;display: inline">
                <span style="color:#999999">以小时为单位</span>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="save_btn">立即更新</button>
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


        //监听提交
        form.on('submit(save_btn)', function (data) {
            $("#form").ajaxSubmit({
                beforeSend: function () {
                    $("button[lay-filter='stu_save_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("保存中...");

                }, success: function () {
                    $("button[lay-filter='stu_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("立即更新");
                    layer.msg("更新成功!");

                }, error: function () {
                    $("button[lay-filter='stu_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("立即更新");
                }
            });
            return false;
        });

    });

</script>

</body>
</html>