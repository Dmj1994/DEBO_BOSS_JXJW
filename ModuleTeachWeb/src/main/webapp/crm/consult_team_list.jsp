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
    <link href="../res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="../res/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- jqgrid-->
    <link href="../res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap.css?0820" rel="stylesheet">
    <link href="../res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap-ui.css?0820" rel="stylesheet">


    <link href="../res/js/plugins/layer/skin/default/layer.css?0820" rel="stylesheet" media="all">

    <link href="../res/css/animate.css" rel="stylesheet">
    <link href="../res/css/style.css?v=4.1.0" rel="stylesheet">
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
        <div class="col-md-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <button class="btn btn-success " type="button" onClick="addNewTeam()"><i
                            class="fa fa-plus"></i>&nbsp;<span class="bold">新增咨询小组</span></button>
                </div>
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">

                <div class="ibox-content">
                    <table id="jqGrid"></table>
                    <div id="jqGridPager"></div>

                </div>
            </div>
        </div>
    </div>


</div>
<!-- 全局js -->
<script src="../res/js/jquery.min.js?v=2.1.4"></script>
<script src="../res/js/bootstrap.min.js?v=3.3.6"></script>

<!-- jqGrid -->
<script src="../res/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="../res/js/plugins/jqGrid2/js/jquery.jqGrid.min.js?0820"></script>

<!-- layer -->
<script src="../res/js/plugins/layer/layer.js?0820"></script>

<!-- 自定义js -->
<script src="../res/js/content.js?v=1.0.0"></script>
<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '../boss/crm/consultTeamList',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {label: '校区', name: 'organizationName'},
                {label: '小组名称', name: 'teamName'},
                {label: '组长', name: 'chargerName'},
                {label: '成员', name: 'teamMembersNames'}
            ],
            viewrecords: true, // show the current page, data rang and total records on the toolbar
            height: 400,
            rowNum: 10,
            autowidth: true,
            multiselect: true,
            pager: "#jqGridPager",
            ajaxGridOptions: ajaxGridOptionsGlobal,
            ondblClickRow: function (rowId, e) {
                var grid = $(this);
                var rowData = grid.jqGrid("getRowData", rowId);
                showTeam(rowData.uuid);
            }
        });
        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });


    var addWindow;
    function addNewTeam() {
        addWindow = layer.open({
            title: "添加新组",
            type: 2,
            content: 'consult_team_add.html',
            maxmin: true
        });
        layer.full(addWindow);
    }

    function showTeam(teamId) {

        addWindow = layer.open({
            title: "组信息",
            type: 2,
            content: '../boss/crm/consultTeamDetail?teamId=' + teamId,
            maxmin: true
        });
        layer.full(addWindow);
    }



    function closeAdd() {
        layer.close(addWindow);
        $("#jqGrid").trigger("reloadGrid");
    }


</script>


</body>

</html>
