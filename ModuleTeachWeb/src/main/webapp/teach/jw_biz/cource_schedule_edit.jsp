<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link href="/res/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="/res/css/animate.css" rel="stylesheet">
    <link href="/res/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="/res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/res/js/plugins/fullcalendar/fullcalendar.min.css?v=3.3.6" rel="stylesheet">
    <style>
        .folder-list li a{display: inline}
        .folder-list li{height:30px;line-height: 30px}
        .external-event{display:inline-grid;}
    </style>
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row animated fadeInDown">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>排课步骤</h5>
                </div>
                <div class="ibox-content">
                    <ul class="folder-list m-b-md" style="padding: 0">
                        <li>
                           <i class="fa fa-inbox "></i> Step 1:  <a href="mailbox.html"> 选择班级 </a><span class="label label-warning pull-right">JST1班</span>
                        </li>
                        <li>
                            <i class="fa fa-inbox "></i> Step 2:  <a href="mailbox.html"> 选择校区 </a><span class="label label-warning pull-right">武林门校区</span>
                        </li>
                        <li>
                            <i class="fa fa-inbox "></i> Step 3:  <a href="mailbox.html"> 选择机房 </a><span class="label label-warning pull-right">机6</span>
                        </li>
                        <li>
                            <i class="fa fa-inbox "></i> Step 4:  <a href="mailbox.html"> 选择产品 </a><span class="label label-warning pull-right">ACCP</span>
                        </li>
                    </ul>

                </div>
            </div>
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div id='external-events'>
                        <p>请选择课程内容</p>
                        <div class='external-event navy-bg' courseType="K" courseId="10101">S1</div>
                        <div class='external-event navy-bg'>S2</div>
                        <div class='external-event navy-bg'>Y2</div>
                        <div class='external-event navy-bg'>COT</div>

                        <div class='external-event navy-bg'>活动</div>
                        <div class='external-event navy-bg'>各部门职责及分工</div>
                        <div class='external-event navy-bg'>案例分享</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-9">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>课程日历表</h5>
                </div>
                <div class="ibox-content">
                    <div id="calendar"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- 全局js -->
<script src="/res/js/jquery.min.js?v=2.1.4"></script>
<script src="/res/js/bootstrap.min.js?v=3.3.6"></script>

<!-- 自定义js -->
<script src="/res/js/content.js?v=1.0.0"></script>
<script src="/res/js/jquery-ui.custom.min.js"></script>

<!-- iCheck -->
<script src="/res/js/plugins/iCheck/icheck.min.js"></script>

<!-- Full Calendar -->
<script src="/res/js/plugins/fullcalendar/moment.min.js"></script>
<script src="/res/js/plugins/fullcalendar/fullcalendar.min.js"></script>
<script src="/res/js/plugins/fullcalendar/zh-cn.js"></script>
<script>

        $(document).ready(function() {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            $('#external-events div.external-event').each(function () {
                var eventObject = {
                    title: $.trim($(this).text()), // use the element's text as the event title
                    courseType:$(this).attr("courseType"),
                    courseId:$(this).attr("courseId")
                };

                $(this).data('eventObject', eventObject);

                $(this).draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });

            });

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultDate: '2017-11-15',
                editable: true,
                droppable: true,
                eventLimit: true,
                drop: function (date, allDay) { // this function is called when something is dropped

                    var  tagElement  = $(this);
                    $.ajax({
                        url:"/teach/json/calendarData.json",
                        dataType:"json",
                        success:function(da){
                            console.log("###########"+da.length);
                            $('#calendar').fullCalendar('renderEvents', da, true);
                            tagElement.remove();
                        }
                    });
                }
            });
        });

</script>
</body>
</html>