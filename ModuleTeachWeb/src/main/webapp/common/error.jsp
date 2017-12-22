<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>错误信息</title>
    <base href="/"/>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="res/css/font-awesome.css?v=4.4.0" rel="stylesheet">
    <link href="res/css/animate.css" rel="stylesheet">
    <link href="res/css/style.css?v=4.1.0" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">

                <div class="ibox-content">
                    <div class="alert alert-danger alert-dismissable">
                        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                        <h1>${errorMsg}</h1>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 全局js -->
<script src="res/js/jquery.min.js?v=2.1.4"></script>
<script src="res/js/bootstrap.min.js?v=3.3.6"></script>


</body>

</html>
