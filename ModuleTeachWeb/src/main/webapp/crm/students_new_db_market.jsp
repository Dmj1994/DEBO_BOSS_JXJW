<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>
<!DOCTYPE html>
<html>
<head>
    <base href="/"/>
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
                    <form role="form" class="form-inline">
                        <div class="form-group">
                            <label class="sr-only">用户名</label>
                            <input type="text" placeholder="请输入学员姓名" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="sr-only">密码</label>
                            <input type="text" placeholder="手机号码" class="form-control">
                        </div>

                        <button class="btn btn-primary " type="button">&nbsp;搜 索</button>
                        <button class="btn btn-info" type="button" onClick="javascript:"><i
                                class="fa fa-search-plus"></i>&nbsp;<span class="bold">高级查询</span></button>
                        <c:if test="${kf:hasResource('10_10_03_01',sessionScope.userResourceCodes)}">
                            <button class="btn btn-success " type="button" onClick="addNewStudent()"><i
                                    class="fa fa-plus"></i>&nbsp;<span class="bold">添加新量</span></button>
                        </c:if>
                        <c:if test="${kf:hasResource('10_10_09',sessionScope.userResourceCodes)}">
                            <button class="btn btn-success " type="button" onClick="distrbutStudent()"><i
                                    class="fa fa-plus"></i>&nbsp;<span class="bold">分量</span></button>
                        </c:if>
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
            url: '../boss/crm/studentsNewDB',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            multiselect: true,
            colModel: [
                {name: 'uuid', hidden: true},
                {label: '录入时间', name: 'registeTime', width: "120", fixed: true},
                {label: '姓名', name: 'stuName', width: "60", fixed: true},
                {label: '性别', name: 'gender', width: "50", fixed: true},
                {label: '电话', name: 'phone', width: "120", fixed: true},
                {label: '年龄', name: 'stuAge', width: "60", fixed: true, index: "stu_age"},
                {label: '学历', name: 'stuEducation', width: "70", fixed: true},
                {label: '工态', name: 'workStatus', width: "70", fixed: true},
                {label: '地域', name: 'area', width: "150", fixed: true},
                {label: '咨询师', name: 'phoneConsult', width: "80", fixed: true},
                {label: '分量时间', name: 'assignTime', fixed: true, width: "120"},
                {label: '来源', name: 'infoSource', width: "80", fixed: true},
                {label: '关键字', name: 'keyInfo', width: "100", fixed: true}
            ],
            viewrecords: true, // show the current page, data rang and total records on the toolbar
            height: 400,
            rowNum: 10,
            autowidth: true,
            pager: "#jqGridPager",
            ondblClickRow: function (rowId, e) {
                var grid = $(this);
                var rowData = grid.jqGrid("getRowData", rowId);
                showStudentStudent(rowData.uuid);
            }
        });
        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });


    var openWindow;
    function addNewStudent() {
        openWindow = layer.open({
            title: "添加新学员",
            type: 2,
            content: 'crm/student_add.html',
            maxmin: true
        });
        layer.full(openWindow);
    }

    function showStudentStudent(studentId) {
        openWindow = layer.open({
            title: "学员详情",
            type: 2,
            content: 'student_info.html?studentId=' + studentId,
            maxmin: true
        });
        layer.full(openWindow);
    }

    function closeAdd() {
        layer.close(openWindow);
        $("#jqGrid").trigger("reloadGrid");
    }

    function distrbutStudent() {
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");


        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要分配的学员");
            return false;
        }

        var studentIds = "";
        for (var i = 0; i < selectedIds.length; i++) {
            var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
            studentIds += rowData.uuid + "!";
        }
        openWindow = layer.open({
            title: "分量",
            type: 2,
            content: '../boss/crm/nav2distibutePage?studentIds=' + studentIds,
            maxmin: true
        });
        layer.full(openWindow);
    }


</script>


</body>

</html>
