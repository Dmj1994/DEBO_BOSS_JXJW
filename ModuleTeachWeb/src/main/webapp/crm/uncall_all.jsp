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
                            <label class="sr-only">咨询师</label>
                            <select class="form-control" style="width: 120px" id="sel_consult" name="consultName">

                            </select>
                        </div>
                        <div class="form-group">
                            <label class="sr-only">日期</label>
                            <input type="text" placeholder="日期" class="form-control" id="unCallDate"
                                   style="width: 100px" name="shouldDate">

                        </div>
                        <div class="form-group">
                            <label class="sr-only">校区</label>
                            <select class="form-control" style="width: 120px" id="sel_school" name="consultSchool">

                            </select>
                        </div>
                        <div class="form-group">
                            <label class="sr-only">咨询组</label>
                            <select class="form-control" style="width: 120px" id="sel_team" name="consultTeam">

                            </select>
                        </div>
                        <button class="btn btn-primary " type="button" onclick="smallSearch()">&nbsp;搜 索</button>
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

<div class="modal inmodal" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="width:90%;">
        <div class="modal-content animated bounceInRight" style="padding-top:20px;padding-bottom:10px">

        </div>
    </div>
</div>


<!-- 全局js -->
<script src="../res/js/jquery.min.js?v=2.1.4"></script>
<script src="../res/js/jquery.serializejson.min.js" charset="utf-8"></script>
<script src="../res/js/bootstrap.min.js?v=3.3.6"></script>

<!-- jqGrid -->
<script src="../res/js/plugins/jqgrid/i18n/grid.locale-cn.js?0820"></script>
<script src="../res/js/plugins/jqGrid2/js/jquery.jqGrid.min.js?0820"></script>

<!-- layer -->
<script src="../res/js/plugins/layer/layer.js?0820"></script>
<script src="../res/js/plugins/layui/layui.js" charset="utf-8"></script>

<!-- 自定义js -->

<script src="../res/js/content.js?v=1.0.0"></script>
<script src="../res/js/common/area.js" charset="utf-8"></script>
<!-- Page-Level Scripts -->
<script>


    $(document).ready(function () {

        layui.use(['laydate'], function () {
            document.getElementById('unCallDate').onclick = function () {
                longDateSeting.elem = this;
                laydate(longDateSeting);
            }
        });


        loadConsults();
        loadConsultTeam();
        loadSchool();

        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '../boss/crm/unCallHistory',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {label: '咨询师', name: 'consultName', sortable: false},
                {label: '未及时回访日期', name: 'shouldDate', sortable: false},
                {label: '学员姓名', name: 'studentName', sortable: false},
                {label: '学员电话', name: 'studentPhones', sortable: false}
            ],
            viewrecords: true, // show the current page, data rang and total records on the toolbar
            height: 400,
            rowNum: 10,
            autowidth: true,
            pager: "#jqGridPager",
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
                console.log(JSON.stringify(postData));
                var params = {"pageSingle": "true"};
                $.extend(postData, params);
                $.ajax({
                    url: "../boss/crm/unCallHistory",
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

    function loadConsults() {
        $.ajax({
            url: "/boss/crm/loadPhoneConsultByRole",
            success: function (da) {
                var opts = "<option value=''>咨询师</option>";
                $(da.data).each(function () {
                    opts += "<option value='" + this.userName + "'>" + this.userName + "</option>";
                });
                $("#sel_consult").html(opts);
            }
        });
    }
    function loadConsultTeam() {
        $.ajax({
            url: "/boss/crm/loadConsultTeam",
            success: function (da) {
                var opts = "<option value=''>咨询组</option>";
                $(da.data).each(function () {
                    opts += "<option value='" + this.teamName + "'>" + this.teamName + "</option>";
                });
                $("#sel_team").html(opts);
            }
        });
    }
    function loadSchool() {
        $.ajax({
            url: "/boss/organization/loadSchools",
            success: function (da) {
                var opts = "<option value=''>选择校区</option>";
                $(da.data).each(function () {
                    opts += "<option value='" + this.organizationName + "'>" + this.organizationName + "</option>";
                });
                $("#sel_school").html(opts);
            }
        });
    }
</script>

</body>

</html>
