<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:length(teamChargers)==0}"><p style="padding:10px">暂无数据</p></c:if>
<form class="layui-form">
    <c:forEach var="charger" items="${teamChargers}">
        <c:if test="${charger.teamName !=null}">
            <input type="radio" teamName="${charger.teamName}" lay-skin="primary" name="charger"
                   title="${charger.userName}(${charger.teamName}组长)"
                   value="${charger.uuid}"
                   class="" disabled="disabled">
        </c:if>
        <c:if test="${charger.teamName == null}">
            <input type="radio" teamName="${charger.teamName}" lay-skin="primary" name="charger"
                   title="${charger.userName}"
                   value="${charger.uuid}"
                   class="">
        </c:if>

    </c:forEach>
    <div id="choose_msg">
    </div>
    <script>
        layui.use(['form'], function () {
            var form = layui.form();
            form.render("radio");

            form.on('radio', function (data) {
                var teamName = $(data.elem).attr("teamName");
                var userName = $(data.elem).attr("title");

                if (teamName != null && teamName != "") {
                    $("#choose_msg").text(userName + "已经是" + teamName + "组组长，如果选择，" + teamName + "组组长将空缺");
                } else {
                    $("#choose_msg").text("");
                }
                $("#input_team_charger").val($(data.elem).attr("title"));
                $("input[name='teamCharger']").val(data.value);
            });
        });
    </script>
</form>