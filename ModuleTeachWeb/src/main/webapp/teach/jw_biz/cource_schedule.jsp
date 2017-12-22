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
        
        .ui-jqgrid tr.jqgrow td {
            white-space: normal !important;
            height:auto;
            vertical-align:text-top;
            padding-top:2px;
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
                            <label class="sr-only">教室名称</label>
                            <input type="text" name="stuName" placeholder="请输入班级名称" class="form-control">
                        </div>
                        <button class="btn btn-primary " type="button" onclick="smallSearch()">&nbsp;搜 索</button>
                        <button class="btn btn-success " type="button" onclick="editorSchedule()"><i
                                class="fa fa-search-plus"></i>&nbsp;&nbsp;编辑</button>
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
            url: '/teach/json/courseschedule.json',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colNames:['机房/使用率','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程','班级','班主任/教员','课程'],
            colModel: [
                {name: 'classRoomName',width:"80",fixed:true},
                {name: 'class1',width:"80",fixed:true},
                {name: 'assistTeacher1',width:"100",fixed:true},
                { name: 'cource1',width:"80",fixed:true},
                { name: 'class2',width:"80",fixed:true},
                { name: 'assistTeacher2',width:"100",fixed:true},
                {name: 'cource2',width:"80",fixed:true},
                {name: 'class3',width:"80",fixed:true},
                { name: 'assistTeacher3',width:"100",fixed:true},
                { name: 'cource3',width:"80",fixed:true},
                { name: 'class4',width:"80",fixed:true},
                {name: 'assistTeacher4',width:"100",fixed:true},
                { name: 'cource4',width:"80",fixed:true},
                { name: 'class5',width:"80",fixed:true},
                { name: 'assistTeacher5',width:"100",fixed:true},
                { name: 'cource5',width:"80",fixed:true},
                {name: 'class6',width:"80",fixed:true},
                {name: 'assistTeacher6',width:"100",fixed:true},
                { name: 'cource6',width:"80",fixed:true},
                { name: 'class7',width:"80",fixed:true},
                { name: 'assistTeacher7',width:"100",fixed:true},
                {name: 'cource7',width:"80",fixed:true},
                { name: 'class8',width:"80",fixed:true},
                { name: 'assistTeacher8',width:"100",fixed:true},
                { name: 'cource8',width:"80",fixed:true},
                { name: 'class9',width:"80",fixed:true},
                {name: 'assistTeacher9',width:"100",fixed:true},
                {name: 'cource9',width:"80",fixed:true},
                { name: 'class10',width:"80",fixed:true},
                { name: 'assistTeacher10',width:"100",fixed:true},
                { name: 'cource10',width:"80",fixed:true},
                {name: 'class11',width:"80",fixed:true},
                { name: 'assistTeacher11',width:"100",fixed:true},
                { name: 'cource11',width:"80",fixed:true},
                { name: 'class12',width:"80",fixed:true},
                { name: 'assistTeacher12',width:"100",fixed:true},
                {name: 'cource12',width:"80",fixed:true},
                {name: 'class13',width:"80",fixed:true},
                { name: 'assistTeacher13',width:"100",fixed:true},
                { name: 'cource13',width:"80",fixed:true},
                { name: 'class14',width:"80",fixed:true},
                {name: 'assistTeacher14',width:"100",fixed:true},
                { name: 'cource14',width:"80",fixed:true}

            ],
            autowidth:true,
            height:600,
            ajaxGridOptions: ajaxGridOptionsGlobal
        });

        $("#jqGrid").jqGrid('setGroupHeaders', {
            useColSpanStyle: true,
            groupHeaders:[
                {startColumnName:'class1', numberOfColumns:6, titleText: '星期一'},
                {startColumnName:'class3', numberOfColumns:6, titleText: '星期二'},
                {startColumnName:'class5', numberOfColumns:6, titleText: '星期三'},
                {startColumnName:'class7', numberOfColumns:6, titleText: '星期四'},
                {startColumnName:'class9', numberOfColumns:6, titleText: '星期五'},
                {startColumnName:'class11', numberOfColumns:6, titleText: '星期六'},
                {startColumnName:'class13', numberOfColumns:6, titleText: '星期日'},
            ]
        });

        $("#jqGrid").jqGrid('setGroupHeaders', {
            useColSpanStyle: true,
            groupHeaders:[
                {startColumnName:'class1', numberOfColumns:3, titleText: '上午'},
                {startColumnName:'class2', numberOfColumns: 3, titleText: '下午'},
                {startColumnName:'class3', numberOfColumns:3, titleText: '上午'},
                {startColumnName:'class4', numberOfColumns: 3, titleText: '下午'},
                {startColumnName:'class5', numberOfColumns:3, titleText: '上午'},
                {startColumnName:'class6', numberOfColumns: 3, titleText: '下午'},
                {startColumnName:'class7', numberOfColumns:3, titleText: '上午'},
                {startColumnName:'class8', numberOfColumns: 3, titleText: '下午'},
                {startColumnName:'class9', numberOfColumns:3, titleText: '上午'},
                {startColumnName:'class10', numberOfColumns: 3, titleText: '下午'},
                {startColumnName:'class11', numberOfColumns:3, titleText: '上午'},
                {startColumnName:'class12', numberOfColumns: 3, titleText: '下午'},
                {startColumnName:'class13', numberOfColumns:3, titleText: '上午'},
                {startColumnName:'class14', numberOfColumns: 3, titleText: '下午'}
            ]
        });

        $(window).resize(function () {
            $("#jqGrid").setGridWidth($(".ibox-content").width());
        });
    });

    var windowObj;


    function editorSchedule(){
        location.href="cource_schedule_edit.jsp";
    }
</script>
</body>

</html>
