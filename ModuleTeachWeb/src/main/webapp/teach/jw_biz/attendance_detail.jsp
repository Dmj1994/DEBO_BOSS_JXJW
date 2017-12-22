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

    <link href="/res/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- jqgrid-->
    <link href="/res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap.css?0820" rel="stylesheet">
    <link href="/res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap-ui.css?0820" rel="stylesheet">


    <link href="/res/js/plugins/layer/skin/default/layer.css?0820" rel="stylesheet" media="all">

    <link href="/res/css/animate.css" rel="stylesheet">
    <link href="/res/css/style.css?v=4.1.0" rel="stylesheet">

    <link rel="stylesheet" href="/res/js/plugins/layui/css/layui.css" media="all">
    <link href="/res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <style>
        .ibox-content {
            padding: 5px
        }

        .float-e-margins .btn {
            margin-bottom: 0px
        }

        .layui-form-item {
            margin-bottom: 10px
        }

        .layui-form-label {
            width: 120px
        }

        .layui-input-block {
            margin-left: 120px;
        }

        .miniTable {
            font-size: 12px
        }
        .miniTable td {
            border-bottom: solid 1px #bdbdbd
        }

    </style>
</head>

<body class="gray-bg">

<div class="wrapper wrapper-content animated fadeInRight">
    <!--搜索栏-->
    <div class="row">
        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">

                    <form role="form" class="form-inline" id="search_form_small">
                        当前月份：2017年12月
                        <button class="btn btn-success " type="button" onclick="addClassRoom()"><i
                                class="fa fa-search-plus"></i>&nbsp;&nbsp;新增</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">

                <div class="ibox-content">
                    <table id="jqGrid"></table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width:90%;">
        <div class="modal-content animated bounceInRight" style="padding-top:20px;padding-bottom:10px">

        </div>
    </div>
</div>


<!-- 全局js -->
<script src="/res/js/jquery.min.js?v=2.1.4"></script>
<script src="/res/js/bootstrap.min.js?v=3.3.6"></script>
<script src="/res/js/jquery.serializejson.min.js" charset="utf-8"></script>

<!-- jqGrid -->
<script src="/res/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="/res/js/plugins/jqGrid2/js/jquery.jqGrid.min.js?0820"></script>


<!-- layer -->
<script src="/res/js/plugins/layer/layer.js?0820"></script>

<!-- 自定义js -->
<script src="/res/js/content.js?v=1.0.0"></script>


<script src="/res/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="/res/js/jquery.form.js" charset="utf-8"></script>
<script src="/res/js/common/area.js" charset="utf-8"></script>


<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '/teach/json/attendance.json',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {label: '头像', name: 'className',width:"40",fixed:true},
                {label: '姓名', name: 'className',width:"60",fixed:true},
                {label: '1', name: 'd1'}, {label: '2', name: 'd2'},
                {label: '3', name: 'd3'}, {label: '4', name: 'd4'},
                {label: '5', name: 'd5'}, {label: '6', name: 'd6'},
                {label: '7', name: 'd7'}, {label: '8', name: 'd8'},
                {label: '9', name: 'd9'},
                {label: '10', name: 'd10'}, {label: '11', name: 'd11'},
                {label: '12', name: 'd12'}, {label: '13', name: 'd13'},
                {label: '14', name: 'd14'}, {label: '15', name: 'd15'},
                {label: '16', name: 'd16'}, {label: '17', name: 'd17'},
                {label: '18', name: 'd18'}, {label: '19', name: 'd19'},
                {label: '20', name: 'd20'}, {label: '21', name: 'd21'},
                {label: '22', name: 'd22'}, {label: '23', name: 'd23'},
                {label: '24', name: 'd24'}, {label: '25', name: 'd25'},
                {label: '26', name: 'd26'}, {label: '27', name: 'd27'},
                {label: '28', name: 'd28'}, {label: '29', name: 'd29'},
                {label: '30', name: 'd30'},{label: '31', name: 'd31'},
            ],
            height: 400,
            rowNum: 10,
            autowidth: true,
            multiselect: false,
            ajaxGridOptions: ajaxGridOptionsGlobal
        });
        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });

    var windowObj;
    function showAttendance(){

    }
</script>
</body>

</html>
