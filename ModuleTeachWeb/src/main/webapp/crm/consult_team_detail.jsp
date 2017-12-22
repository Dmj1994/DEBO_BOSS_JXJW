<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title></title>
    <base href="/"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../res/js/plugins/layui/css/layui.css" media="all">
    <style>
        .layui-form-item {
            margin-bottom: 10px
        }

        .layui-form-pane .layui-form-label {
            width: 90px
        }

        .layui-form-pane .layui-input-block {
            margin-left: 100px;
        }
    </style>
</head>
<body>

<form class="layui-form" id="form" action="../boss/crm/updateTeam" method="post">
    <input type="hidden" name="uuid" value="${consultTeam.uuid}"/>
    <div style="padding:20px">
        <div class="layui-form-item">
            <label class="layui-form-label">所属校区</label>
            <div class="layui-input-block" style="max-width:580px">
                <select id="select_school" lay-verify="required" name="teamSchool">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">小组名称</label>
            <div class="layui-input-block" style="max-width:580px">
                <input type="text" name="teamName" class="layui-input" lay-verify="required"
                       value="${consultTeam.teamName}">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">小组组长</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" lay-verify="required" placeholder="请选择" readonly
                           id="input_team_charger" value="${consultTeam.chargerName}">
                    <input type="hidden" name="teamCharger" value="${consultTeam.teamCharger}" id="charger">
                </div>
            </div>

            <div class="layui-inline">
                <a class="layui-btn layui-btn-info layui-btn-small" title="选择组长" id="a_choose_charger"><i
                        class="layui-icon" disabled="disabled">&#xe654;</i></a>

                <a class="layui-btn layui-btn-danger layui-btn-small" title="卸任组长" id="a_dismis_charger"><i
                        class="layui-icon">&#x1006;</i></a>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">小组成员</label>
                <div class="layui-input-inline">
                    <textarea name="teamMembersNames" lay-verify="required" rows="5" style="width:100%;padding:5px"
                              id="textarea_members" readonly>${consultTeam.teamMembersNames}</textarea>
                    <input name="teamMembers" type="hidden" value="${consultTeam.teamMembers}"/>
                </div>
            </div>

            <div class="layui-inline">
                <a class="layui-btn layui-btn-info layui-btn-small" title="选择成员" id="a_choose_member"><i
                        class="layui-icon">&#xe654;</i></a>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="upd_btn">立即更新</button>
            </div>
        </div>

    </div>
</form>

<script src="../res/js/plugins/layui/layui.js" charset="utf-8"></script>
<script src="../res/js/jquery.min.js" charset="utf-8"></script>
<script src="../res/js/jquery.form.js" charset="utf-8"></script>
<script src="../res/js/common/area.js" charset="utf-8"></script>
<script src="../res/js/content.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;
        //监听提交
        form.on('submit(upd_btn)', function (data) {
            $("#form").ajaxSubmit({
                beforeSend: function () {
                    $("button[lay-filter='stu_save_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("更新中...");

                }, success: function () {
                    $("button[lay-filter='stu_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("立即更新");


                    var l1 = layer.confirm('更新成功', {
                        btn: ['确定', '取消'] //可以无限个按钮
                    }, function (index, layero) {
                        parent.closeAdd();
                    }, function (index) {

                    });
                }, error: function () {
                    $("button[lay-filter='stu_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("立即更新");
                }
            });
            return false;
        });
    });

    function loadSchools() {
        var schoolCode = "${consultTeam.teamSchool}";
        $.ajax({
            url: "../boss/organization/loadSchools",
            dataType: "json",
            success: function (da) {
                var schools = "<option value=''>请选择</option>";
                $(da.data).each(function () {
                    schools += "<option value='" + this.organizationCode + "'" + (schoolCode == this.organizationCode ? "selected" : "") + ">" + this.organizationName + "</option>";
                });

                $("#select_school").html(schools);

                layui.use(['form'], function () {
                    layui.form().render("select");
                });
            }
        });
        $("#a_choose_charger").click(popChooseCharger);
        $("#a_choose_member").click(popChooseMember);
        $("#a_dismis_charger").click(disMisCharger);
    }
    loadSchools();

    function popChooseCharger() {
        var schoolCode = $("#select_school").val();
        if (schoolCode == "") {
            layer.msg("请选择校区");
            return false;
        }
        $.ajax({
            url: "../boss/crm/nav2choseTeamCharger",
            data: {"schoolCode": schoolCode},
            success: function (da) {
                layer.open({
                    title: "请选择组长",
                    type: 0,
                    area: ['300px', '500px'],
                    content: da
                });
            }
        });
    }

    function disMisCharger() {
        var l1 = layer.confirm('确定卸任该成员组长角色？', {
            btn: ['卸任', '暂留'] //可以无限个按钮
        }, function (index, layero) {
            var teamCharger = $("input[name='teamCharger']").val();
            var teamId = $("input[name='uuid']").val();
            $.ajax({
                url: "../boss/crm/dismisTeamCharger",
                data: {"teamId": teamId, "chargerId": teamCharger},
                success: function (da) {
                    $("#input_team_charger").val("");
                    $("input[name='teamCharger']").val("");
                    layer.msg("卸任成功，亲重新选择组长");
                }
            });
        }, function (index) {//取消

        });
    }

    function popChooseMember() {
        var schoolCode = $("#select_school").val();
        var charger = $("#charger").val();
        if (charger == "") {
            layer.msg("请选择组长");
            return false;
        }
        $.ajax({
            url: "../boss/crm/nav2choseTeamMember",
            data: {"schoolCode": schoolCode, "teamCharger": charger},
            success: function (da) {
                layer.open({
                    title: "请选择组员",
                    type: 0,
                    area: ['300px', '500px'],
                    content: da
                });
            }
        });
    }

</script>

</body>
</html>