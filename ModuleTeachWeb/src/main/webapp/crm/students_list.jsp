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

    <link rel="stylesheet" href="../res/js/plugins/layui/css/layui.css" media="all">
    <link href="../res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
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
                        <div class="form-group">
                            <label class="sr-only">用户名</label>
                            <input type="text" name="stuName" placeholder="请输入学员姓名" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="sr-only">手机号码</label>
                            <input type="text" name="phone" placeholder="手机号码" class="form-control">
                        </div>

                        <button class="btn btn-primary " type="button" onclick="smallSearch()">&nbsp;搜 索</button>
                        <button class="btn btn-info" type="button" data-toggle="modal" data-target="#myModal"
                                href="student_advance_search.html"><i
                                class="fa fa-search-plus"></i>&nbsp;<span class="bold">高级搜索</span></button>

                        <c:if test="${kf:hasRole('1012',sessionScope.userRoleCodes)}">
                            <button class="btn btn-success " type="button" onClick="kickToPublicSea()"><i
                                    class="fa fa-plus"></i>&nbsp;<span class="bold">踢公海</span></button>
                        </c:if>

                        <c:if test="${kf:hasResource('10_10_11',sessionScope.userResourceCodes)}">
                        <button class="btn btn-success " type="button" onClick="tansStu()"><i
                                    class="fa fa-plus"></i>&nbsp;<span class="bold">转量</span></button>
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
<script src="../res/js/jquery.min.js?v=2.1.4"></script>
<script src="../res/js/bootstrap.min.js?v=3.3.6"></script>
<script src="../res/js/jquery.serializejson.min.js" charset="utf-8"></script>

<!-- jqGrid -->
<script src="../res/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="../res/js/plugins/jqGrid2/js/jquery.jqGrid.min.js?0820"></script>


<!-- layer -->
<script src="../res/js/plugins/layer/layer.js?0820"></script>

<!-- 自定义js -->
<script src="../res/js/content.js?v=1.0.0"></script>


<script src="../res/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="../res/js/jquery.form.js" charset="utf-8"></script>
<script src="../res/js/common/area.js" charset="utf-8"></script>


<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '../boss/crm/myAllStudents',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {name: 'dataColor', hidden: true},
                {label: '标签', width: "60", fixed: true, sortable: false, formatter: nameFormater},
                {label: '姓名', name: 'stuName', width: "60", fixed: true, sortable: false},
                {label: '类型', name: 'clientType', fixed: true, width: "45", index: "client_type"},
                {label: '咨询日期', name: 'consultDate', width: "85", fixed: true, index: "consult_date"},
                {label: '下次上门时间', name: 'preVisitTime', width: "125", fixed: true, index: "pre_visit_time"},
                {label: '下次回访时间', name: 'callTime', width: "125", fixed: true, index: "call_time"},
                {label: '性别', name: 'gender', width: "50", fixed: true, sortable: false},
                {label: '电话', name: 'phone', width: "100", fixed: true, sortable: false},
                {label: '年龄', name: 'stuAge', width: "50", fixed: true, sortable: false},
                {label: '学历', name: 'stuEducation', width: "50", fixed: true, sortable: false},
                {label: '工态', name: 'workStatus', width: "50", fixed: true, sortable: false},
                {label: '地域', name: 'area', width: "100", fixed: true, sortable: false},
                {label: '咨询师', name: 'phoneConsult', width: "60", fixed: true, sortable: false},
                {label: '在线师', name: 'onlineConsult', width: "80", fixed: true, sortable: false},
                {label: '来源', name: 'mediaName', sortable: false}
            ],
            viewrecords: true, // show the current page, data rang and total records on the toolbar
            height: 400,
            rowNum: 10,
            autowidth: true,
            multiselect: true,
            ajaxGridOptions: ajaxGridOptionsGlobal,
            ondblClickRow: function (rowId, e) {
                var grid = $(this);
                var rowData = grid.jqGrid("getRowData", rowId);
                showStudentStudent(rowData.uuid);
            },
            loadComplete: function (xrq) {
                changeColor("#jqGrid");
                var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
                var params = {"pageSingle": "true"};
                $.extend(postData, params);
                $.ajax({
                    url: "../boss/crm/myAllStudents",
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


    function nameFormater(cellvalue, options, rowObject) {
        if (rowObject.tags)
            return "<a href='javascript:;' onclick=showTransHistory('" + rowObject.uuid + "')><i class='fa fa-intersex' title='转入量，点击查看转量历史'></i></a>";
        else
            return '';
    }
    var addWindow;

    function showTransHistory(stuId) {
        addWindow = layer.open({
            title: "转量历史",
            type: 2,
            content: '../boss/crm/transHistory?studentId=' + stuId,
            maxmin: true
        });
    }


    function addNewStudent() {
        addWindow = layer.open({
            title: "添加新学员",
            type: 2,
            content: 'student_add.html',
            maxmin: true
        });
        layer.full(addWindow);
    }

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
        var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
        postData = $.extend(postData, {"pageSingle": ""});
        $("#jqGrid").jqGrid('setGridParam', {
            postData: postData, //发送数据
        }).trigger("reloadGrid"); //重新载入
    }


    function kickToPublicSea() {
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");
        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要提到公海的学员，可以多选");
            return false;
        }
        layer.prompt({"title": "请输入踢入公海的理由"}, function (reason) {
            var studentIds = "";
            for (var i = 0; i < selectedIds.length; i++) {
                var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
                studentIds += rowData.uuid + "!";
            }
            $.ajax({
                url: "../boss/crm/kick2PublicSea",
                data: {"studentIds": studentIds, "reason": reason},
                success: function (da) {
                    var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
                    postData = $.extend(postData, {"pageSingle": ""});
                    $("#jqGrid").jqGrid('setGridParam', {
                        postData: postData, //发送数据
                    }).trigger("reloadGrid"); //重新载入
                }
            });
            layer.closeAll();
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


    function tansStu(){
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");

        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要转的学员");
            return false;
        }

        var studentIds = "";
        for (var i = 0; i < selectedIds.length; i++) {
            var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
            studentIds += rowData.uuid + "!";
        }
        addWindow = layer.open({
            title: "转移量",
            type: 2,
            content: '../boss/crm/nav2transPage?studentIds=' + studentIds,
            maxmin: true
        });
        layer.full(addWindow);
    }
</script>


</body>

</html>
