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
                        <button class="btn btn-primary " type="button" onclick="bizDialog('kq')"><i class="fa fa-calendar-check-o"></i>考勤管理</button>
                        <button class="btn btn-primary " type="button" onclick="bizDialog('zy')"><i class="fa fa-pencil"></i>作业情况</button>
                        <button class="btn btn-primary " type="button" onclick="bizDialog('ks')">&nbsp;考试情况</button>
                        <button class="btn btn-primary " type="button" onclick="bizDialog('ft')">&nbsp;访谈管理</button>
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
                    <div id="jqGridPager" style="text-align: right">

                    </div>
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
                {label: '班级名称', name: 'className', fixed: true, width: "80", sortable: false},
                {label: '产品', name: 'productName', fixed: true, width: "80", sortable: false},
                {label: '班级人数', name: 'classStuNums', width: "80"},
                {label: '班主任', name: 'assist', width: "85"},
                {label: '出勤率', name: 'attendaceRate', width: "125"},
                {label: '当前进度', name: 'stage', width: "125"}
            ],
            viewrecords: true, // show the current page, data rang and total records on the toolbar
            height: 350,
            autowidth: true,
            pager: "#jqGridPager",
            multiselect: true,
            ajaxGridOptions: ajaxGridOptionsGlobal,
            ondblClickRow: function (rowId, e) {
                var grid = $(this);
                var rowData = grid.jqGrid("getRowData",rowId);

            }
        });
        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });


    var windowObj;
    function showAttendance(){
        windowObj = layer.open({
            title: "考勤详情",
            type: 2,
            content: "/teach/jw_biz/attendance_detail.jsp" ,
            maxmin: true,
            area:['650px','400px']
        });
        layer.full(windowObj);
    }

    function bizDialog(bizType){
        var url ="";
        var  title="";
        if(bizType=='kq'){
            url="/teach/jxjz_biz/attendance_detail.jsp";
            title="考勤管理";
        }else  if(bizType=='zy'){
            url="/teach/jxjz_biz/paper_work.jsp";
            title="作业情况";
        }

        windowObj = layer.open({
            title:title,
            type: 2,
            anim: getRandom0to6(),
            content: url,
            area:["100%","100%"]
        });
        layer.full(windowObj);
    }


</script>
</body>

</html>
