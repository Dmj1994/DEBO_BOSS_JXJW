<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>

<form class="layui-form" id="stu_status_form" action="../boss/crm/updateStudent" method="post">


    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">客户类型</label>
            <div class="layui-input-block">
                <input type="radio" name="clientType" lay-skin="primary" title="A" value="A"
                       lay-filter="clientType" ${kf:hasString("A",studentVO.clientType )?"checked":""}>
                <input type="radio" name="clientType" lay-skin="primary" title="B" value="B"
                       lay-filter="clientType" ${kf:hasString("B",studentVO.clientType )?"checked":""}>
                <input type="radio" name="clientType" lay-skin="primary" title="C" value="C"
                       lay-filter="clientType" ${kf:hasString("C",studentVO.clientType )?"checked":""}>
                <input type="radio" name="clientType" lay-skin="primary" title="D" value="D"
                       lay-filter="clientType" ${kf:hasString("D",studentVO.clientType )?"checked":""}>
                <input type="radio" name="clientType" lay-skin="primary" title="G" value="G"
                       lay-filter="clientType" ${kf:hasString("G",studentVO.clientType )?"checked":""}>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">量有效性</label>
            <div class="layui-input-block">
                <input type="radio" name="isValidate" title="有效"
                       value="1" ${studentVO.isValidate == 1 ?"checked":""} lay-filter="isValidate">
                <input type="radio" name="isValidate" title="无效"
                       value="2" ${studentVO.isValidate == 2 ?"checked":""} lay-filter="isValidate">
                <input type="radio" name="isValidate" title="待定"
                       value="3" ${studentVO.isValidate == 3 ?"checked":""} lay-filter="isValidate">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">数据颜色</label>
            <div class="layui-input-block">
                <a class="row_color  color_a ${studentVO.dataColor eq '#4FD192'?"color_checked":""}" title="已报名"></a>
                <a class="row_color  color_b ${studentVO.dataColor eq '#9496DC'?"color_checked":""}" title="上门未定机"></a>
                <a class="row_color  color_c ${studentVO.dataColor eq '#F3B001'?"color_checked":""}" title="定机量"></a>
                <a class="row_color  color_d ${studentVO.dataColor eq '#FD98CF'?"color_checked":""}" title="A量里的重点量"></a>
                <a class="row_color  color_empty ${empty studentVO.dataColor ?"color_checked":""}"></a>
            </div>
        </div>
    </div>


</form>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();
        form.render("radio");
        $(".row_color").click(function () {
            $(".row_color").removeClass("color_checked");
            $(".row_color").animate({"border-radius": "0"}, "fast");
            $(this).animate({"border-radius": "50%"});
            var bgColor = $(this).css("background-color");
            if (bgColor.indexOf("#") != 0) {
                bgColor = rgb2hex($(this).css("background-color"));
            }
            console.log("bgColor:" + bgColor);
            updateFollowStatus("dataColor", bgColor);

        });

        form.on('radio(clientType)', function (data) {
            updateFollowStatus("clientType", data.value);
        });
        form.on('radio(isValidate)', function (data) {
            updateFollowStatus("validate", data.value);
        });
    });


    function updateFollowStatus(type, val) {
        var studentVOId = getQueryString("studentVOId");
        $.ajax({
            url: "../boss/crm/updateFollowStatus",
            data: {"studentVOId": studentVOId, "type": type, "value": val},
            success: function (da) {

            }
        });
    }
</script>