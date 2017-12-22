<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<form class="layui-form">
    <c:if test="${fn:length(wxs)==0}"><p style="padding:10px">暂无数据</p></c:if>
    <c:forEach var="wx" items="${wxs}">
        <input type="checkbox" name="wc_id" lay-skin="primary" title="${wx.wcName}" value="${wx.uuid}"
               lay-filter="wc_id">
    </c:forEach>
</form>

<script>
    layui.use(['form'], function () {
        var form = layui.form();
        form.render("checkbox");

        form.on("checkbox(wc_id)", function (data) {
            var wc_public_ids = $("#wc_public_ids").val();
            if (data.elem.checked)
                wc_public_ids += data.value + "!";
            else
                wc_public_ids = wc_public_ids.replace(data.value + "!", "");
            $("#wc_public_ids").val(wc_public_ids);
        });
    });


</script>