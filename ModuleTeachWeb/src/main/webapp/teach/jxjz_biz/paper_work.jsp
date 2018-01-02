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

    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>班级作业完成率：课前-68%，课中-89%，课后-75%</h5>
                    <div class="ibox-tools">
                        <button type="button" class="btn btn-primary btn-xs">上一周</button>
                        <button type="button" class="btn btn-primary btn-xs">下一周</button>
                    </div>
                </div>
                <div class="ibox-content">
                    <table id="jqGrid"></table>
                    <div id="#jqGridPager"></div>
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

<style>
    .mygray-bg{color:darkgrey;font-weight: lighter}
</style>
<!-- Page-Level Scripts -->
<script>
    $(document).ready(function () {
        $.jgrid.defaults.styleUI = 'Bootstrap';
        $("#jqGrid").jqGrid({
            url: '/teach/json/paperwork.json',
            datatype: "json",
            jsonReader: {
                root: "data.rows",
                total: "data.total",
                records: "data.records"
            },
            colNames:['头像','姓名','课前','课中','课后','课前','课中','课后','课前','课中','课后'],
            colModel: [
                {name: 'avatar',width:"80",fixed:true,frozen:true},
                {name: 'stuName',width:"80",fixed:true,frozen:true},
                {name: 'beforeClass1'},
                { name: 'inClass1'},
                { name: 'afterClass1'},
                {name: 'beforeClass2',cellattr:getBgColor},
                { name: 'inClass2'},
                { name: 'afterClass2'},
                {name: 'beforeClass3'},
                { name: 'inClass3',cellattr:getBgColor},
                { name: 'afterClass3'}

            ],
            autowidth:true,
            height:600,
            pager: "#jqGridPager",
            ajaxGridOptions: ajaxGridOptionsGlobal
        });

        $("#jqGrid").jqGrid('setGroupHeaders', {
            useColSpanStyle: true,
            groupHeaders:[
                {startColumnName:'beforeClass1', numberOfColumns:3, titleText: 'Y2-《使用MyBatis改造租房系统》-CH05<br/><span class="mygray-bg">2018年02月01日【周一】</span>'},
                {startColumnName:'beforeClass2', numberOfColumns: 3, titleText: 'Y2-《使用MyBatis改造租房系统》-CH06<br/><span class="mygray-bg">2018年02月03日【周三】</span>'},
                {startColumnName:'beforeClass3', numberOfColumns:3, titleText: 'Y2-《使用MyBatis改造租房系统》-CH07<br/><span class="mygray-bg">2018年02月05日【周五】</span>'}
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
    function getBgColor(rowId, val, rawObject, cm, rdata){
        if(val){
            if(parseInt(val)>60)
                  return "style='background-color:#7CCD7C'";
            else
                return "style='background-color:#F00'";
        }
    }
</script>
</body>

</html>
