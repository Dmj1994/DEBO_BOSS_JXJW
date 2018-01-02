// var $parentNode = window.parent.document;

// function $childNode(name) {
//     return window.frames[name]
// }

// // tooltips
// $('.tooltip-demo').tooltip({
//     selector: "[data-toggle=tooltip]",
//     container: "body"
// });

// // 使用animation.css修改Bootstrap Modal
// $('.modal').appendTo("body");

// $("[data-toggle=popover]").popover();


//判断当前页面是否在iframe中
if (top == this) {
    var gohome = '<div class="gohome"><a class="animated bounceInUp" href="index.html?v=4.0" title="返回首页"><i class="fa fa-home"></i></a></div>';
    $('body').append(gohome);
}

//animation.css
function animationHover(element, animation) {
    element = $(element);
    element.hover(
        function () {
            element.addClass('animated ' + animation);
        },
        function () {
            //动画完成之前移除class
            window.setTimeout(function () {
                element.removeClass('animated ' + animation);
            }, 2000);
        });
}

//拖动面板
function WinMove() {
    var element = "[class*=col]";
    var handle = ".ibox-title";
    var connect = "[class*=col]";
    $(element).sortable({
        handle: handle,
        connectWith: connect,
        tolerance: 'pointer',
        forcePlaceholderSize: true,
        opacity: 0.8,
    })
        .disableSelection();
}
//从地址栏获取参数
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null)return unescape(r[2]);
    return null;
}

//短日期格式设置 yyyy-MM-dd
var shortDateSeting = {
    min: '2013-01-01 23:59:59'
    , max: '2099-06-16 23:59:59'
    , istoday: false
};

//长日期格式设置 yyyy-MM-dd HH:mm
var longDateSeting = {
    min: '2013-01-01 23:59:59',
    max: '2099-06-16 23:59:59',
    format: 'YYYY-MM-DD hh:mm',
    istime: true,
    istoday: false
};


function loadSelect(cat, selectid) {
    $.ajax({
        url: "../boss/basic/dictionary",
        dataType: "json",
        data: {"category": cat},
        success: function (da) {
            buildDicSelect(da.data, selectid);
        }
    });
}


function buildDicSelect(data, selectId) {
    var optionsStr = "<option value=''>请选择</option>";
    $(data).each(function () {
        optionsStr += "<option value='" + this.dictionaryName + "'>" + this.dictionaryName + "</option>";
    });
    $("#" + selectId).html(optionsStr);

    layui.use(['form'], function () {
        var form = layui.form();
        layui.form().render('select');
    });
}

function showOrRemoveLoading(containerID, showOrRemove) {
    var html = '<div class="sk-spinner sk-spinner-wave" id="loading">';
    html += '<div class="sk-rect1"></div>';
    html += '<div class="sk-rect2"></div>';
    html += ' <div class="sk-rect3"></div>';
    html += '<div class="sk-rect4"></div>';
    html += '<div class="sk-rect5"></div>';
    html += '</div>';
    if (showOrRemove == 'show')
        $("#" + containerID).html(html);
    else
        $("#loading").remove();
}


$.ajaxSetup({
    error: function (XMLHttpRequest, textStatus, errorThrow) {

        if (XMLHttpRequest.status == 401) {
            top.location.href = "../x/qywx_login.html?code=notlogin";
            return false;
        }
        var jsonMsg = JSON.parse(XMLHttpRequest.responseText);
        if (jsonMsg) {
            if (XMLHttpRequest.status == 401 || jsonMsg.resultCode == '10005') {
                event.stopPropagation();
                top.location.href = "../x/qywx_login.html?code=notlogin";
                return false;
            } else {
                confirm(jsonMsg.resultMsg);
            }
        }
    }
});

var ajaxGridOptionsGlobal = {
    cache:false,
    error: function (XMLHttpRequest, textStatus, errorThrow) {
        if (XMLHttpRequest.status == 401)
            top.location.href = "../x/qywx_login.html?code=notlogin";
    }
};
//自动回填数据
function fillFormData(jsonStr) {
    var obj = jsonStr;
    var key, value, tagName, type, arr;
    for (x in obj) {
        key = x;
        value = obj[x];

        $("[name='" + key + "'],[name='" + key + "[]']").each(function () {
            tagName = $(this)[0].tagName;
            type = $(this).attr('type');
            if (tagName == 'INPUT') {
                if (type == 'radio') {
                    $(this).attr('checked', $(this).val() == value);
                } else if (type == 'checkbox') {
                    arr = value.split(',');
                    for (var i = 0; i < arr.length; i++) {
                        if ($(this).val() == arr[i]) {
                            $(this).attr('checked', true);
                            break;
                        }
                    }
                } else {
                    $(this).val(value);
                }
            } else if (tagName == 'SELECT' || tagName == 'TEXTAREA') {
                $(this).val(value);
            }

        });
    }
}


/**
 * 判断空对象
 * @param obj
 * @returns {boolean}
 */
function isEmpty(obj) {
    for (var name in obj) {
        return false;
    }
    return true;
}

function getPagingation(pager, divid) {
    var paginSize = 10;//默认页码数
    var pangination = '<ul class="pagination">';
    if (pager.page == 1)
        pangination += '<li class="disabled"><a href="javascript:;">&laquo;</a></li>';
    else
        pangination += '<li ><a href="javascript:;" onclick="goPage(' + (pager.page - 1) + ')">&laquo;</a></li>';

    var start = 1;
    var end = 0;

    if (pager.total <= paginSize) {
        start = 1;
        end = pager.total + 1;
    } else {
        var paginTotal = parseInt((pager.total + paginSize - 1) / paginSize);
        var currentPage = parseInt((pager.page + paginSize - 1) / paginSize);
        start = (currentPage - 1) * paginSize + 1;
        if (paginTotal == currentPage) {
            end = start + parseInt(pager.total % paginSize == 0 ? paginSize : pager.total % paginSize);
        }
        else
            end = start + paginSize;
    }
    for (; start < end; start++) {
        if (start == pager.page)
            pangination += '<li class="active"><a href="javascript:;">' + start + '</a></li>';
        else
            pangination += '<li><a href="javascript:;" onclick="goPage(' + start + ')">' + start + '</a></li>';
    }
    if (pager.page == pager.total || pager.total == 0) {
        pangination += '<li class="disabled"><a href="javascript:;">&raquo;</a></li>';
    } else
        pangination += '<li><a href="javascript:;" onclick="goPage(' + (pager.page + 1) + ')">&raquo;</a></li>';
    pangination += '<li><div  class="jumpInput">GO<input type="text" onkeydown="jumpBykey()" id="input_page_num" style="width: 34px;" />';
    pangination += '<a href="javascript:;" onclick="jumpToPage()" ><i class="fa fa-search"></i></a>';
    pangination += ',共' + pager.total + '页/' + pager.records + '条记录</div></li></ul>';
    $("#" + divid).html(pangination);
}
function jumpToPage() {
    var pageNum = $("#input_page_num").val();
    if (/\d+/.test(pageNum))
        goPage(pageNum);
}
function jumpBykey() {
    if (event.keyCode == "13") {//keyCode=13是回车键
        jumpToPage();
    }
}

function changeColor(gridId) {
    var ids = $(gridId).getDataIDs();
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqGrid").getRowData(ids[i]);
        if (rowData.dataColor != '') {
            $('#' + ids[i]).find("td").css("background-color", rowData.dataColor);
        }
    }
}


function rgb2hex(rgb) {
    rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    function hex(x) {
        return ("0" + parseInt(x).toString(16)).slice(-2);
    }

    return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}


function getRandom0to6(){
    var seed = 0;
    while((seed=parseInt(Math.random()*10))>6){
    }
    return seed;
}