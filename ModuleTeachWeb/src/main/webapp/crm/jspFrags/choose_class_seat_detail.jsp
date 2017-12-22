<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id="seatDetail">
    <form class="layui-form" id="seatinfo_form" action="../boss/dean/updateSeatinfo" method="post">
        <input type="hidden" name="uuid" value="${seatInfo.uuid}"/>
        <input type="hidden" name="studentId" value="${student.uuid}"/>
        <input type="hidden" name="studentName" value="${student.stuName}"/>

        <div class="layui-form-item">
            <label class="layui-form-label"><span
                    style="color:red;font-weight: bold">${seatInfo.seatNumber}</span>号座位</label>
            <div class="layui-input-block">
                <h1 id="h_stuName" style="font-size:30px;text-align: left">${student.stuName}</h1>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">定座方式</label>
            <div class="layui-input-block">
                <input type="radio" name="registeStatus" value="3" title="全款" checked>
                <input type="radio" name="registeStatus" value="2" title="分期">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">定座金额</label>
            <div class="layui-input-block">
                <input type="text" name="orderMoney" class="layui-input" lay-verify="required|number">
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
                <a class="layui-btn" onclick="submitSeatInfo()">确定</a>
                <a type="reset" class="layui-btn layui-btn-primary" onclick="backToChoose();">返回重选</a>
            </div>
        </div>
    </form>
    <script>
        layui.use(['form'], function () {
            var form = layui.form();
            form.render("radio");
        });
        function submitSeatInfo() {
            $("#seatinfo_form").ajaxSubmit({
                dataType: "json",
                beforeSend: function () {
                    $("button[lay-filter='seatinfo_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='seatinfo_btn']").text("保存中...");
                }, success: function (da) {
                    $("button[lay-filter='seatinfo_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='seatinfo_btn']").text("立即提交");
                    var confirmDialog = layer.confirm('订座成功', {
                        btn: ['确定'], //按钮
                        shade: false //不显示遮罩
                    }, function () {
                        layer.close(confirmDialog);
                        reloadSingleSeat();
                    });
                }
            });
            return false;
        }
        function reloadSingleSeat() {
            $.ajax({
                url: "../boss/dean/reloadSingleSeat",
                data: {"seatId": "${seatInfo.uuid}"},
                success: function (da) {
                    $("#div_${seatInfo.uuid}").html(da);
                }
            });
        }
        function backToChoose() {
            layer.close(windowForChoose);
        }
    </script>
</div>