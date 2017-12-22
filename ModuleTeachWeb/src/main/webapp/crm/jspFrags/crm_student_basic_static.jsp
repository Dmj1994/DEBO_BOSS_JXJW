<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="kf" uri="/WEB-INF/tlds/function-tag.tld" %>
<style>
    .layui-form-item {
        margin-bottom: 0px
    }

    .layui-form-item .layui-input-inline {
        width: 130px
    }

    .layui-form-radio {
        padding-right: 0px;
        margin-right: 0px
    }

    .info_block_b {
        padding-top: 10px;
        background-color: #FAFAFA;
        margin-bottom: 10px;

    }

    .info_block_a {
        padding-top: 10px;
        margin-bottom: 10px;
    }


    .info_block_c {
        padding-top: 10px;
        margin-bottom: 10px;

    }

    .required-field {
        color: red
    }

    .floatBorder{
        /* curved corners */
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        border-radius: 5px; /* standard version at last */

        /* drop shadows. */
        -moz-box-shadow: 0px 0px 5px rgba(0,0,0,0.45), 0px 1px 2px rgba(0,0,0,0.2);
        -webkit-box-shadow: 0px 0px 5px rgba(0,0,0,0.45), 0px 1px 2px rgba(0,0,0,0.2);
        box-shadow: 0px 0px 5px rgba(0,0,0,0.45), 0px 1px 2px rgba(0,0,0,0.2); /* standard version at last */
    }
    .col-md-6{padding-right: 0px;width:49%}
</style>
<form class="layui-form" id="stu_form" action="../boss/crm/updateStudent" method="post">
    <div style="padding:15px 0px">
        <div class="row ">
            <div class="col-md-6">
                <div class="info_block_b floatBorder">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label required-field">姓名</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuName"  class="layui-input"
                                       placeholder="必填"
                                       value="${studentVO.stuName}">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label required-field">自身专业</label>
                            <div class="layui-input-inline" style="max-width:580px">
                                <select name="majar" id="majar" >
                                    <option value="未知">未知</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label required-field">学员电话</label>
                            <div class="layui-input-inline">
                                <input type="text" name="phones[0]" class="layui-input" lay-verify="required|tel"
                                       placeholder="请注意格式"
                                       id="inp_main_phone">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">电话备注</label>
                            <div class="layui-input-inline" style="width: 80px">
                                <input type="text" name="phoneRemarks[0]" class="layui-input" id="inp_main_phone_remak">

                            </div>
                            <button class="layui-btn layui-btn-info layui-btn-small" title="添加联系方式"
                                    id="btn-add-contact"><i
                                    class="layui-icon">&#xe654;</i></button>
                        </div>

                    </div>

                    <div class="layui-form-item" id="ct_break">
                        <div class="layui-inline">
                            <label class="layui-form-label required-field">年龄</label>
                            <div class="layui-input-inline">
                                <input type="text" name="stuAge" class="layui-input"
                                       placeholder="只能是数字" value="${studentVO.stuAge}">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">关键词</label>
                            <div class="layui-input-inline">
                                <input type="text" name="keyInfo" class="layui-input" value="${studentVO.keyInfo}">
                            </div>
                        </div>
                    </div>


                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label required-field">学员性别</label>
                            <div class="layui-input-inline">
                                <select name="gender" >
                                    <option value="未知" ${studentVO.gender eq '未知'?'selected':''}>未知</option>
                                    <option value="男" ${studentVO.gender eq '男'?'selected':''}>男</option>
                                    <option value="女" ${studentVO.gender eq '女'?'selected':''}>女</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label required-field">学员学历</label>
                            <div class="layui-input-inline">
                                <select name="stuEducation" id="stuEducation" >
                                    <option value="">未知</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label required-field">工作状态</label>
                            <div class="layui-input-inline">
                                <select name="workStatus" id="workStatus" >
                                    <option value="">未知</option>

                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label required-field">咨询方向</label>
                            <div class="layui-input-inline">
                                <select name="studyCource" id="studyCource">
                                    <option value="">未知</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学员Q Q</label>
                            <div class="layui-input-inline">
                                <input type="text" name="qq" class="layui-input" value="${studentVO.qq}">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">学员微信</label>
                            <div class="layui-input-inline">
                                <input type="text" name="wechat" class="layui-input" value="${studentVO.wechat}">
                            </div>
                        </div>
                    </div>




                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">学习目标</label>
                            <div class="layui-input-inline">
                                <input type="text" name="studyAim" class="layui-input" value="${studentVO.studyAim}">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">在线咨询师</label>
                            <div class="layui-input-inline">
                                <input type="text" name="onlineConsult" class="layui-input" value="${studentVO.onlineConsult}">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <label class="layui-form-label required-field">学员地域</label>
                        <div class="layui-input-inline" style="width:121px">
                            <select name="province" lay-filter="province" id="province" >
                                <option value="">请选择省</option>
                            </select>
                        </div>
                        <div class="layui-input-inline " style="width:121px">
                            <select name="city" id="city" lay-filter="city" >
                                <option value="">请选择市</option>
                            </select>
                        </div>
                        <div class="layui-input-inline" style="width:121px">
                            <select name="district" id="district">
                                <option value="">请选择县/区</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">邀约上门</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="isInvite" value="是"
                                       title="是" ${studentVO.isInvite eq '是'?'checked':''}>
                                <input type="radio" name="isInvite" value="否"
                                       title="否" ${studentVO.isInvite eq '否'?'checked':''}>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label" title="是否介绍北大青鸟">是否介绍</label>
                            <div class="layui-input-inline">
                                <input type="radio" name="isIntroduceBdqn" value="是"
                                       title="是" ${studentVO.isIntroduceBdqn eq '是'?'checked':''}>
                                <input type="radio" name="isIntroduceBdqn" value="否"
                                       title="否" ${studentVO.isIntroduceBdqn eq '否'?'checked':''}>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="info_block_c floatBorder" >

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">客户类型</label>
                            <div class="layui-input-block">
                                <input type="radio" name="clientType" lay-skin="primary" title="A" value="A"
                                       lay-filter="clientType" ${kf:hasString("A",studentVO.clientType )?"checked":""}>
                                <input type="radio" name="clientType" lay-skin="primary" title="B" value="B"
                                       lay-filter="clientType" ${kf:hasString("B",studentVO.clientType )?"checked":""}>
                                <input type="radio" name="clientType" lay-skin="primary" title="C" value="C"
                                       lay-filter="clientType" ${kf:hasString("C",studentVO.clientType )?"checked":""}>
                                <input type="radio" name="clientType" lay-skin="primary" title="D" value="D"
                                       lay-filter="clientType" ${kf:hasString("D",studentVO.clientType )?"checked":""}>
                                <input type="radio" name="clientType" lay-skin="primary" title="G" value="G"
                                       lay-filter="clientType" ${kf:hasString("G",studentVO.clientType )?"checked":""}>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">量有效性</label>
                            <div class="layui-input-block">
                                <input type="radio" name="isValidate" title="有效"
                                       value="1" ${"1" eq studentVO.isValidate ?"checked":""} lay-filter="isValidate">
                                <input type="radio" name="isValidate" title="无效"
                                       value="2" ${ "2" eq studentVO.isValidate ?"checked":""} lay-filter="isValidate">
                                <input type="radio" name="isValidate" title="待定"
                                       value="3" ${"3" eq studentVO.isValidate ?"checked":""} lay-filter="isValidate">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">数据颜色</label>
                            <div class="layui-input-block">
                                <input name="dataColor" type="hidden" id="dataColor"/>
                                <a class="row_color  color_a ${studentVO.dataColor eq '#4FD192'?"color_checked":""}" title="已报名"></a>
                                <a class="row_color  color_b ${studentVO.dataColor eq '#9496DC'?"color_checked":""}" title="上门未定机"></a>
                                <a class="row_color  color_c ${studentVO.dataColor eq '#F3B001'?"color_checked":""}" title="定机量"></a>
                                <a class="row_color  color_d ${studentVO.dataColor eq '#FD98CF'?"color_checked":""}" title="A量里的重点量"></a>
                                <a class="row_color  color_empty ${empty studentVO.dataColor ?"color_checked":""}"></a>
                            </div>
                        </div>
                    </div>

                </div>


                <div class="info_block_a floatBorder">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">信息提供者</label>
                            <div class="layui-input-inline">
                                <select name="infoProvider" id="infoProvider">
                                    <option value="未知">未知</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">首咨方式</label>
                            <div class="layui-input-inline">
                                <select name="firstConsultWay" id="firstConsultWay">
                                    <option value="未知">未知</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">渠道来源</label>
                            <div class="layui-input-inline">
                                <select name="infoSource" id="infoSource">
                                    <option value="未知">未知</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">媒体名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="mediaName" class="layui-input" placeholder="百度竞价，360等" value="${studentVO.mediaName}">
                            </div>
                        </div>
                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">咨询日期</label>
                            <div class="layui-input-inline">
                                <input type="text" name="consultDate" class="layui-input" id="consultDate"
                                       value="<fmt:formatDate value="${studentVO.consultDate}"  pattern="yyyy-MM-dd"/>">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">去电时间</label>
                            <div class="layui-input-inline">
                                <input type="text" name="callTime" class="layui-input" id="callDate"
                                       value="<fmt:formatDate value="${studentVO.callTime}"  pattern="yyyy-MM-dd HH:mm"/>">
                            </div>
                        </div>
                    </div>
                </div>


                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="stu_save_btn">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <textarea class="layui-textarea" name="chatLog" rows="50" id="chatLog">${studentVO.chatLog}</textarea>
            </div>
        </div>

    </div>
</form>


<script>
    var editIndex;
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form()
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

        layedit.set({
            uploadImage: {
                url: '../boss/crm/uploadChatLogPic'
            }
        });
        editIndex = layedit.build('chatLog', {
            height: 714
        }); //建立编辑器






        //监听提交
        form.on('submit(stu_save_btn)', function (data) {
            layedit.sync(editIndex);
            var studentId = getQueryString("studentId");
            $("#stu_form").ajaxSubmit({
                data: {"uuid": studentId},
                beforeSend: function () {
                    $("button[lay-filter='stu_save_btn']").addClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("保存中...");
                }, success: function () {
                    $("button[lay-filter='stu_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("立即提交");
                    layer.open({
                        title: "提示",
                        type: 0,
                        content: '数据更新成功'
                    });
                    parent.closeAdd();
                }, error: function () {
                    $("button[lay-filter='stu_save_btn']").removeClass("layui-btn-disabled");
                    $("button[lay-filter='stu_save_btn']").text("立即提交");
                }
            });
            return false;
        });

        $("#btn-add-contact").click(addContact);

        form.on('select(province)', function (data) {
            loadAreas(2, data.value.split("_")[0], "city", "");
            form.render('select');
        });

        form.on('select(city)', function (data) {
            loadAreas(3, data.value.split("_")[0], "district", "");
            form.render('select');
        });

        var consultDateSeting = {
            min: '2013-06-16 23:59:59'
            , max: '2050-06-16 23:59:59'
            , istoday: false
        };

        document.getElementById('consultDate').onclick = function () {
            consultDateSeting.elem = this;
            laydate(consultDateSeting);
        };


        var callDateSeting = {
            min: '2013-06-16 23:59:59',
            max: '2050-06-16 23:59:59',
            format: 'YYYY-MM-DD hh:mm',
            istime: true,
            istoday: false
        };
        document.getElementById('callDate').onclick = function () {
            callDateSeting.elem = this;
            laydate(callDateSeting);
        };

        initArea();
        initClientType();
        initPhones();

        //自定义验证规则
        form.verify({
            tel: function (value) {
                if (!/((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)/.test(value)) {
                    return '请输入正确的电话格式';
                }
            }
        });

        $(".row_color").click(function () {
            $(".row_color").removeClass("color_checked");
            $(".row_color").animate({"border-radius": "0"}, "fast");
            $(this).animate({"border-radius": "50%"});
            var bgColor = $(this).css("background-color");
            if (bgColor.indexOf("#") != 0) {
                bgColor = rgb2hex($(this).css("background-color"));
            }
            $("#dataColor").val(bgColor);
            // updateFollowStatus("dataColor", bgColor);

        });

        /*   form.on('radio(clientType)', function (data) {
         updateFollowStatus("clientType", data.value);
         });
         form.on('radio(isValidate)', function (data) {
         updateFollowStatus("validate", data.value);
         });*/

    });


    function updateFollowStatus(type, val) {
        $.ajax({
            url: "../boss/crm/updateFollowStatus",
            data: {"studentId": "${studentVO.uuid}", "type": type, "value": val},
            success: function (da) {

            }
        });
    }

    var index = 1;
    function addContact(stuPhone, phoneRemark) {
        var html = '<div class="layui-form-item" id="ct_' + index + '">';
        html += ' <div class="layui-inline">';
        html += '<label class="layui-form-label">学员电话</label>';
        html += '<div class="layui-input-inline" >';
        if (stuPhone && stuPhone.length > 0)
            html += '<input type="text" name="phones[' + index + ']"  class="layui-input" value="' + stuPhone + '" lay-verify="required|tel"> ';
        else
            html += '<input type="text" name="phones[' + index + ']"  class="layui-input" lay-verify="required|tel"> ';

        html += '</div></div>';
        html += ' <div class="layui-inline">';
        html += ' <label class="layui-form-label"> 电话备注</label>';
        html += '<div class="layui-input-inline" style="width: 80px">';
        if (phoneRemark)
            html += '<input type="text" name="phoneRemarks[' + index + ']"  class="layui-input" value="' + phoneRemark + '">';
        else
            html += '<input type="text" name="phoneRemarks[' + index + ']"  class="layui-input">';
        html += '</div>';
        html += '<button class="layui-btn layui-btn-danger layui-btn-small deleteContact" title="删除联系方式" delind="' + index + '"><i class="layui-icon">&#x1006;</i></button>';
        html += '</div></div>';
        $("#ct_break").before(html);

        $(".deleteContact").click(function () {
            var id = $(this).attr("delind");
            layui.use(['layer',], function () {
                var openIndex = layer.open({
                    type: 0
                    , area: '300px'
                    , id: 'LAY_demo00' //防止重复弹出
                    , content: "确定要删除此联系方式？"
                    , btn: ['确认', '取消']
                    , yes: function () {
                        $("#ct_" + id).remove();
                        index--;
                        layer.close(openIndex);
                    }
                });
            });
            return false;
        });
        index++;
        return false;
    }


    function loadAreas(level, parentCode, selectId, defautName) {
        var selectOptions = "<option value=''>请选择</option>";
        $(areas).each(function () {
            if (level == 1 && this.level == 1) {
                if (this.name == defautName)
                    selectOptions += "<option value='" + this.code + "_" + this.name + "' selected>" + this.name + "</option>";
                else
                    selectOptions += "<option value='" + this.code + "_" + this.name + "' >" + this.name + "</option>";
            } else if (level == 2 && this.level == 2 && this.sheng == parentCode.substring(0, 2) && this.xian == "00") {
                if (this.name == defautName)
                    selectOptions += "<option value='" + this.code + "_" + this.name + "' selected>" + this.name + "</option>";
                else
                    selectOptions += "<option value='" + this.code + "_" + this.name + "' >" + this.name + "</option>";
            } else if (level == 3 && this.level == 3 && this.di == parentCode.substring(2, 4) && this.sheng == parentCode.substring(0, 2)) {
                if (this.name == defautName)
                    selectOptions += "<option value='" + this.code + "_" + this.name + "' selected>" + this.name + "</option>";
                else
                    selectOptions += "<option value='" + this.code + "_" + this.name + "' >" + this.name + "</option>";
            }
        });
        $("#" + selectId).html(selectOptions);
    }


    function initArea() {
        var province = '${studentVO.province}';
        var city = '${studentVO.city}';
        var district = '${studentVO.district}';

        if (province.length > 0 && province.split("_").length > 0) {
            loadAreas(1, '', "province", province.split("_")[1]);
        } else {
            loadAreas(1, '', "province", "", "");
        }

        if (city.length > 0 && city.split("_").length > 0)
            loadAreas(2, city.split("_")[0], "city", city.split("_")[1]);

        if (district.length > 0 && district.split("_").length > 0)
            loadAreas(3, district.split("_")[0], "district", district.split("_")[1]);

        layui.use(['form'], function () {
            layui.form().render("select")
        });
    }

    function initClientType() {
        var clientType = "${studentVO.clientType}";
        if (clientType.split(",").length > 0) {
            var clientTypes = clientType.split(",");
            for (var i = 0; i < clientTypes.length; i++) {
                $("input[name='clientType']").each(function () {
                    if (this.title == clientTypes[i]) {
                        $(this).attr("checked", true);

                    }
                });
            }
        }
        layui.use(['form'], function () {
            var form = layui.form();
            layui.form().render('checkbox');
        });
    }

    function initPhones() {
        $.ajax({
            url: "../boss/crm/loadStudentPhones",
            data: {"studentId": "${studentVO.uuid}"},
            success: function (da) {
                for (var i = 0; i < da.data.length; i++) {
                    if (i == 0) {//默认第一个电话为主电话
                        $("#inp_main_phone").val(da.data[0].phone);
                        $("#inp_main_phone_remak").val(da.data[0].remark);
                    } else {
                        addContact(da.data[i].phone, da.data[i].remark);
                    }
                }
            }
        });
    }

    function loadSelect(cat, selectid, defaultValue) {
        $.ajax({
            url: "../boss/basic/dictionary",
            dataType: "json",
            data: {"category": cat},
            success: function (da) {
                buildDicSelect(da.data, selectid, defaultValue);
            }
        });
    }


    loadSelect("education", "stuEducation", "${studentVO.stuEducation}");
    loadSelect("workstatus", "workStatus", "${studentVO.workStatus}");
    loadSelect("studycource", "studyCource", "${studentVO.studyCource}");
    loadSelect("infoprovider", "infoProvider", "${studentVO.infoProvider}");
    loadSelect("fisrtconsultway", "firstConsultWay", "${studentVO.firstConsultWay}");
    loadSelect("infosource", "infoSource", "${studentVO.infoSource}");
    loadSelect("majar", "majar", "${studentVO.majar}");


    function buildDicSelect(data, selectId, defaultValue) {
        var optionsStr = "<option value=''>请选择</option>";
        $(data).each(function () {
            if (defaultValue == this.dictionaryName)
                optionsStr += "<option value='" + this.dictionaryName + "' selected>" + this.dictionaryName + "</option>";
            else
                optionsStr += "<option value='" + this.dictionaryName + "'>" + this.dictionaryName + "</option>";
        });
        $("#" + selectId).html(optionsStr);

        layui.use(['form'], function () {
            var form = layui.form();
            layui.form().render('select');
        });
    }



    layui.use(['layedit'], function () {
        var text = $("#chatLog").val();
        var textAfterChange=text.replace(/\n/g,"<br/>");
        $("#chatLog").val(textAfterChange);
        layui.layedit.sync(editIndex)
    });


</script>