<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="/res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/res/css/font-awesome.css" rel="stylesheet">
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
       .ibox{margin-bottom: 0px}
        .layui-input-block{margin-left: 100px}
        .layui-input{width:80%;display: inline;margin-right: 15px}
    </style>
</head>
<body>
<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>ACCP >> Y2 >>  使用hibernate改造租房系统</h5>
    </div>
    <div class="ibox-content">
        <p>章节数：16</p>
    </div>
</div>

<form class="layui-form" id="data_form" action="../boss/teach/saveCharpters" method="post">
    <div class="row " style="padding:20px">
        <div class="layui-form-item">
                <label class="layui-form-label ">CH 1</label>
                <div class="layui-input-block">
                    <input type="text" name="charpters[0].charpterName" class="layui-input" lay-verify="required">
                </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label ">CH 2</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[1].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label ">CH 3</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[2].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 4</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[3].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 5</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[4].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 6</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[5].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 7</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[6].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 8</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[7].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 9</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[8].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 10</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[9].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 11</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[10].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label ">CH 12</label>
            <div class="layui-input-block">
                <input type="text" name="charpters[11].charpterName" class="layui-input" lay-verify="required">
                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>
            </div>
        </div>

        <div class="layui-form-item" id="breakPoint">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="save_btn">立即提交</button>
                <button class="layui-btn layui-btn-normal" type="button" onclick="addCharpters()"><i class="fa fa-search-plus"></i>&nbsp;&nbsp;新增章节</button>
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

        form.on('submit(save_btn)', function (data) {
            $("#data_form").ajaxSubmit({
                dataType: "json",
                beforeSend: function () {
                    $("button[lay-filter='save_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='save_btn']").text("保存中...");
                }, success: function (da) {
                    $("button[lay-filter='save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='save_btn']").text("立即提交");
                    if (da.resultCode != "10002") {
                         layer.msg(da.resultMsg);
                    } else {
                        layer.msg("添加成功");
                            layer.close(l1);
                    }
                }, error: function () {
                    $("button[lay-filter='save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='save_btn']").text("立即提交");
                }
            });
            return false;
        });

        bindDelete();
    });

    function bindDelete(){
        $(".btn-danger").bind("click",function (){
            $(this).parent().parent().remove();
            rebuildIndex();
            return false;
        });
    }

    function rebuildIndex(){
        $(".layui-form-label").each(function(i){
            $(this).text("CH "+(i+1) );
        });

        $(".layui-input").each(function(i){
            $(this).attr("name","charpters["+i+"].charpterName");
        });
    }

    function addCharpters(){
        var html =' <div class="layui-form-item">\n' +
            '            <label class="layui-form-label">CH 15</label>\n' +
            '            <div class="layui-input-block">\n' +
            '                <input type="text" name="charpters.charpterName" class="layui-input" lay-verify="required">\n' +
            '                <button class="layui-btn btn-danger layui-btn-small" title="删除" ><i class="fa fa-times"></i></button>\n' +
            '            </div>\n' +
            '        </div>';
        $("#breakPoint").before(html);
        rebuildIndex();
        bindDelete();
    }
</script>

</body>
</html>