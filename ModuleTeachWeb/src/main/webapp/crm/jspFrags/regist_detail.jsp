<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="registeDetail">
    <form class="layui-form" id="seatinfo_form" action="../boss/dean/updateRegistInfo" method="post">
        <input type="hidden" name="isCanceled" value="false"/>
        <input type="hidden" name="uuid" value="${student.uuid}"/>
        <div class="layui-form-item">
            <label class="layui-form-label">缴费方式</label>
            <div class="layui-input-block">
                <input type="radio" name="isInstalment" value="full"
                       title="全款" ${student.isInstalment=='full'?'checked':''}>
                <input type="radio" name="isInstalment" value="yes"
                       title="分期" ${student.isInstalment=='yes'?'checked':''}>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">金额</label>
            <div class="layui-input-block">
                <input type="text" name="signupMoney" class="layui-input" lay-verify="required|number"
                       value="${student.signupMoney}">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <textarea class="layui-textarea " name="remark" rows="4"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <a class="layui-btn" onclick="submitRegistInfo()">确定</a>
            </div>
        </div>
    </form>
    <script>
        layui.use(['form'], function () {
            var form = layui.form();
            form.render("radio");
        });
        function submitRegistInfo() {
            $("#seatinfo_form").ajaxSubmit({
                dataType: "json",
                beforeSend: function () {
                    $("button[lay-filter='seatinfo_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='seatinfo_btn']").text("保存中...");
                }, success: function (da) {
                    $("button[lay-filter='seatinfo_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='seatinfo_btn']").text("立即提交");
                    layer.msg("操作成功,不需要提交表单");
                }
            });
            return false;
        }
    </script>
</div>