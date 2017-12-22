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
                        <button class="btn btn-primary " type="button" onclick="smallSearch()">&nbsp;手动刷新</button>
                        本页面将自动10秒刷新一次数据
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

        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '../boss/crm/dailyShouldCallReports',
            datatype: "json",
            jsonReader: {
                root: "data"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {label: '咨询师', name: 'consultName', sortable: false},
                {label: '今日应回访【新量+当日回访】', name: 'shouldCnt', sortable: false},
                {label: '今日已回访', name: 'doneCnt', sortable: false}
            ],
            viewrecords: true, // show the current page, data rang and total records on the toolbar
            height: "100%",
            rowNum: 100,
            autowidth: true,
            multiselect: true,
            ajaxGridOptions: ajaxGridOptionsGlobal
        });
        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });

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

    setInterval(function () {
        $("#jqGrid").trigger("reloadGrid");
    }, 1000 * 10);
</script>

</body>

</html>
