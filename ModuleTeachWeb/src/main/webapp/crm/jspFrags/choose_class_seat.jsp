<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .float-e-margins .btn {
        margin-bottom: 0px
    }


    .col-sm-12 {
        padding-left: 0px;
        padding-right: 0px
    }

    .m-b-md {
        text-align: center
    }

    .col-sm-2 {
        padding-right: 5px;
        padding-left: 5px
    }

    .seatList {
        padding-right: 5px;
        padding-left: 5px
    }

    .panel-body {
        padding: 2px
    }

    h1 {
        padding: 0px;
        margin: 0px;
        text-align: center;
        font-size: larger;
    }

    h2 {
        font-weight: bold
    }

    .panel-heading {
        padding: 5px 10px;
        text-align: center
    }

    .panel-footer {
        padding: 7px 10px;
    }

    .delBtn {
        background-color: #adadad;
        border-radius: 50%;
        padding: 0px 2px
    }
</style>
<div class="wrapper wrapper-content animated fadeInRight">
    <div style="padding:0px 20px" id="class_info">
        <c:forEach items="${pager.rows}" var="classInfo" varStatus="in">
            <c:if test="${in.index mod 4 == 0}">
                <div class="row">
            </c:if>
            <div class="col-sm-3">
                <div class="contact-box accp">
                    <h1><strong>${classInfo.className}</strong></h1>
                    <a href="javascript:void(0)" onclick="loadClassInfo('${classInfo.uuid}')">
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
    layui.use(['form'], function () {
        var form = layui.form()
            , layer = layui.layer;
        form.render("select");

        form.on('select(classId)', function (data) {
            console.log(data.value);
            loadClassInfo(data.value);
            form.render('select');
        });

    });

    function loadClassInfo(classId) {
        $.ajax({
            url: "../boss/dean/loadClassInfo",
            data: {"classId": classId, "studentId": "${studentId}"},
            success: function (da) {
                $("#class_info").html(da);
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

    function initSingleSeat(seat) {
        var emtpySeat = '<div class="panel panel-warning"><div class="panel-heading">' + seat.seatNumber + '</div>';
        emtpySeat += '<div class="panel-body seatDetail" seatid="' + seat.uuid + '" style="height: 38px" istaken="">';
        emtpySeat += '<h1 style="font-size: 30px">空</h1></div><div class="panel-footer">暂无信息</div></div>';
        $("#div_" + seat.uuid).html(emtpySeat);
    }

</script>