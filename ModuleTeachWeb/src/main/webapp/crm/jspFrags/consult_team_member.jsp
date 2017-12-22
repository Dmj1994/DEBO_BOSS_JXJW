<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:length(teamChargers)==0}"><p style="padding:10px">暂无数据</p></c:if>
<form class="layui-form">
    <c:forEach var="member" items="${teamChargers}">
        <input type="checkbox" lay-filter="members" teamName="${member.teamName}" lay-skin="primary" name="charger"
               title="${member.userName}" value="${member.uuid}"
               class="">
    </c:forEach>
    <div id="choose_msg">
    </div>
    <script>
        layui.use(['form'], function () {
            var form = layui.form();


            form.on('checkbox(members)', function (data) {
                var teamName = $(data.elem).attr("teamName");
                var userName = $(data.elem).attr("title");

                if ($(data.elem).attr("checked")) {
                    $(data.elem).removeAttr("checked");
                    $("#textarea_members").text($("#textarea_members").text().replace(userName + ",", ""));
                    $("input[name='teamMembers']").val($("input[name='teamMembers']").val().replace(data.value + "!", ""));
                } else {
                    $(data.elem).attr("checked", "checked");
                    $("#textarea_members").text($("#textarea_members").text() + userName + ",");
                    $("input[name='teamMembers']").val($("input[name='teamMembers']").val() + data.value + "!");
                }

            });

            var memSelected = $("#textarea_members").text();
            if (memSelected.length > 0) {
                var memNames = memSelected.split(",");
                $("input[lay-filter='members']").each(function () {
                    var memDB = this;
                    console.log("111");
                    $(memNames).each(function () {
                        console.log("222");
                        if (memDB.title == this) {
                            console.log("333");
                            $(memDB).attr("checked", true);
                        }
                    });
                });
            }
            form.render("checkbox");
        });
    </script>
</form>