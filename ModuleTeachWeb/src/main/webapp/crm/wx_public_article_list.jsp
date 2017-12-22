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

                        <button class="btn btn-success " type="button" onClick="addNewWCArticle()"><i
                                class="fa fa-plus"></i>&nbsp;<span class="bold">添加新公众号文章</span></button>
                        <button class="btn btn-success " type="button" onClick="audting(1)"><i
                                class="fa fa-plus"></i>&nbsp;<span class="bold">审核通过</span></button>
                        <button class="btn btn-success " type="button" onClick="audting(2)"><i
                                class="fa fa-plus"></i>&nbsp;<span class="bold">审核打回</span></button>

                        <button class="btn btn-success " type="button" onClick="pub2wc()"><i
                                class="fa fa-plus"></i>&nbsp;<span class="bold">发布到公众号</span></button>
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
    <input type="hidden" id="wc_public_ids"/>
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
            url: '../wx/allWCArticles',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colModel: [
                {name: 'uuid', hidden: true},
                {name: 'auditingStatus', hidden: true},
                {label: '文章标题', name: 'articleTitle', sortable: false},
                {label: '发布人', name: 'author'},
                {label: '发布到公众号名称', name: 'toWcPublicNames'},
                {label: '发布时间', name: 'publishTime'},
                {label: '浏览次数', name: 'viewNums'},
                {label: '最后审核人', name: 'auditingUser'},
                {label: '最后审核结果', name: 'auditingResult'},
                {label: '最后审核时间', name: 'auditingTime'}
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
            }, loadComplete: function (xrq) {
                var da = eval(xrq);
                getPagingation(da.data, "jqGridPager");
            }
        });
        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });


    var addWindow;
    function addNewWCArticle() {
        addWindow = layer.open({
            title: "添加新文章",
            type: 2,
            content: 'wx_public_article_add.jsp',
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


    function goPage(pageNo) {
        var postData = $("#jqGrid").jqGrid('getGridParam', 'postData');
        var params = {"pageSingle": ""};
        var _postData = $.extend(postData, params);
        $("#jqGrid").jqGrid('setGridParam', {
            postData: _postData, //发送数据,
            page: pageNo
        }).trigger("reloadGrid"); //重新载入
    }

    function audting(status) {
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");
        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要审核的文章");
            return false;
        }
        var articleIds = "";
        for (var i = 0; i < selectedIds.length; i++) {
            var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
            articleIds += rowData.uuid + "!";
        }
        $.ajax({
            url: "../wx/auditing",
            data: {"articleIds": articleIds, "status": status},
            success: function (da) {
                $("#jqGrid").trigger("reloadGrid");
            }
        });
    }


    function pub2wc() {
        var selectedIds = $("#jqGrid").jqGrid("getGridParam", "selarrrow");
        if (isEmpty(selectedIds)) {
            layer.alert("请选择需要发布的文章");
            return false;
        }
        var articleIds = "";
        for (var i = 0; i < selectedIds.length; i++) {
            var rowData = $('#jqGrid').jqGrid('getRowData', selectedIds[i]);
            if (rowData.auditingStatus != 1) {
                layer.alert("您选择的文章中有未审或者审核未通过的");
                return false;
            }
        }

        $.ajax({
            url: "../wx/nav2choseWC",
            success: function (da) {
                var dialog = layer.open({
                    title: "请选择要发布的公众号",
                    type: 0,
                    area: ['300px', '500px'],
                    content: da,
                    btn: ["确定"],
                    yes: function () {
                        var wc_public_ids = $("#wc_public_ids").val();
                        $.ajax({
                            url: "../wx/publicArticle",
                            data: {"articleIds": selectedIds, "wcIds": wc_public_ids},
                        });
                        layer.close(dialog);
                    }
                });
            }
        });
    }



</script>


</body>

</html>
