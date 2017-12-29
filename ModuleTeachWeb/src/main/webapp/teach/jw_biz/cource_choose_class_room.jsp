<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>选择教室</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="/res/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link rel="stylesheet" href="/res/js/plugins/layui/css/layui.css" media="all">
    <link href="/res/css/style.css?v=4.1.0" rel="stylesheet">
    <style>
        .layui-form-item .layui-inline{
            margin-right:0px
        }
        .layui-form-item {
            margin-bottom: 10px
        }
        .required-field {
            color: red
        }
        .layui-form-radio{margin:6px 0px 0 0}
        .layui-form-checkbox span{padding:0px 4px}

    </style>
</head>
<body>

<form class="layui-form" id="stu_form" action="../boss/crm/saveStudent" method="post">
        <div class="form-group">
            <label class="col-sm-3 control-label">请选择校区</label>

            <div class="col-sm-8">
                <select class="form-control m-b" name="account">
                    <option>未选择</option>
                    <option>武林门校区</option>
                    <option>树人大学校区</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">请选择班级</label>
            <div class="col-sm-8">
                 <div style="height:300px">
                     <table class="table table-bordered ">
                         <thead>
                         <tr>
                             <th>教室名称</th>
                             <th>座位数</th>
                             <th>有无投影</th>
                             <th>特殊说明</th>
                             <th>状态</th>
                         </tr>
                         </thead>
                         <tbody>
                         <tr>
                             <td>机6</td>
                             <td>30</td>
                             <td>无</td>
                             <td></td>
                             <td>正常</td>
                         </tr>
                         <tr>
                             <td>会议室1</td>
                             <td>20</td>
                             <td>有</td>
                             <td></td>
                             <td>正常</td>
                         </tr>
                         <tr>
                             <td>会议室1</td>
                             <td>20</td>
                             <td>有</td>
                             <td></td>
                             <td>正常</td>
                         </tr>
                         <tr>
                             <td>会议室1</td>
                             <td>20</td>
                             <td>有</td>
                             <td></td>
                             <td>正常</td>
                         </tr>
                         <tr>
                             <td>会议室1</td>
                             <td>20</td>
                             <td>有</td>
                             <td></td>
                             <td>正常</td>
                         </tr>

                         </tbody>
                     </table>
                 </div>
            </div>
        </div>

</form>

<script src="/res/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="/res/js/jquery.min.js" charset="utf-8"></script>
<script src="/res/js/jquery.form.js" charset="utf-8"></script>
<script src="/res/js/common/area.js" charset="utf-8"></script>
<script src="/res/js/content.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
    });

    $(".table tr").hover(function(){
        $(this).css({"background-color":"#dddfe1","cursor":"pointer"});
    },function(){
        $(this).css("background-color","");
    });

    $(".table tr").dblclick(function(){
            parent.closeWindow();
    });
</script>

</body>
</html>