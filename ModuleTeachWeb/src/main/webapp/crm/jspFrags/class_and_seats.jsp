<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>
<div class="row">
    <div class="col-sm-12" style="text-align: center">
        <a class="layui-btn" lay-filter="save_btn" onclick="backToClassList()">返回班级列表</a>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <dl class="dl-horizontal">
            <dt>班級教员：</dt>
            <dd>${classInfo.teacherName}</dd>
            <dt>班主任：</dt>
            <dd>${classInfo.assistName}</dd>
            <dt>班级类型：</dt>
            <dd>${classInfo.classType}</dd>
        </dl>
    </div>
    <div class="col-sm-4">
        <dl class="dl-horizontal">
            <dt>创建时间：</dt>
            <dd><fmt:formatDate value="${classInfo.createTime}" pattern="yyyy-MM-dd"/></dd>
            <dt>开班时间：</dt>
            <dd><fmt:formatDate value="${classInfo.openDate}" pattern="yyyy-MM-dd"/></dd>
            <dt>上课时间：</dt>
            <dd>${classInfo.classStartTime} ${classInfo.classStartPeriod}</dd>
        </dl>
    </div>
    <div class="col-sm-4">
        <dl class="dl-horizontal">
            <dt>状态：</dt>
            <dd>${classInfo.classStatusStr}</dd>
            <dt>目前人数：</dt>
            <dd>${classInfo.studentNum}</dd>
        </dl>
    </div>
</div>


<div class="row" class="seatList">
    <c:if test="${fn:length(classInfo.classSeats)==0}"><p style="padding:10px">暂无数据</p></c:if>
    <c:forEach var="seat" items="${classInfo.classSeats}">
    <div class="col-sm-2" id="div_${seat.uuid}">
        <c:if test="${empty seat.studentId}">
        <div class="panel panel-warning">
            </c:if>
            <c:if test="${!empty seat.studentId}">
            <c:if test="${seat.isCurrent}">
            <div class="panel panel-danger">
                </c:if>
                <c:if test="${!seat.isCurrent}">
                <div class="panel panel-success">
                    </c:if>
                    </c:if>
                    <div class="panel-heading">
                            ${seat.seatNumber}
                        <c:if test="${(seat.isMine or kf:hasRole('1003',userRoleCodes ))  and seat.studentId !=null }">
                            <span style="float:right;">
                                <input type="checkbox" onclick="changeProfileStatus(this,'${seat.studentId}')"
                                       style="vertical-align:middle;margin-top:-2px;" ${seat.profileStatus == 1?"checked":""}/>档案已交
                            </span>
                        </c:if>
                    </div>
                    <div class="panel-body seatDetail" seatId="${seat.uuid}" style="height: 38px"
                         isTaken="${seat.studentId}">
                        <h1 style="font-size: 30px">${empty seat.studentName?"空":seat.studentName}</h1>
                    </div>
                    <div class="panel-footer">
                            ${seat.seatFooter}
                        <c:if test="${(seat.isMine or kf:hasRole('1001',userRoleCodes ) or kf:hasRole('1003',userRoleCodes )) and seat.studentId !=null }">
                            <span><a class="delBtn" href="javascript:" title="从此班移除"
                                     onclick="removeStuFromSeat('${seat.uuid}');"><i class="fa fa-close"></i></a></span>
                        </c:if>

                        <c:if test="${seat.profileStatus == 1}">
                            <i class="fa fa-file-text" title="档案已提交"></i>
                        </c:if>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
            <script>
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

                function backToClassList() {
                    var page = localStorage.getItem("classPage");
                    if (!page)
                        page = 1;
                    $.ajax({
                        url: "../boss/dean/backToClassList",
                        data: {"page": page, "studentId": "${studentId}"},
                        success: function (da) {
                            $("#tab_student_feedback").html(da);
                        }
                    });
                }

                function changeProfileStatus(ele, studentId) {
                    $.ajax({
                        url: "../boss/crm/changeProfileStatus",
                        data: {"studentId": studentId, "status": ele.checked ? "1" : "0"},
                        success: function (da) {
                            layer.msg("更改成功！");
                        }
                    });
                }
            </script>