<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="wrapper wrapper-content animated fadeInRight">
    <c:forEach items="${pager.rows}" var="classInfo" varStatus="in">
        <c:if test="${in.index mod 4 == 0}">
            <div class="row">
        </c:if>
        <div class="col-sm-3">
            <div class="contact-box">
                <a href="javascript:void(0)" onclick="loadClassInfo('${classInfo.uuid}')">
                    <h1><strong>${classInfo.className}</strong></h1>
                    <address>
                        班主任：${classInfo.assistName}<br>
                        教员：${classInfo.teacherName}<br>
                        开班时间：<fmt:formatDate value="${classInfo.openDate}" pattern="yyyy-MM-dd"/> <br>
                        现有人数：${classInfo.studentNum}<br>
                        上课时间：${classInfo.classStartTime}${classInfo.classStartPeriod}<br>
                        状态：${classInfo.classStatusStr}
                    </address>
                </a>
            </div>
        </div>
        <c:if test="${(in.index+1) mod 4 == 0}">
            </div>
        </c:if>
    </c:forEach>
    </div>
${pager.bootstrapPager}
</div>

<script>
    $(document).ready(function () {
        $('.contact-box').each(function () {
            animationHover(this, 'pulse');
        });
    });

    function loadClassInfo(classId) {
        $.ajax({
            url: "../boss/dean/loadClassInfo",
            data: {"classId": classId, "studentId": "${studentId}"},
            success: function (da) {
                $("#tab_student_feedback").html(da);
                $(".seatDetail").click(function () {
                    if ($(this).attr("isTaken") != "") {
                        layer.msg("此座有主！");
                    } else {
                        var seatId = $(this).attr("seatId");
                        popSeatTake(seatId);
                    }
                });
            }
        });
    }

    var windowForChoose;
    function popSeatTake(seatId) {
        $.ajax({
            url: "../boss/dean/showSeatTake",
            data: {"studentId": "${studentId}", "seatId": seatId},
            success: function (da) {
                windowForChoose = layer.open({
                    title: "定座信息",
                    type: 0,
                    area: ['420px', '390px'],
                    btn: [],
                    content: da
                });
            }
        });
    }

    function removeStuFromSeat(seatId) {
        var confirmDialog = layer.confirm('确定要讲此学员从班里移除？', {
            btn: ['确定'], //按钮
            shade: false //不显示遮罩
        }, function () {
            $.ajax({
                url: "../boss/dean/removeStuFromSeat",
                data: {"seatId": seatId},
                success: function (da) {
                    layer.close(confirmDialog);
                    initSingleSeat(da.data);
                }
            });
        });
    }
</script>