<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form class="layui-form" id="communication_feed_form" action="../boss/crm/updateFeedBack" method="post">
    <div style="padding:20px">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">量有效性</label>
                <div class="layui-input-inline" style="width:300px">
                    <input type="radio" name="isValidate" title="有效"
                           value="1" ${student.isValidate == 1 ?"checked":""} disabled>
                    <input type="radio" name="isValidate" title="无效" value="2" ${student.isValidate == 2 ?"checked":""}
                           disabled>
                    <input type="radio" name="isValidate" title="待定" value="3" ${student.isValidate == 3 ?"checked":""}
                           disabled>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">分量时间</label>
                <div class="layui-input-inline">
                    <p class="form-control-static" style="padding-top:11px"><fmt:formatDate
                            value="${student.assignTime}" pattern="yyyy-MM-dd HH:mm"/></p>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">预上门时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="preVisitTime" class="layui-input"
                           value="<fmt:formatDate value="${student.preVisitTime}"  pattern="yyyy-MM-dd HH:mm"/>"
                           readonly placeholder="系统自动获取，不需填" disabled>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">预回访时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="callTime" class="layui-input"
                           value="<fmt:formatDate value="${student.callTime}"  pattern="yyyy-MM-dd HH:mm"/>" readonly
                           placeholder="系统自动获取，不需填" disabled>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">定机时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="orderTime" class="layui-input" id="input_order_time"
                           value="<fmt:formatDate value="${student.orderTime}"  pattern="yyyy-MM-dd HH:mm"/>" disabled>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">定机金额</label>
                <div class="layui-input-inline">
                    <input type="text" name="orderMoney" class="layui-input" lay-verify="money"
                           value="${student.orderMoney}" disabled>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">报名时间</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="signupTime" id="input_registe_time"
                           value="<fmt:formatDate value="${student.signupTime}"  pattern="yyyy-MM-dd HH:mm"/>" disabled>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">报名金额</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" name="signupMoney" lay-verify="money"
                           value="${student.signupMoney}" disabled>
                </div>
            </div>
        </div>


        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <textarea placeholder="请输入内容" name="remark" class="layui-textarea" disabled>${student.remark}</textarea>
            </div>
        </div>

    </div>
</form>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        //监听提交
        form.on('submit(btn_feed_back)', function (data) {
            var studentId = getQueryString("studentId");
            $("#communication_feed_form").ajaxSubmit({
                data: {"uuid": studentId},
                beforeSend: function () {
                    $("button[lay-filter='btn_feed_back']").addClass("layui-btn-disabled");
                    $("button[lay-filter='btn_feed_back']").text("保存中...");

                }, success: function () {
                    $("button[lay-filter='btn_feed_back']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='btn_feed_back']").text("立即提交");
                    layer.open({
                        title: "提示",
                        type: 0,
                        content: '数据更新成功'
                    });

                }, error: function () {
                    $("button[lay-filter='btn_feed_back']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='btn_feed_back']").text("立即提交");
                }
            });
            return false;
        });

        form.render("radio");

        document.getElementById('input_order_time').onclick = function () {
            longDateSeting.elem = this;
            laydate(longDateSeting);
        };

        document.getElementById('input_registe_time').onclick = function () {
            longDateSeting.elem = this;
            laydate(longDateSeting);
        };


        //layer 自定义验证

        form.verify({
            money: function (value, item) { //value：表单的值、item：表单的DOM对象
                if (value == "")
                    return;
                if (!/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/.test(value)) {
                    return '请输入正确的金额格式';
                }
            }
        });
        disableAll();
    });


</script>