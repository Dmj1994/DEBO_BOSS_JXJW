<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
    .ibox-content {
        padding: 5px
    }

    .table:hover {
        cursor: pointer
    }

    .table {
        margin-bottom: 0px
    }

    td {
        position: relative
    }

    .blueBG {
        background-color: #337ab7;
        color: white
    }

    .connerMins {
        position: absolute;
        top: 0px;
        right: 7px;
        font-size: 8px;
        transform: rotate(35deg);
        color: #770088;
        font-weight: bold
    }
</style>
<div class="panel-group" id="accordion">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="tabs_panels.html#collapseTwo">查看【${studentVO.stuName}】回访记录</a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse in">
            <div class="panel-body" style="padding:15px">
                <div class="row">
                    <div class="col-sm-5" style="padding-right: 5px">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>人员</th>
                                            <th>时间</th>
                                            <th>回访周期</th>
                                            <th>方式</th>
                                            <th>录音</th>
                                        </tr>
                                        </thead>
                                        <tbody id="table_visit_back">


                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-sm-7" style="padding-left: 5px">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">

                                <table class="table ">
                                    <thead>
                                    <tr>
                                        <th colspan="2">沟通详情</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table_communication_detail">


                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['form', 'layer'], function () {
        var form = layui.form(),
            layer = layui.layer;
        laydate = layui.laydate;

        loadCommunicationList();

    });

    function playRecord(commId) {
        layui.use(['layer'], function () {
            var layer = layui.layer;
            layer.open({
                title: "电话录音播放",
                type: 2,
                area: ['300px', '300px'],
                fixed: false,
                maxmin: false,
                content: '../boss/crm/showPlayPage?commId=' + commId
            });
        });
    }


    function loadCommunicationList() {
        var studentId = getQueryString("studentId");
        $.ajax({
            url: "../boss/crm/loadCommunicationList",
            data: {"studentId": studentId},
            success: function (da) {
                $("#table_visit_back").html(da);

                $(".table-striped td").click(function () {
                    $(".table-striped td").removeClass("blueBG");
                    $(this).parent().find("td").addClass("blueBG");
                    loadCommunicatioDetail($(this).parent().attr("commId"));
                });
            }, beforeSend: function () {
                showOrRemoveLoading("table_visit_back", "show");
            }
        });
    }

    function loadCommunicatioDetail(commId) {
        console.log(commId);
        $.ajax({
            url: "../boss/crm/loadCommunicatioDetail",
            data: {"communicationId": commId},
            success: function (da) {
                $("#table_communication_detail").html(da);
            }, beforeSend: function () {
                showOrRemoveLoading("table_communication_detail", "show");
            }
        });
    }

</script>




