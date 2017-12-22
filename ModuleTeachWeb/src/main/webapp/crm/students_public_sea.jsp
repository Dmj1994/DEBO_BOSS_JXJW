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

        .pagination {
            display: inline-block;
            padding-left: 0px;
            margin: 10px 0px;
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
                        <button class="btn btn-info" type="button" data-toggle="modal" data-target="#myModal"
                                href="student_advance_search.html"><i
                                class="fa fa-search-plus"></i>&nbsp;<span class="bold">高级搜索</span></button>

                        <c:if test="${kf:hasRole('1012',sessionScope.userRoleCodes)}">
                            <button class="btn btn-success " type="button" onClick="pickFromPublicSea()"><i
                                    class="fa fa-plus"></i>&nbsp;<span class="bold">捞给我</span></button>
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

<!-- jqGrid -->
<script src="../res/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="../res/js/plugins/jqGrid2/js/jquery.jqGrid.min.js?0820"></script>
<script src="../res/js/jquery.serializejson.min.js" charset="utf-8"></script>
<!-- layer -->
<script src="../res/js/plugins/layer/layer.js?0820"></script>
<script src="../res/js/plugins/layui/layui.js" charset="utf-8"></script>

<!-- 自定义js -->
<script src="../res/js/content.js?v=1.0.2"></script>
<script src="../res/js/jquery.form.js" charset="utf-8"></script>
<script src="../res/js/common/area.js" charset="utf-8"></script>
<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '../boss/crm/publicSeaStudents',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {name: 'dataColor', hidden: true},
                {label: '姓名', name: 'stuName', width: "60", fixed: true, sortable: false},
                {label: '客户类型', name: 'clientType', fixed: true, width: "80"},
                {label: '咨询日期', name: 'consultDate', width: "85", fixed: true},
                {label: '咨询师', name: 'phoneConsult', width: "80", fixed: true, index: "phone_consult"},
                {label: '来源', name: 'infoSource', width: "80", fixed: true, sortable: false},
                {label: '关键字', name: 'keyInfo', width: "100", fixed: true, sortable: false},
                {label: '性别', name: 'gender', width: "50", fixed: true, sortable: false},
                {label: '电话', name: 'phone', width: "120", fixed: true, sortable: false},
                {label: '年龄', name: 'stuAge', width: "60", fixed: true, index: "stu_age"},
                {label: '学历', name: 'stuEducation', width: "70", fixed: true, sortable: false},
                {label: '工态', name: 'workStatus', width: "70", fixed: true, sortable: false},
                {label: '地域', name: 'area', width: "150", fixed: true, sortable: false},
                {label: '在线师', name: 'onlineConsult', width: "80", fixed: true, sortable: false},
                {label: '入公海时间', name: 'inTime', width: "125", fixed: true, sortable: false},
                {label: '入公海原因', name: 'inReason', width: "125", fixed: true, sortable: false},
                {label: '被踢次数', name: 'pickCnt', width: "80", fixed: true},
                {label: '沟通情况', name: 'isPhoneConnected', sortable: false}
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
                    url: "../boss/crm/publicSeaStudents",
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
            content: 'student_info_static.html?studentId=' + studentId,
            maxmin: true
        });
        layer.full(addWindow);
    }

    function closeAdd() {
        layer.close(addWindow);
        $("#jqGrid").trigger("reloadGrid");
    }

    function pickFromPublicSea() {
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");
        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要捞的学员，可以多选");
            return false;
        }

        var studentIds = "";
        for (var i = 0; i < selectedIds.length; i++) {
            var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
            studentIds += rowData.uuid + "!";
        }
        $.ajax({
            url: "../boss/crm/pickup2Pool",
            data: {"studentIds": studentIds},
            success: function (da) {
                var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
                postData = $.extend(postData, {"pageSingle": ""});
                $("#jqGrid").jqGrid('setGridParam', {
                    postData: postData, //发送数据
                }).trigger("reloadGrid"); //重新载入
            }
        });
        layer.closeAll();
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
