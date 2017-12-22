<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

    .layui-form-label {
        width: 120px
    }

    .layui-input-block {
        margin-left: 120px
    }

    .layui-form-item .layui-input-inline {
        width: 165px
    }
</style>
<div class="panel-group" id="accordion">
    <div class="panel panel-primary ">
        <div class="panel-heading">
            <h5 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="tabs_panels.html#collapseOne">新增回访记录</a>
            </h5>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body">
                <div id="wizard">
                    <h1>流程一：预案</h1>
                    <div class="step-content">
                        <form class="layui-form" id="consult_form" action="../boss/crm/saveConsultPlan" method="post">
                            <div class="layui-form-item" style="margin-bottom: 5px">
                                <div class="layui-inline">
                                    <label class="layui-form-label">回访方式</label>
                                    <div class="layui-input-inline">
                                        <select name="contactBackWay" lay-filter="contactBackWay">
                                            <option value="1">电话首次回访</option>
                                            <option value="2">电话再次回访</option>
                                            <option value="3">当面首次上门</option>
                                            <option value="4">当面再次上门</option>
                                            <option value="5">学员直接上门</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="layui-inline">
                                    <label class="layui-form-label">预回访时间</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="preCallTime" class="layui-input" id="preCallTime"
                                               lay-verify="required">
                                    </div>
                                </div>
                            </div>
                            <div id="dynamicArea">

                            </div>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit="" lay-filter="stu_consult_btn">立即提交</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <h1>流程二：回访</h1>
                    <div class="step-content">
                        <div class="text-center m-t-md">

                            <div class="row">
                                <div class="col-sm-3" style="padding-right:0;">
                                    <div class="ibox float-e-margins">
                                        <div class="ibox-content"
                                             style="border-top:none;background-color:#e4eaec;padding: 10px;text-align: left">


                                            <form class="layui-form" id="preForm" action="../boss/crm/saveStudent"
                                                  method="post">


                                            </form>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-sm-9" style="padding-left:0;">
                                    <div class="ibox float-e-margins">

                                    </div>
                                </div>

                            </div>


                        </div>
                    </div>

                    <h1>流程三：总结</h1>
                    <div class="step-content">
                        <div class="text-center m-t-md">
                            <h2>第三步</h2>
                            <p>
                                这是第三步的内容
                            </p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="panel panel-info">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="tabs_panels.html#collapseTwo">沟通记录历史</a>
            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-body">
                Bootstrap相关优质项目推荐 这些项目或者是对Bootstrap进行了有益的补充，或者是基于Bootstrap开发的
            </div>
        </div>
    </div>

</div>


<script>

    $("#wizard").steps({
        transitionEffect: "slideLeft",
        startIndex: 0,
        enableCancelButton: false,
        enableFinishButton: false,

    });
    layui.use(['form', 'layedit'], function () {
        var form = layui.form();
        form.on('submit(stu_consult_btn)', function (data) {


        });
        form.on('select(contactBackWay)', function (data) {
            if (data.value == 5) {
                $("#wizard").steps("next");
            } else {
                loadPreArranged(data.value);
            }
        });

        document.getElementById('preCallTime').onclick = function () {
            longDateSeting.elem = this;
            laydate(longDateSeting);
        };
        loadPreArranged(1);
        form.render("select");

    });

    var lastSelected = 1;
    function loadPreArranged(type) {
        var urlSrt = "";
        if (type == 1 || type == 2) {
            urlSrt = "jspFrags/callPlan.frag";
        } else if (type == 3 || type == 4) {
            urlSrt = "jspFrags/scenePlan.frag";
        }

        lastSelected = type;
        $.ajax({
            url: urlSrt,
            cache: false,
            success: function (da) {
                $("#dynamicArea").html(da);
            }
        });
    }


</script>