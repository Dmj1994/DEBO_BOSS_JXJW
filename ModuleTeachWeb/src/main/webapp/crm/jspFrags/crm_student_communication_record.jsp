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

    .layui-form-item {
        margin-bottom: 2px
    }

    .table {
        margin-bottom: 0px
    }

    .tdSelected {
        background-color: yellowgreen;
        color: white;
        font-weight: bold;
    }

    .fix_adContent {
        position: fixed;
        background-color: #2A2E36;
    }
</style>
<div class="panel-group" id="accordion">


    <div class="panel panel-primary">
        <div class="panel-heading " id="div_head1"
             onclick="$('#collapseOne').collapse('toggle');$('#collapseTwo').collapse('toggle');"
             data-intro='点击蓝色区域可以添加回访记录' tooltipPosition="bottom-middle-aligned">
            <h5 class="panel-title" href="tabs_panels.html#collapseOne">
                <a data-toggle="collapse" data-parent="#accordion"
                   href="tabs_panels.html#collapseOne">新增【${studentVO.stuName}】回访记录,分量时间：<fmt:formatDate
                        value="${studentVO.assignTime}" pattern="yyyy-MM-dd HH:mm"/></a>
            </h5>
        </div>
        <div id="collapseOne" class="panel-collapse collapse ">
            <div class="panel-body">
                <div class="row show-grid">
                    <div class="col-md-6">
                        <form class="layui-form" id="communication_form" action="../boss/crm/saveCommunication"
                              method="post">
                            <div style="padding:20px 0px">
                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">沟通时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="communicationTime" class="layui-input"
                                                   readonly>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">沟通方式</label>
                                        <div class="layui-input-inline">
                                            <select name="communicationWay" id="communicationWay"
                                                    lay-filter="communicationWay"
                                                    lay-verify="required">
                                                <option value="">未知</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">关注点</label>
                                    <div class="layui-input-block" style="max-width:380px">
                                        <input type="text" name="studentFocus" class="layui-input"
                                               placeholder="多个关注点请以逗号隔开" >
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">背景补充</label>
                                    <div class="layui-input-block" style="max-width:380px">
                                <textarea class="layui-textarea " name="backgroundAttach" id="ss"
                                          placeholder="工作、家庭情况、学习动机..." ></textarea>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">沟通内容</label>
                                    <div class="layui-input-block" style="max-width:380px">
                                        <textarea class="layui-textarea" name="communicationContent"
                                                  id="otor" lay-verify="required"></textarea>
                                    </div>
                                </div>

                                <div class="layui-form-item layui-form-text">
                                    <label class="layui-form-label">邀约理由</label>
                                    <div class="layui-input-block" style="max-width:380px">
                                        <input type="text" name="inviteReason" class="layui-input">
                                    </div>
                                </div>


                                <div class="layui-form-item layui-form-text" id="sceneConsultDiv" style="display:none">
                                    <label class="layui-form-label">当面咨询师</label>
                                    <div class="layui-input-block" style="max-width:380px">
                                        <input type="text" name="sceneConsult" class="layui-input">
                                    </div>
                                </div>


                                <div class="layui-form-item">
                                    <label class="layui-form-label">本次有定机</label>
                                    <div class="layui-input-block" style="max-width:380px">
                                        <input type="radio"
                                               title="有" name="hasOrder" lay-filter="hasOrder" value="1">
                                        <input type="radio"
                                               title="无" name="hasOrder" checked lay-filter="hasOrder" value="0">
                                    </div>
                                </div>

                                <div class="layui-form-item" id="div_order" style="display: none">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">定机日期</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="orderTime" class="layui-input" id="orderDate"
                                                   value="<fmt:formatDate value="${studentVO.orderTime}"  pattern="yyyy-MM-dd"/>"
                                                   style="color: #2A2E36">
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">定机金额</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="orderMoney" class="layui-input"
                                                   value="${studentVO.orderMoney}" style="color: #2A2E36">
                                        </div>
                                    </div>
                                </div>

                                <div class="hr-line-dashed"
                                     style="border-bottom:dashed 1px #00b7ee;margin:10px 0"></div>

                                <div class="layui-form-item">
                                    <div class="layui-inline">
                                        <label class="layui-form-label">下次沟通</label>
                                        <div class="layui-input-inline">
                                            <select name="nextCommunication" lay-verify="nextVerify">
                                                <option value="">无</option>
                                                <option value="电话">电话</option>
                                                <option value="上门">上门</option>
                                                <option value="到公海">到公海</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="layui-inline">
                                        <label class="layui-form-label">下次时间</label>
                                        <div class="layui-input-inline">
                                            <input type="text" name="nextTime" class="layui-input"
                                                   id="nextCommunicationTime" lay-verify="nextTimeVerify">
                                        </div>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <label class="layui-form-label">下次计划</label>
                                    <div class="layui-input-block" style="max-width:380px">
                                        <textarea class="layui-textarea" name="nextPlan" id="nextPlan"></textarea>
                                    </div>
                                </div>

                                <div class="layui-form-item">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" lay-submit="" lay-filter="communication_save_btn">立即提交
                                        </button>
                                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="col-md-6">
                        <div class="input-group">
                            <input type="text" class="form-control" id="search_keys"><span class="input-group-btn">
                            <button type="button" class="btn " onclick="loadAdivces()">搜索咨询建议</button></span>
                            <input type="hidden" id="page">
                        </div>
                        <div id="advices_slide_panel" class="fix_adContent">

                        </div>

                        <div id="advices_body">

                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>


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
                    <div class="col-sm-6" style="padding-right: 5px">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content">
                                <div class="table-responsive">
                                    <table class="table table-striped" id="commList">
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
                    <div class="col-sm-6" style="padding-left: 5px">
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

        loadSelect("comunicationway", "communicationWay");
        form.render("select");
        form.render("radio");

        form.on('radio(hasOrder)', function (data) {

            if (data.value == "1") {
                $("#div_order").slideDown();
            } else {
                $("#div_order").slideUp();
            }
        });

        document.getElementById('nextCommunicationTime').onclick = function () {
            longDateSeting.elem = this;
            laydate(longDateSeting);
        };

        var consultDateSeting = {
            min: '2013-06-16 23:59:59'
            , max: '2050-06-16 23:59:59'
            , istoday: false
        };
        document.getElementById('orderDate').onclick = function () {
            consultDateSeting.elem = this;
            laydate(consultDateSeting);
        };

        form.on('select(communicationWay)', function (data) {
            if (data.value != '电话') {
                $("#sceneConsultDiv").slideDown();
            } else {
                $("#sceneConsultDiv").slideUp();
            }
        });


        form.verify({
            nextTimeVerify: function (value, item) { //value：表单的值、item：表单的DOM对象
                var nextCommunication = $("select[name='nextCommunication']").val();
                var nextTime = $("input[name='nextTime']").val();
                if (nextCommunication == "电话" || nextCommunication == "上门") {
                    if (nextTime == '') {
                        return "请选择下次时间";
                    }
                }
            },
            nextVerify: function (value, item) { //value：表单的值、item：表单的DOM对象
                var nextCommunication = $("select[name='nextCommunication']").val();
                var nextTime = $("input[name='nextTime']").val();
                if (nextTime != "" && value == '') {
                    return "请选择下次方式";
                }
            }
        });


        //监听提交
        form.on('submit(communication_save_btn)', function (data) {
            var studentId = getQueryString("studentId");


            $("#communication_form").ajaxSubmit({
                data: {"studentId": studentId},
                beforeSend: function () {
                    $("button[lay-filter='communication_save_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='communication_save_btn']").text("保存中...");
                }, success: function () {
                    //更改学员基本信息中的回访时间，否则修改基本信息时会被旧数据覆盖
                    var nextTime = $("input[name='nextTime']").val();
                    if (nextTime != '') {
                        $("#callDate").val(nextTime);
                    }
                    $("button[lay-filter='communication_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='communication_save_btn']").text("立即提交");
                    loadCommunicationList();
                    $("#communication_form").trigger("reset");
                    loadServerTime();
                    parent.reloadTable();
                    layer.open({
                        title: "提示",
                        type: 0,
                        content: '数据添加成功'
                    });

                    $('#collapseOne').collapse('toggle');
                    $('#collapseTwo').collapse('show');
                }, error: function () {
                    $("button[lay-filter='communication_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='communication_save_btn']").text("立即提交");
                }
            });
            return false;
        });

        loadCommunicationList();
        loadServerTime();
        loadAdivces();


    });

    function loadServerTime() {
        $.ajax({
            url: "../boss/basic/loadServerTime",
            data: {"pattern": "yyyy-MM-dd HH:mm"},
            success: function (da) {
                $("input[name='communicationTime']").val(da);
            }
        });
    }
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

                $("#commList td").click(function () {
                    $("#commList td").removeClass("blueBG");
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


    function loadAdivces() {
        var keys = $("#search_keys").val();
        var page = $("#page").val();
        $.ajax({
            url: "../boss/advice/searchAdvice",
            data: {"keyWords": keys, "page": page},
            type: "post",
            success: function (da) {
                $("#advices_body").html(da);
                bindEffect();
            }
        });
    }

    function bindEffect() {
        $(".dataRow").mouseover(function () {
            $(this).css("cursor", "pointer")
        });
        $(".dataRow").click(function () {
            $(".dataRow td").removeClass("tdSelected");
            $(this).find("td").addClass("tdSelected");
            $("#div_ad_content").html($(this).attr("adContent"));
        });

        $("#adviceList td").click(function () {
            $(".tr_adContent").remove();
            var adContent = $(this).parent().attr("adContent");
            var newRow = "<tr class='tr_adContent'><td colspan='2'>" + adContent + "</td></tr>";
            $(this).parent().after(newRow);
        });
    }


    var guiderCnt = localStorage.getItem('guiderCnt');
    if (guiderCnt) {
        if (guiderCnt < 3) {
            setTimeout(function () {
                introJs().goToStepNumber(1).start();
            }, 1000);
            guiderCnt = parseInt(guiderCnt) + 1;
            localStorage.setItem('guiderCnt', guiderCnt);
            console.log(guiderCnt);
        }

    } else {
        localStorage.setItem('guiderCnt', 1);
        setTimeout(function () {
            introJs().goToStepNumber(1).start();
        }, 1000);
    }
</script>




