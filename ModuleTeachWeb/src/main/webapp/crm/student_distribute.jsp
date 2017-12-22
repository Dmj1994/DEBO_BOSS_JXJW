<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="../../res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../../res/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="../../res/js/plugins/layer/skin/default/layer.css?0820" rel="stylesheet" media="all">


    <link href="../../res/css/animate.css" rel="stylesheet">
    <link href="../../res/css/style.css?v=4.1.0" rel="stylesheet">

    <!-- jqgrid-->
    <link href="../../res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap.css?0820" rel="stylesheet">
    <link href="../../res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap-ui.css?0820" rel="stylesheet">


    <link rel="stylesheet" href="../../res/js/plugins/layui/css/layui.css" media="all">
    <style>
        .ibox-content {
            padding: 5px
        }

        .float-e-margins .btn {
            margin-bottom: 0px
        }
    </style>


</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <!--搜索栏-->
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    您在这里可以进行量的分配
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>您将以下新量</h5>
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content" id="table_container">
                    <table id="stuGrid"></table>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5><strong id="s_user_name"></strong>分配给以下对象</h5>
                </div>
                <div class="ibox-content" style="padding:15px">
                    <form class="layui-form" action="../../boss/crm/distibuteStudent" id="distribute_form">
                        <input type="hidden" name="studentIds" id="studentIds"/>
                        <div class="layui-form-item" id="div_all_consult_parent">
                            <div id="div_all_consult">

                            </div>
                        </div>

                        <div class="layui-form-item">
                                <button class="layui-btn" lay-submit="" lay-filter="save_btn">立即分配</button>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </div>

</div>
<!-- 全局js -->
<script src="../../res/js/jquery.min.js?v=2.1.4"></script>
<script src="../../res/js/bootstrap.min.js?v=3.3.6"></script>


<!-- 自定义js -->
<script src="../../res/js/content.js?v=1.0.0"></script>

<script src="../../res/js/plugins/layui/layui.js" charset="utf-8"></script>

<script src="../../res/js/jquery.form.js" charset="utf-8"></script>

<!-- jqGrid -->
<script src="../../res/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="../../res/js/plugins/jqGrid2/js/jquery.jqGrid.min.js?0820"></script>


<!-- Page-Level Scripts -->
<script>


    $(document).ready(function () {
        var studentIds = getQueryString("studentIds");
        $("#studentIds").val(studentIds);
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#stuGrid").jqGrid({
            url: '../../boss/crm/loadDistibuteStudents?studentIds=' + studentIds,
            datatype: "json",
            jsonReader: {
                root: "data"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {label: '姓名', name: 'stuName'},
                {label: '电话', name: 'phone'}
            ],
            height: 400,
            rowNum: 10,
            autowidth: true
        });
        $(window).resize(function () {
            $("#stuGrid").setGridWidth($("#table_container").width() - 10);
        });
    });

</script>
<script>

    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer;
        //监听提交
        form.on('submit(save_btn)', function (data) {

            if (!data.field.consultIds) {
                layer.msg('您还没有选择分配对象');
            } else
                submitForm();
            return false;
        });

        $.ajax({
            url: "../../boss/crm/loadRadioForDistribute",
            dataType: "html",
            success: function (da) {
                $("#div_all_consult").html(da);
                form.render("radio");
            }
        });

    });

    function submitForm() {
        $("#distribute_form").ajaxSubmit({
            beforeSend: function () {
                $("button[lay-filter='save_btn']").addClass("layui-btn-disabled");
                $("button[lay-filter='save_btn']").text("保存中...");
            }, success: function () {
                $("button[lay-filter='save_btn']").removeClass("layui-btn-disabled");
                $("button[lay-filter='save_btn']").text("立即提交");
                layer.open({
                    title: "提示",
                    type: 0,
                    content: '数据保存成功'
                });
                parent.closeAdd();
            }
        });
    }
</script>
</body>
</html>
