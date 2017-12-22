<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>电话录音播放</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <link href="/res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/res/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="/res/css/animate.css" rel="stylesheet">
    <link href="/res/css/style.css?v=4.1.0" rel="stylesheet">
    <link rel="stylesheet" href="/res/js/plugins/AudioPlayer/css/reset.css"/>
    <link rel="stylesheet" href="/res/js/plugins/AudioPlayer/css/audioplayer.css"/>

    <style>

    </style>
</head>
<body>

<div style="background-color: #00b7ee" style="width:100px;height:30px;">
    <video controls="" autoplay="" name="media" height="100%" width="100%">
        <source src="http://oxjaebj87.bkt.clouddn.com/${comm.audioLinks}" type="audio/x-wav">
    </video>
</div>

<table class="table table-striped">
    <tr>
        <td width="100">拨打时间：</td>
        <td align="left"><fmt:formatDate value="${comm.audioDialTime}" pattern="yyyy-MM-dd HH:mm"/></td>
    </tr>
    <tr>
        <td width="100">客户号码：</td>
        <td align="left">${comm.audioClient}</td>

    </tr>
    <tr>
        <td width="100">通话时长：</td>
        <td align="left">${comm.audioLengths}</td>
    </tr>
</table>

</body>
</html>