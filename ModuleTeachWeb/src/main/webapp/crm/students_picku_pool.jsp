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

    <link href="../res/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <!-- jqgrid-->
    <link href="../res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap.css?0820" rel="stylesheet">
    <link href="../res/js/plugins/jqGrid2/css/ui.jqgrid-bootstrap-ui.css?0820" rel="stylesheet">
    <link href="../res/js/plugins/layer/skin/default/layer.css?0820" rel="stylesheet" media="all">
    <link href="../res/css/animate.css" rel="stylesheet">
    <link href="../res/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="../res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <style>
        .ibox-content {
            padding: 5px
        }

        .float-e-margins .btn {
            margin-bottom: 0px
        }

        .pagination {
            display: inline-block;
            padding-left: 0px;
            margin: 10px 5px;
            border-radius: 4px;
        }

        .jumpInput {
            background-color: #FFFFFF;
            border: 1px solid #DDDDDD;
            color: inherit;
            float: left;
            line-height: 1.42857;
            margin-left: -1px;
            padding: 4px 10px;
            position: relative;
            text-decoration: none;
            height: 34px;
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
                        <div class="form-group">
                            <label class="sr-only">学员姓名</label>
                            <input type="text" name="stuName" placeholder="请输入学员姓名" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="sr-only">手机号码</label>
                            <input type="text" name="phone" placeholder="手机号码" class="form-control">
                        </div>

                        <button class="btn btn-primary " type="button">&nbsp;搜 索</button>
                        <!--
                        <button class="btn btn-info" type="button" onClick="advanceSearch()" data-target="#myModal"
                                href="/crm/student_advance_search.html"><i
                                class="fa fa-search-plus"></i>&nbsp;<span class="bold">高级搜索</span></button>-->
                        <c:if test="${kf:hasRole('1012',sessionScope.userRoleCodes)}">
                            <button class="btn btn-success " type="button" onClick="kickToPublicSea()"><i
                                    class="fa fa-plus"></i>&nbsp;<span class="bold">再踢公海</span></button>
                            <button class="btn btn-success " type="button" onClick="pickToMyDB()"><i
                                    class="fa fa-plus"></i>&nbsp;<span class="bold">捡到我的库</span></button>
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
                    <div id="jqGridPager" style="text-align: right"></div>
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
<script src="../res/js/content.js?v=1.0.1"></script>
<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '../boss/crm/pickPoolStudents',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {name: 'dataColor', hidden: true},
                {label: '客户类型', name: 'clientType', fixed: true, width: "80"},
                {label: '咨询日期', name: 'consultDate', width: "85", fixed: true},
                {label: '捞量时间', name: 'pickTime', width: "125", fixed: true},
                {label: '姓名', name: 'stuName', width: "60", fixed: true},
                {label: '性别', name: 'gender', width: "50", fixed: true},
                {label: '电话', name: 'phone', width: "120", fixed: true},
                {label: '年龄', name: 'stuAge', width: "60", fixed: true, index: "stu_age"},
                {label: '学历', name: 'stuEducation', width: "70", fixed: true},
                {label: '工态', name: 'workStatus', width: "70", fixed: true},
                {label: '地域', name: 'area', width: "150", fixed: true},
                {label: '咨询师', name: 'phoneConsult', width: "80", fixed: true},
                {label: '在线师', name: 'onlineConsult', width: "80", fixed: true},
                {label: '来源', name: 'mediaName', width: "80", fixed: true},
                {label: '关键字', name: 'keyInfo', width: "100", fixed: true},
                {label: '沟通情况', name: 'isPhoneConnected'}
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
                showStudentStudent(rowData.uuid);
            }, loadComplete: function (xrq) {
                changeColor("#jqGrid");
                var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
                var params = {"pageSingle": "true"};
                postData = $.extend(postData, params);
                console.log(JSON.stringify(postData));
                $.ajax({
                    url: "../boss/crm/pickPoolStudents",
                    data: postData,
                    success: function (da) {
                        getPagingation(da.data, "jqGridPager");
                        postData.pageSingle = undefined;
                    }
                });
            }
        });
        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });


    var addWindow;
    function showStudentStudent(studentId) {
        addWindow = layer.open({
            title: "学员详情",
            type: 2,
            content: 'student_info.html?studentId=' + studentId,
            maxmin: true
        });
        layer.full(addWindow);
    }

    function closeAdd() {
        layer.close(addWindow);
        $("#jqGrid").trigger("reloadGrid");
    }


    function kickToPublicSea() {
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");
        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要踢到公海的学员，可以多选");
            return false;
        }

        layer.prompt({"title": "请输入踢入公海的理由"}, function (reason) {
            var studentIds = "";
            for (var i = 0; i < selectedIds.length; i++) {
                var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
                studentIds += rowData.uuid + "!";
            }
            console.log("reason:" + reason);
            $.ajax({
                url: "../boss/crm/kick2PublicSea",
                data: {"studentIds": studentIds, "reason": reason},
                success: function (da) {
                    var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
                    postData = $.extend(postData, {"pageSingle": ""});
                    $("#jqGrid").jqGrid('setGridParam', {
                        postData: postData //发送数据
                    }).trigger("reloadGrid"); //重新载入
                }
            });
            layer.closeAll();
        });

    }

    function pickToMyDB() {
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");
        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要捡的学员，可以多选");
            return false;
        }
        var studentIds = "";
        for (var i = 0; i < selectedIds.length; i++) {
            var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
            studentIds += rowData.uuid + "!";
        }

        $.ajax({
            url: "../boss/crm/pickToMyDB",
            data: {"studentIds": studentIds},
            success: function (da) {
                var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
                postData = $.extend(postData, {"pageSingle": ""});
                $("#jqGrid").jqGrid('setGridParam', {
                    postData: postData //发送数据
                }).trigger("reloadGrid"); //重新载入
            }
        });
    }

    function smallSearch() {
        var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
        var params = $("#search_form_small").serializeJSON();
        var _postData = $.extend(postData, params);
        _postData = $.extend(postData, {"pageSingle": ""});
        $("#jqGrid").jqGrid('setGridParam', {
            postData: _postData, //发送数据
            page: 1
        }).trigger("reloadGrid"); //重新载入
    }

    function goPage(pageNo) {
        var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
        var params = {"pageSingle": ""};
        var _postData = $.extend(postData, params);
        $("#jqGrid").jqGrid('setGridParam', {
            postData: _postData, //发送数据,
            page: pageNo
        }).trigger("reloadGrid"); //重新载入
    }


</script>


</body>

</html>
