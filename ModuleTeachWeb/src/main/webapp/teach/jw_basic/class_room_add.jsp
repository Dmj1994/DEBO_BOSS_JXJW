<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加学员</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="/res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link rel="stylesheet" href="/res/js/plugins/layui/css/layui.css" media="all">
    <link href="/res/css/style.css?v=4.1.0" rel="stylesheet">
    <style>
        .layui-form-item .layui-inline{
            margin-right:0px
        }
        .layui-form-item {
            margin-bottom: 10px
        }
        .required-field {
            color: red
        }
        .layui-form-radio{margin:6px 0px 0 0}
        .layui-form-checkbox span{padding:0px 4px}

    </style>
</head>
<body>

<form class="layui-form" id="stu_form" action="../boss/crm/saveStudent" method="post">
    <div class="row " style="padding:20px">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label ">教室名称</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuName" class="layui-input" placeholder="必填">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">座位数</label>
                    <div class="layui-input-inline">
                        <input type="text" name="onlineConsult" class="layui-input">
                    </div>
                </div>
            </div>


            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label required-field">用途</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phones" class="layui-input" lay-verify="required"
                               placeholder="请注意格式">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">所在校区</label>
                    <div class="layui-input-inline" >
                        <select name="gender">
                            <option value="未知">未知</option>
                            <option value="拱北">拱北</option>
                            <option value="武林门">武林门</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-form-item" id="ct_break">
                <div class="layui-inline">
                    <label class="layui-form-label">设备列表</label>
                    <div class="layui-input-inline">
                        <input type="text" name="stuAge" class="layui-input"
                               placeholder="只能是数字">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">维护周期</label>
                    <div class="layui-input-inline">
                        <input type="text" name="keyInfo" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">维护人</label>
                    <div class="layui-input-inline">
                        <input type="text" name="keyInfo" class="layui-input">
                    </div>
                </div>

                <div class="layui-inline">
                    <label class="layui-form-label">维护周期</label>
                    <div class="layui-input-inline">
                        <select name="stuEducation" id="stuEducation">
                            <option value="">一年</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit="" lay-filter="stu_save_btn">立即提交</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
    </div>
</form>

<script src="/res/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="/res/js/jquery.min.js" charset="utf-8"></script>
<script src="/res/js/jquery.form.js" charset="utf-8"></script>
<script src="/res/js/common/area.js" charset="utf-8"></script>
<script src="/res/js/content.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
    });
</script>

</body>
</html>